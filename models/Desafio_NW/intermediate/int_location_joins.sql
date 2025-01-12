
with
    address as (
        select *  from {{ ref("stg_nw__address")}}
    )
    
    , state_province as (
        select * from {{ ref("stg_nw__stateprovince")}}
    )
  
    , country_region as (
        select * from {{ ref("stg_nw__countryregion")}}
    )

    , joined as (
        select
        address.PK_ADDRESSID
        , address.CITY
        , state_province.STATE_NAME
        , country_region.COUNTRY_NAME

        from address
        left join state_province on state_province.PK_STATEPROVINCEID = address.FK_STATEPROVINCEID
        left join country_region on country_region.PK_COUNTRYREGIONCODE = state_province.FK_COUNTRYREGIONCODE
    )

select * from joined