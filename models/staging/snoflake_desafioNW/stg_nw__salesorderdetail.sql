with
    fonte_salesorderdetail as(
        select * from {{ source('snowflake_desafioNW', 'SALESORDERDETAIL') }}
    )

    , rename_table as (
        select 
            
        cast(SALESORDERID as int) as FK_SALESORDERID
        , cast(SALESORDERDETAILID as int) as PK_ORDERDETAILID
        , cast(PRODUCTID as int) as FK_PRODUCTID
        , cast(SPECIALOFFERID as int) as FK_SPECIALOFFERID
        , cast(ORDERQTY as int) as QUANTITY
        , cast(UNITPRICE as numeric(18,4)) as UNIT_PRICE
        , cast(UNITPRICEDISCOUNT as float) as UNITPRICEDISCOUNT
        
        from fonte_salesorderdetail

    )

    select * from rename_table