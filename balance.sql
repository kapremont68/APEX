select sum(C#SUMMA) from T#PAY_SOURCE where C#OPS_ID is not null and C#ACC_ID = 92022;


select * from T#PAY_SOURCE where C#OPS_ID is not null and C#ACC_ID = 92022;

select * from T#CHARGE where C#ACCOUNT_ID = 92022;


with
    ch as (
        select
            1 NN,
            C#ACCOUNT_ID ACCOUNT_ID,
            C#A_MN MN,
            P#UTILS.GET#TARIF(C#ACCOUNT_ID,P#MN_UTILS.GET#DATE(C#A_MN)) TARIF,
            C#VOL VOL,
            C#SUM CHARGE_SUM
        from
            T#CHARGE
    )
    ,pay as (
        SELECT
            2 NN,
            coalesce(C#ACC_ID,C#ACC_ID_CLOSE,C#ACC_ID_TTER) ACCOUNT_ID,
            P#MN_UTILS.GET#MN(C#REAL_DATE) MN,
            C#REAL_DATE REAL_DATE,
            C#PERIOD PAY_PERIOD,
            C#COD_RKC RKC_CODE,
            R.C#NAME RKC_NAME,
            C#ACCOUNT ACCOUNT_NUM,
            C#SUMMA PAY_SUM,
            C#COMMENT PAY_COMMENT,
            C#PLAT PAYER
        from
            T#PAY_SOURCE P
            left join T#OUT_PROC R on (P.C#COD_RKC = R.C#CODE)
        where
            C#OPS_ID is not null
    )
    ,alls as (
        select
            NN,
            ACCOUNT_ID,
            MN,
            TO_CHAR(P#MN_UTILS.GET#DATE(MN),'mm.yyyy') MN_PER,
            TARIF,
            VOL,
            null REAL_DATE,
            null PAY_PERIOD,
            null RKC_NAME,
            null ACCOUNT_NUM,
            null PAY_COMMENT,
            null PAYER,
            CHARGE_SUM,
            null PAY_SUM
        from
            ch
        union all
        select
            NN,
            ACCOUNT_ID,
            MN,
            null MN_PER,
            null TARIF,
            null VOL,
            REAL_DATE,
            PAY_PERIOD,
            RKC_NAME,
            ACCOUNT_NUM,
            PAY_COMMENT,
            PAYER,
            null CHARGE_SUM,
            PAY_SUM
        from
            pay

    )
select
    alls.*,
    sum(CHARGE_SUM)  over (order by MN, NN, REAL_DATE) CHARGE_TOTAL,
    sum(PAY_SUM)  over (order by MN, NN, REAL_DATE) PAY_TOTAL,
    sum(NVL(PAY_SUM,0) - NVL(CHARGE_SUM,0)) over (order by MN, NN, REAL_DATE) BALANCE
from
    alls
where
    ACCOUNT_ID = 92022
order by
    MN, NN, REAL_DATE
;


