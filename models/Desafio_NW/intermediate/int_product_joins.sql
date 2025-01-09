with
    product as (
        select
        *
        from {{ ref("stg_nw__product")}}
    )

    , product_category as (
        select
        *
        from {{ ref("stg_nw__productcategory")}}
    )
    
    , product_subcategory as (
        select
        *
        from {{ ref("stg_nw__productsubcategory")}}
    )
 

    , joined_category as (
        select
        product_subcategory.PK_PRODUCTSUBCATEGORYID
        , product_subcategory.NAME_SUBCATEGORY_PRODUCT
        , product_category.NAME_CATEGORY_PRODUCT
        from product_subcategory
        left join product_category on product_category.PK_PRODUCTCATEGORYID = product_subcategory.FK_PRODUCTCATEGORYID
    )



    , joined as (
        select
        product.PK_PRODUCTID
        , product.STANDARDCOST
        , product.LISTPRICE
        , product.PRODUCT_NAME
        , product.PRODUCT_COLOR
        , product.PRODUCT_SIZE
        , product.PRODUCT_WEIGHT
        , coalesce(joined_category.NAME_SUBCATEGORY_PRODUCT, 'Unknown') as NAME_SUBCATEGORY_PRODUCT
        , coalesce(joined_category.NAME_CATEGORY_PRODUCT, 'Unknown') as NAME_CATEGORY_PRODUCT
        from product
        left join joined_category on joined_category.PK_PRODUCTSUBCATEGORYID = product.FK_PRODUCTSUBCATEGORYID
    )


    , metrics as (
        select 
            joined. *
            , LISTPRICE - STANDARDCOST as PRODUCT_MARGEN
        from joined
    )


    , final_table as (
        select
        PK_PRODUCTID
        , STANDARDCOST
        , LISTPRICE
        , PRODUCT_MARGEN
        , PRODUCT_NAME
        , PRODUCT_COLOR
        , PRODUCT_SIZE
        , PRODUCT_WEIGHT
        , NAME_SUBCATEGORY_PRODUCT
        , NAME_CATEGORY_PRODUCT
        from metrics
    )

select * from final_table