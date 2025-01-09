with
    staging as (
        select
        PK_CREDITCARDID
        , CARDTYPE
        from {{ ref("stg_nw__creditcard")}}
    )

select * from staging