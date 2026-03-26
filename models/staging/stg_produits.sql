WITH source AS (
    SELECT * FROM {{ source('raw', 'produits') }}
)

SELECT
    id_produit,
    UPPER(nom_produit)                  AS nom_produit,
    INITCAP(categorie)                  AS categorie,
    prix::DECIMAL(10,2)                 AS prix,
    updated_at::TIMESTAMP               AS updated_at
FROM source