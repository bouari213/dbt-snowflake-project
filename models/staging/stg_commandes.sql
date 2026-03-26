WITH source AS (
    SELECT * FROM {{ source('raw', 'commandes') }}
)

SELECT
    id_commande,
    id_client,
    id_produit,
    quantite,
    montant::DECIMAL(10,2)              AS montant,
    LOWER(statut)                       AS statut,
    date_commande::DATE                 AS date_commande,
    updated_at::TIMESTAMP               AS updated_at
FROM source