with
    fonte_person as(
        select * from {{ source('snowflake_desafioNW', 'person') }}
    )

    , rename_person as (
        select 
            
           cast(BUSINESSENTITYID as int) as pk_personid
            --PERSONTYPE
            --NAMESTYLE
            --TITLE
            , FIRSTNAME || ' ' || MIDDLENAME || ' ' || LASTNAME as perdon_fullname
            --SUFFIX
            --EMAILPROMOTION
            --ADDITIONALCONTACTINFO
            --DEMOGRAPHICS
            --ROWGUID
            --MODIFIEDDATE
        
        from fonte_person

    )

    select * from rename_person