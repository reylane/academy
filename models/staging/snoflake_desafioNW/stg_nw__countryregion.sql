with
    fonte_countryregion as(
        select * from {{ source('snowflake_desafioNW', 'countryregion') }}
    )

    , rename_table as (
        select 
            cast(COUNTRYREGIONCODE as varchar) as PK_COUNTRYREGIONCODE
            , cast(NAME as varchar) as COUNTRY_NAME

            --MODIFIEDDATE
            
        
        from fonte_countryregion
    )

    select * from rename_table