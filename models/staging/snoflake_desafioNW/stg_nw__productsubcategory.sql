with
    fonte_productsubcategory as(
        select * from {{ source('snowflake_desafioNW', 'PRODUCTSUBCATEGORY') }}
    )

    , rename_table as (
        select 
            
        cast(PRODUCTSUBCATEGORYID as int) as PK_PRODUCTSUBCATEGORYID
        , cast(PRODUCTCATEGORYID as int) as FK_PRODUCTCATEGORYID
        , cast(NAME as varchar) as NAME_SUBCATEGORY_PRODUCT
        
        from fonte_productsubcategory

    )

    select * from rename_table