with
    fonte_product as(
        select * from {{ source('snowflake_desafioNW', 'PRODUCT') }}
    )

    , rename_table as (
        select 
            
        cast(PRODUCTID as int) as PK_PRODUCTID
        , cast(PRODUCTSUBCATEGORYID as int) as FK_PRODUCTSUBCATEGORYID
        , cast(SELLSTARTDATE as date) as SELLSTARTDATE
        , cast(SELLENDDATE as date) as SELLENDDATE
        , cast(NAME as varchar) as PRODUCT_NAME 
        , cast(COLOR as varchar) as PRODUCT_COLOR
        , cast(SAFETYSTOCKLEVEL as int) as SAFETYSTOCK
        , cast(REORDERPOINT as int) as REORDERPOINT
        , cast(STANDARDCOST as float) as STANDARDCOST
        , cast(LISTPRICE as float) as LISTPRICE
        , cast(SIZE as varchar) as PRODUCT_SIZE
        , cast(WEIGHT as int) as PRODUCT_WEIGHT
        
        from fonte_product

    )

    select * from rename_table