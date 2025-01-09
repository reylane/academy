with
    fonte_person as(
        select * from {{ source('snowflake_desafioNW', 'person') }}
    )

    , rename_table as (
        select 
            
            cast(BUSINESSENTITYID as int) as pk_personid
            , FIRSTNAME || ' ' || MIDDLENAME || ' ' || LASTNAME as person_fullname
            --PERSONTYPE
            --NAMESTYLE
            --TITLE
            --SUFFIX
            --EMAILPROMOTION
            --ADDITIONALCONTACTINFO
            --DEMOGRAPHICS
            --ROWGUID
            --MODIFIEDDATE
        
        from fonte_person

    )

    select * from rename_table