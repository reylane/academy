with
    fonte_customer as(
        select * from {{ source('snowflake_desafioNW', 'CUSTOMER') }}
    )

    , rename_table as (
        select 
            cast(CUSTOMERID as int) as PK_CUSTOMERID
            , cast(PERSONID as int) as FK_PERSONID
            , cast(STOREID as int) as FK_STOREID
            , cast(TERRITORYID as int) as FK_TERRITORYID
            
        
        from fonte_customer
    )

    select * from rename_table