with
    fonte_salesorderheadersalesreason as(
        select * from {{ source('snowflake_desafioNW', 'SALESORDERHEADERSALESREASON') }}
    )

    , rename_table as (
        select 
            
        cast(SALESORDERID as int) as PK_SALESORDERID
        , cast(SALESREASONID as int) as FK_SALESREASONID
        
        from fonte_salesorderheadersalesreason

    )

    select * from rename_table