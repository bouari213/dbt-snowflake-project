WITH ventes AS (
    SELECT * FROM {{ ref('fct_ventes') }}
),

kpis AS (
    SELECT
        DATE_TRUNC('month', date_commande)  AS mois,
        categorie_produit,
        ville_client,
        COUNT(id_commande)                  AS nb_commandes,
        SUM(montant)                        AS chiffre_affaires,
        AVG(montant)                        AS panier_moyen,
        COUNT(DISTINCT email_client)        AS nb_clients_uniques,
        SUM(CASE WHEN statut = 'livree' 
            THEN montant ELSE 0 END)        AS ca_livre,
        SUM(CASE WHEN statut = 'annulee' 
            THEN montant ELSE 0 END)        AS ca_annule,
        SUM(CASE WHEN statut = 'en_cours' 
            THEN montant ELSE 0 END)        AS ca_en_cours
    FROM ventes
    GROUP BY 1, 2, 3
)

SELECT * FROM kpis