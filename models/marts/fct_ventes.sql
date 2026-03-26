WITH commandes_enrichies AS (
    SELECT * FROM {{ ref('int_commandes_enrichies') }}
),

final AS (
    SELECT
        {{ dbt_utils.generate_surrogate_key(['id_commande', 'id_client']) }} AS sk_vente,
        id_commande,
        date_commande,
        nom_client,
        prenom_client,
        email_client,
        ville_client,
        nom_produit,
        categorie_produit,
        prix_unitaire,
        quantite,
        montant,
        statut
    FROM commandes_enrichies
)

SELECT * FROM final