with
    fonte_salesreason as(
        select * from {{ source('snowflake_desafioNW', 'SALESREASON') }}
    )

    , rename_table as (
        select 
            
        cast(SALESREASONID as int) as PK_SALESREASONID
        ,cast(NAME as varchar) as NAME_SALESREASON
        ,cast(REASONTYPE as varchar) as TYPE_SALESREASON
        
        from fonte_salesreason

    )

    select * from rename_table