WITH source AS (
    SELECT * FROM {{ source('raw', 'clients') }}
)

SELECT
    id_client,
    UPPER(nom)                          AS nom,
    INITCAP(prenom)                     AS prenom,
    LOWER(email)                        AS email,
    ville,
    date_inscription::DATE              AS date_inscription,
    updated_at::TIMESTAMP               AS updated_at
FROM source