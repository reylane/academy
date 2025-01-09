with
    fonte_productcategory as(
        select * from {{ source('snowflake_desafioNW', 'PRODUCTCATEGORY') }}
    )

    , rename_table as (
        select 
            
        cast(PRODUCTCATEGORYID as int) as PK_PRODUCTCATEGORYID
        , cast(NAME as varchar) as NAME_CATEGORY_PRODUCT
        
        from fonte_productcategory

    )

    select * from rename_table