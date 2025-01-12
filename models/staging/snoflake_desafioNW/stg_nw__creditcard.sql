with
    fonte_creditcard as (
        select * from {{ source('snowflake_desafioNW', 'CREDITCARD') }}
    )

    , rename_table as (
        select 
            cast(CREDITCARDID as int) as PK_CREDITCARDID
            , cast(CARDTYPE as varchar) as CARDTYPE

            --CARDNUMBER
            --EXPMONTH
            --EXPYEAR
            --MODIFIEDDATE
            
        
        from fonte_creditcard
    )

    select * from rename_table
