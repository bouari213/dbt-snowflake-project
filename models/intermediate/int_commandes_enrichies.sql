WITH commandes AS (
    SELECT * FROM {{ ref('stg_commandes') }}
),

clients AS (
    SELECT * FROM {{ ref('stg_clients') }}
),

produits AS (
    SELECT * FROM {{ ref('stg_produits') }}
),

final AS (
    SELECT
        c.id_commande,
        c.date_commande,
        c.quantite,
        c.montant,
        c.statut,
        cl.id_client,
        cl.nom                          AS nom_client,
        cl.prenom                       AS prenom_client,
        cl.email                        AS email_client,
        cl.ville                        AS ville_client,
        p.id_produit,
        p.nom_produit,
        p.categorie                     AS categorie_produit,
        p.prix                          AS prix_unitaire
    FROM commandes c
    LEFT JOIN clients cl
        ON c.id_client = cl.id_client
    LEFT JOIN produits p
        ON c.id_produit = p.id_produit
)

SELECT * FROM final