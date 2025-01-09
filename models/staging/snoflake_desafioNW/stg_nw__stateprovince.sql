with
    fonte_stateprovince as(
        select * from {{ source('snowflake_desafioNW', 'stateprovince') }}
    )

    , rename_table as (
        select 
        cast(STATEPROVINCEID as int) as PK_STATEPROVINCEID
        , cast(COUNTRYREGIONCODE as varchar) as FK_COUNTRYREGIONCODE
        , cast(TERRITORYID as varchar) as FK_TERRITORYID
        , cast(NAME as varchar) as STATE_NAME

            --STATEPROVINCECODE
            --ISONLYSTATEPROVINCEFLAG
            --ROWGUID
            --MODIFIEDDATE
            
        
        from fonte_stateprovince

    )

    select * from rename_table
