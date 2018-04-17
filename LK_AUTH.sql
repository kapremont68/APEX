CREATE OR REPLACE PACKAGE lk_auth AS
    PROCEDURE add_new_user (
        p_email      IN VARCHAR2,
        p_password   IN VARCHAR2
    );

    FUNCTION add_email_guid (
        p_email VARCHAR2
    ) RETURN VARCHAR2;

    FUNCTION check_guid (
        p_guid       IN VARCHAR2,
        p_res_text   OUT VARCHAR2
    ) RETURN BOOLEAN;

    FUNCTION get_email_by_guid (
        p_guid VARCHAR2
    ) RETURN VARCHAR2;

    PROCEDURE update_password (
        p_new_password VARCHAR2,
        p_guid VARCHAR2
    );

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
            apex_util.get_hash(apex_t_varchar2(p_email,p_password) )
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

    FUNCTION check_guid (
        p_guid       IN VARCHAR2,
        p_res_text   OUT VARCHAR2
    ) RETURN BOOLEAN AS
        rec           lk_emails_guids%rowtype;
        email_valid   CHAR(1);
    BEGIN
        SELECT
            *
        INTO
            rec
        FROM
            lk_emails_guids
        WHERE
            guid = p_guid;

        IF
            rec.id IS NOT NULL
        THEN
            SELECT
                valid
            INTO
                email_valid
            FROM
                lk_users
            WHERE
                email = rec.email;

            IF
                email_valid = 'Y'
            THEN
                p_res_text := 'Адрес '
                || rec.email
                || ' уже был подтвержден ранее';
                RETURN false;
            END IF;

            IF
                rec.used = 'Y'
            THEN
                p_res_text := 'Код подтверждения уже использовался ранее';
                RETURN false;
            END IF;
            IF
                rec.row_time + 3 < SYSDATE ()
            THEN
                p_res_text := 'Код подтверждения просрочен (прошло более 3 дней)';
                RETURN false;
            END IF;

            UPDATE lk_emails_guids
                SET
                    used = 'Y'
            WHERE
                id = rec.id;

            UPDATE lk_users
                SET
                    valid = 'Y'
            WHERE
                email = rec.email;

            COMMIT;
        END IF;

        p_res_text := 'Адрес '
        || rec.email
        || ' успешно подтвержден';
        RETURN true;
    EXCEPTION
        WHEN no_data_found THEN
            p_res_text := 'Код подтверждения не найден';
            RETURN false;
    END check_guid;
----------------------------------------------

    FUNCTION get_email_by_guid (
        p_guid VARCHAR2
    ) RETURN VARCHAR2 AS
        a_email   VARCHAR2(50);
    BEGIN
        SELECT
            email
        INTO
            a_email
        FROM
            lk_emails_guids
        WHERE
            guid = p_guid;

        RETURN a_email;
    EXCEPTION
        WHEN no_data_found THEN
            raise_application_error(-20000,'Пользователь с таким email не найден');
    END get_email_by_guid;
------------------------------------------------

    PROCEDURE update_password (
        p_new_password VARCHAR2,
        p_guid VARCHAR2
    ) AS
        a_email   VARCHAR2(50);
    BEGIN
        a_email := get_email_by_guid(p_guid);
        UPDATE lk_users
            SET
                password = apex_util.get_hash(apex_t_varchar2(a_email,p_new_password) )
        WHERE
            email = a_email;

        COMMIT;
--    EXCEPTION
--        WHEN dup_val_on_index THEN
--            raise_application_error(-20000,'Такой email уже зарегистрирован');
    END update_password;

END lk_auth;
/
