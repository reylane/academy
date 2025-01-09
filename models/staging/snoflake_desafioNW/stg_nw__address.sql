with
    fonte_address as(
        select * from {{ source('snowflake_desafioNW', 'address') }}
    )

    , rename_table as (
        select 
        
            cast(ADDRESSID as int) as PK_ADDRESSID
            --ADDRESSLINE1
            --ADDRESSLINE2
            , cast(CITY as varchar) as CITY
            , cast(STATEPROVINCEID as int) as FK_STATEPROVINCEID
            --POSTALCODE
            --SPATIALLOCATION
           -- ROWGUID
            --MODIFIEDDATE
        
        from fonte_address

    )

    select * from rename_table