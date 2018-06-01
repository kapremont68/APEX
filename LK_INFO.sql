CREATE OR REPLACE PACKAGE lk_info AS
    PROCEDURE add_user_account (
        p_user_email   VARCHAR2,
        p_house_id     NUMBER,
        p_flat_num     VARCHAR2,
        p_acc_num      VARCHAR2
    );

    PROCEDURE get_user_balance (
        p_user_email   IN VARCHAR2,
        p_balance      OUT VARCHAR2,
        p_color        OUT VARCHAR2
    );

END lk_info;
/


CREATE OR REPLACE PACKAGE BODY lk_info AS

    PROCEDURE add_user_account (
        p_user_email   VARCHAR2,
        p_house_id     NUMBER,
        p_flat_num     VARCHAR2,
        p_acc_num      VARCHAR2
    ) AS

        a_acc_id       NUMBER;
        a_room_id      NUMBER;
        a_user_id      NUMBER;
        a_area_val     NUMBER;
        a_addr         VARCHAR2(100);
        a_living_tag   VARCHAR2(1);
    BEGIN
        SELECT
            account_id
        INTO
            a_acc_id
        FROM
            v_account_nums
        WHERE
            house_id = p_house_id
            AND   lower(TRIM(flat_num) ) = lower(TRIM(p_flat_num) )
            AND   lower(TRIM(account_num) ) = lower(TRIM(p_acc_num) )
            AND   ROWNUM < 2;

        SELECT
            room_id,
            living_tag,
            area_val
        INTO
            a_room_id,a_living_tag,a_area_val
        FROM
            v_rooms
        WHERE
            account_id = a_acc_id;

        SELECT
            addr
            || ', '
            ||
                CASE
                    WHEN a_living_tag = 'Y' THEN 'кв. '
                    ELSE 'пом. '
                END
            || p_flat_num
        INTO
            a_addr
        FROM
            v_house_addr
        WHERE
            house_id = p_house_id;

        a_user_id := lk_auth.get_userid_by_email(p_user_email);
        IF
            ( a_user_id IS NOT NULL ) AND ( a_acc_id IS NOT NULL ) AND ( a_room_id IS NOT NULL )
        THEN
            INSERT INTO lk_user_accounts (
                user_id,
                house_id,
                flat_num,
                account_num,
                account_id,
                room_id,
                addr,
                area_val
            ) VALUES (
                a_user_id,
                p_house_id,
                TRIM(p_flat_num),
                TRIM(p_acc_num),
                a_acc_id,
                a_room_id,
                a_addr,
                a_area_val
            );

            COMMIT;
        ELSE
            RAISE no_data_found;
        END IF;

    EXCEPTION
        WHEN no_data_found THEN
            raise_application_error(-20000,'ѕомещение с таким адресом и номером счета не найдено.');
        WHEN dup_val_on_index THEN
            raise_application_error(-20000,'Ёто помещение уже в списке "ћои помещени€".');
    END add_user_account;

    PROCEDURE get_user_balance (
        p_user_email   IN VARCHAR2,
        p_balance      OUT VARCHAR2,
        p_color        OUT VARCHAR2
    ) AS
        a_balance   NUMBER;
    BEGIN
        SELECT
            -1 * SUM(dolg_sum_total)
        INTO
            a_balance
        FROM
            lk_user_accounts u
            JOIN v_total_account t ON ( u.account_id = t.account_id
                                        AND t.mn = (
                SELECT
                    MAX(mn)
                FROM
                    v_total_account
            ) )
        WHERE
            user_id = (
                SELECT
                    lk_auth.get_userid_by_email(p_user_email)
                FROM
                    dual
            );

        p_balance := TO_CHAR(a_balance);
        IF
            a_balance < 0
        THEN
            p_color := 'red';
        ELSE
            p_color := 'green';
        END IF;

    END get_user_balance;

END lk_info;
/
