WITH adwords AS (
  SELECT
    date_date,
    paid_source,
    campaign_key,
    campaign_name,
    ads_cost,
    impression,
    click
  FROM {{ ref("stg_raw__adwords") }}
),
bing AS (
  SELECT
    date_date,
    paid_source,
    campaign_key,
    campaign_name,
    ads_cost,
    impression,
    click
  FROM {{ ref("stg_raw__bing")}}
),
criteo AS (
  SELECT
    date_date,
    paid_source,
    campaign_key,
    campaign_name,
    ads_cost,
    impression,
    click
  FROM {{ ref("stg_raw__criteo") }}
),
facebook AS (
  SELECT
    date_date,
    paid_source,
    campaign_key,
    campaign_name,
    ads_cost,
    impression,
    click
  FROM {{ ref("stg_raw__facebook") }}
)
SELECT * FROM adwords
UNION ALL
SELECT * FROM bing
UNION ALL
SELECT * FROM criteo
UNION ALL
SELECT * FROM facebook