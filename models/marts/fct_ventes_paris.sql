WITH ventes AS (
    SELECT * FROM {{ ref('fct_ventes') }}
)

SELECT
    sk_vente,
    id_commande,
    date_commande,
    nom_client,
    prenom_client,
    email_client,
    nom_produit,
    categorie_produit,
    prix_unitaire,
    quantite,
    montant,
    statut
FROM ventes
WHERE ville_client = 'Paris'