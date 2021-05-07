{% snapshot orders_snapshot %}

    {{
        config(
          target_database='analytics',
          target_schema='snapshots',
          strategy='timestamp',
          unique_key='id',
          updated_at='_ETL_LOADED_AT',
        )
    }}

    select * from {{ source('jaffle_shop', 'orders') }}

{% endsnapshot %}