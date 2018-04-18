CREATE OR REPLACE PACKAGE lk_auth AS
    PROCEDURE add_new_user (
        p_email      IN VARCHAR2,
        p_password   IN VARCHAR2
    );

    FUNCTION add_email_guid (
        p_email VARCHAR2
    ) RETURN VARCHAR2;

    FUNCTION check_confirm_guid (
        p_guid IN VARCHAR2
    ) RETURN CHAR;

    FUNCTION check_reset_guid (
        p_guid IN VARCHAR2
    ) RETURN CHAR;

    FUNCTION get_email_by_guid (
        p_guid VARCHAR2
    ) RETURN VARCHAR2;

    PROCEDURE update_password (
        p_new_password VARCHAR2,
        p_guid VARCHAR2
    );

    FUNCTION lk_authentication (
        p_username   IN VARCHAR2,
        p_password   IN VARCHAR2
    ) RETURN BOOLEAN;

    FUNCTION user_is_valid (
        p_email VARCHAR2
    ) RETURN BOOLEAN;

    FUNCTION get_hash (
        p_email VARCHAR2,
        p_password VARCHAR2
    ) RETURN VARCHAR2;

END lk_auth;
/


CREATE OR REPLACE PACKAGE BODY lk_auth AS

---------------------------------------------------

    PROCEDURE add_new_user (
        p_email      IN VARCHAR2,
        p_password   IN VARCHAR2
    )
        AS
    BEGIN
        INSERT INTO lk_users (
            email,
            password
        ) VALUES (
            p_email,
            get_hash(p_email, p_password)
        );

        COMMIT;
    EXCEPTION
        WHEN dup_val_on_index THEN
            raise_application_error(-20000,'Такой email уже зарегистрирован');
    END add_new_user;
---------------------------------------------------

    FUNCTION add_email_guid (
        p_email VARCHAR2
    ) RETURN VARCHAR2 AS
        a_new_guid   VARCHAR2(100);
    BEGIN
        SELECT
            email
        INTO
            a_new_guid
        FROM
            lk_users
        WHERE
            email = p_email;

        a_new_guid := sys_guid ();
        INSERT INTO lk_emails_guids (
            email,
            guid
        ) VALUES (
            p_email,
            a_new_guid
        );

        COMMIT;
        RETURN a_new_guid;
    EXCEPTION
        WHEN no_data_found THEN
            raise_application_error(-20000,'Пользователь с таким email не найден');
    END add_email_guid;
---------------------------------------------------

    FUNCTION check_confirm_guid (
        p_guid IN VARCHAR2
    ) RETURN CHAR AS
        a_email   VARCHAR2(50);
    BEGIN
        a_email := get_email_by_guid(p_guid);
        IF
            ( a_email IS NOT NULL ) AND ( NOT user_is_valid(a_email) )
        THEN
            UPDATE lk_emails_guids
                SET
                    used = 'Y'
            WHERE
                guid = p_guid;

            UPDATE lk_users
                SET
                    valid = 'Y'
            WHERE
                email = a_email;

            COMMIT;
            RETURN 'Y';
        END IF;

        RETURN 'N';
    END check_confirm_guid;
----------------------------------------------

    FUNCTION check_reset_guid (
        p_guid IN VARCHAR2
    ) RETURN CHAR
        AS
    BEGIN
        RETURN
            CASE
                WHEN get_email_by_guid(p_guid) IS NULL THEN 'N'
                ELSE 'Y'
            END;
    END check_reset_guid;
----------------------------------------------

    FUNCTION get_email_by_guid (
        p_guid VARCHAR2
    ) RETURN VARCHAR2 AS
        a_email   VARCHAR2(50);
    BEGIN
        SELECT
            lower(TRIM(email) )
        INTO
            a_email
        FROM
            lk_emails_guids
        WHERE
            guid = p_guid
            AND   used IS NULL;

        RETURN a_email;
    EXCEPTION
        WHEN no_data_found THEN
            RETURN NULL;
    END get_email_by_guid;
------------------------------------------------

    PROCEDURE update_password (
        p_new_password VARCHAR2,
        p_guid VARCHAR2
    ) AS
        a_email   VARCHAR2(50);
    BEGIN
        a_email := get_email_by_guid(p_guid);
        IF
            a_email IS NULL
        THEN
            raise_application_error(-20000,'Ссылка для смены пароля уже использована ранее или содержит ошибку.');
        END IF;
        UPDATE lk_users
            SET
                password = get_hash(a_email, p_new_password),
                valid = 'Y'
        WHERE
            email = a_email;

        UPDATE lk_emails_guids
            SET
                used = 'Y'
        WHERE
            guid = p_guid;

        COMMIT;
    END update_password;
----------------------------------------------------------

    FUNCTION lk_authentication (
        p_username   IN VARCHAR2,
        p_password   IN VARCHAR2
    ) RETURN BOOLEAN AS
        rec   lk_users%rowtype;
    BEGIN
        SELECT
            *
        INTO
            rec
        FROM
            lk_users
        WHERE
            email = lower(TRIM(p_username) );

        IF
            rec.valid IS NULL
        THEN
            raise_application_error(-20000,'Сперва необходимо подтвердить регистрацию. Проверьте почту.');
        END IF;
        RETURN rec.password = get_hash(p_username, p_password);
    EXCEPTION
        WHEN no_data_found THEN
            RETURN false;
    END lk_authentication;
-------------------------------------------------------------

    FUNCTION user_is_valid (
        p_email VARCHAR2
    ) RETURN BOOLEAN AS
        a_valid   CHAR;
    BEGIN
        SELECT
            valid
        INTO
            a_valid
        FROM
            lk_users
        WHERE
            email = p_email
            AND   valid IS NOT NULL;

        RETURN true;
    EXCEPTION
        WHEN no_data_found THEN
            RETURN false;
    END user_is_valid;

    FUNCTION get_hash (
        p_email VARCHAR2,
        p_password VARCHAR2
    ) RETURN VARCHAR2
        AS
    BEGIN
        RETURN apex_util.get_hash(apex_t_varchar2(lower(trim(p_email)),p_password),NULL);
    END get_hash;

END lk_auth;
/
