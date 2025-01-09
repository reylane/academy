with
    fonte_person as(
        select * from {{ source('snowflake_desafioNW', 'person') }}
    )

    , rename_table as (
        select 
            
           cast(BUSINESSENTITYID as int) as PK_PERSONID
            , FIRSTNAME || ' ' || MIDDLENAME || ' ' || LASTNAME as PERSON_FULL_NAME
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