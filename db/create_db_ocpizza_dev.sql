
CREATE SCHEMA IF NOT EXISTS ocpizza_dev;

CREATE SEQUENCE IF NOT EXISTS ocpizza_dev.formule_id_seq;

CREATE TABLE IF NOT EXISTS ocpizza_dev.Formule (
                id INTEGER NOT NULL DEFAULT nextval('ocpizza_dev.formule_id_seq'),
                nom VARCHAR(50) NOT NULL,
                prixHTFormule NUMERIC(5,2),
                CONSTRAINT formule_pk PRIMARY KEY (id)
);


ALTER SEQUENCE IF EXISTS ocpizza_dev.formule_id_seq OWNED BY ocpizza_dev.Formule.id;

CREATE UNIQUE INDEX IF NOT EXISTS formule_idx
 ON ocpizza_dev.Formule
 ( nom );

CREATE SEQUENCE IF NOT EXISTS ocpizza_dev.categorie_nom_seq;

CREATE TABLE IF NOT EXISTS ocpizza_dev.Categorie (
                id INTEGER NOT NULL DEFAULT nextval('ocpizza_dev.categorie_nom_seq'),
                nom VARCHAR(50) NOT NULL,
                CONSTRAINT categorie_pk PRIMARY KEY (id)
);


ALTER SEQUENCE IF EXISTS ocpizza_dev.categorie_nom_seq OWNED BY ocpizza_dev.Categorie.id;

CREATE TABLE IF NOT EXISTS ocpizza_dev.CategorieParFormule (
                formuleId INTEGER NOT NULL,
                categorieId INTEGER NOT NULL,
                quantite INTEGER NOT NULL,
                CONSTRAINT categorieparformule_pk PRIMARY KEY (formuleId, categorieId)
);


CREATE SEQUENCE IF NOT EXISTS ocpizza_dev.ingredient_id_seq;

CREATE TABLE IF NOT EXISTS ocpizza_dev.Ingredient (
                id INTEGER NOT NULL DEFAULT nextval('ocpizza_dev.ingredient_id_seq'),
                nom VARCHAR(100) NOT NULL,
                prixHTSiSupplement NUMERIC(4,2) NOT NULL,
                CONSTRAINT ingredient_pk PRIMARY KEY (id)
);


ALTER SEQUENCE IF EXISTS ocpizza_dev.ingredient_id_seq OWNED BY ocpizza_dev.Ingredient.id;

CREATE SEQUENCE IF NOT EXISTS ocpizza_dev.produit_reference_seq;

CREATE TABLE IF NOT EXISTS ocpizza_dev.Produit (
                id INTEGER NOT NULL DEFAULT nextval('ocpizza_dev.produit_reference_seq'),
                nom VARCHAR(50) NOT NULL,
                prixUnitaireDeBase NUMERIC(6,2) NOT NULL,
                descriptif VARCHAR(150),
                recette VARCHAR(1000),
                CONSTRAINT produit_pk PRIMARY KEY (id)
);


ALTER SEQUENCE IF EXISTS ocpizza_dev.produit_reference_seq OWNED BY ocpizza_dev.Produit.id;

CREATE UNIQUE INDEX IF NOT EXISTS produit_idx
 ON ocpizza_dev.Produit
 ( nom );

CREATE TABLE IF NOT EXISTS ocpizza_dev.ProduitsParCategorie (
                categorieId INTEGER NOT NULL,
                produitId INTEGER NOT NULL,
                CONSTRAINT produitsparcategorie_pk PRIMARY KEY (categorieId, produitId)
);


CREATE TABLE IF NOT EXISTS ocpizza_dev.IngredientsParProduit (
                produitId INTEGER NOT NULL,
                ingredientId INTEGER NOT NULL,
                quantiteIngredient INTEGER NOT NULL,
                CONSTRAINT ingredientsparproduit_pk PRIMARY KEY (produitId, ingredientId)
);


CREATE SEQUENCE IF NOT EXISTS ocpizza_dev.adresse_adresseid_seq;

CREATE TABLE IF NOT EXISTS ocpizza_dev.Adresse (
                id INTEGER NOT NULL DEFAULT nextval('ocpizza_dev.adresse_adresseid_seq'),
                numeroRue INTEGER NOT NULL,
                rue VARCHAR(150) NOT NULL,
                complement VARCHAR(200),
                codePostal INTEGER NOT NULL,
                ville VARCHAR(30) NOT NULL,
                CONSTRAINT adresse_pk PRIMARY KEY (id)
);


ALTER SEQUENCE IF EXISTS ocpizza_dev.adresse_adresseid_seq OWNED BY ocpizza_dev.Adresse.id;

CREATE SEQUENCE IF NOT EXISTS ocpizza_dev.restaurant_nom_seq;

CREATE TABLE IF NOT EXISTS ocpizza_dev.Restaurant (
                id INTEGER NOT NULL DEFAULT nextval('ocpizza_dev.restaurant_nom_seq'),
                nom VARCHAR(50) NOT NULL,
                horaire VARCHAR NOT NULL,
                adresseId INTEGER NOT NULL,
                CONSTRAINT restaurant_pk PRIMARY KEY (id)
);


ALTER SEQUENCE IF EXISTS ocpizza_dev.restaurant_nom_seq OWNED BY ocpizza_dev.Restaurant.id;

CREATE TABLE IF NOT EXISTS ocpizza_dev.FormuleDuRestaurant (
                formuleId INTEGER NOT NULL,
                restaurantId INTEGER NOT NULL,
                CONSTRAINT formuledurestaurant_pk PRIMARY KEY (formuleId, restaurantId)
);


CREATE TABLE IF NOT EXISTS ocpizza_dev.CategorieParRestaurant (
                categorieId INTEGER NOT NULL,
                restaurantId INTEGER NOT NULL,
                CONSTRAINT categorieparrestaurant_pk PRIMARY KEY (categorieId, restaurantId)
);


CREATE TABLE IF NOT EXISTS ocpizza_dev.RestaurantProduitDispo (
                produitId INTEGER NOT NULL,
                restaurantId INTEGER NOT NULL,
                disponible BOOLEAN NOT NULL,
                stock INTEGER,
                CONSTRAINT restaurantproduitdispo_pk PRIMARY KEY (produitId, restaurantId)
);
COMMENT ON COLUMN ocpizza_dev.RestaurantProduitDispo.stock IS 'la valeur NULL est autoris�e pour les pizzas, dont on ne peut �valuer le stock';


CREATE TABLE IF NOT EXISTS ocpizza_dev.IngredientParRestaurant (
                restaurantId INTEGER NOT NULL,
                ingredientId INTEGER NOT NULL,
                stock NUMERIC(8,2),
                CONSTRAINT ingredientparrestaurant_pk PRIMARY KEY (restaurantId, ingredientId)
);


CREATE SEQUENCE IF NOT EXISTS ocpizza_dev.compte_id_seq;

CREATE TABLE IF NOT EXISTS ocpizza_dev.Compte (
                id INTEGER NOT NULL DEFAULT nextval('ocpizza_dev.compte_id_seq'),
                motDePasse VARCHAR(12) NOT NULL,
                civilite CHAR NOT NULL,
                prenom VARCHAR(50) NOT NULL,
                nom VARCHAR(50) NOT NULL,
                adresseId INTEGER NOT NULL,
                telephone INTEGER NOT NULL,
                dateCreation DATE NOT NULL,
                CONSTRAINT compte_pk PRIMARY KEY (id)
);


ALTER SEQUENCE IF EXISTS ocpizza_dev.compte_id_seq OWNED BY ocpizza_dev.Compte.id;

CREATE TABLE IF NOT EXISTS ocpizza_dev.CompteCollaborateur (
                compteId INTEGER NOT NULL,
                role VARCHAR NOT NULL,
                numeroSecu BIGINT NOT NULL,
                dateNaissance DATE NOT NULL,
                adresseIdGeloLoc INTEGER,
                restaurantId INTEGER NOT NULL,
                email VARCHAR,
                CONSTRAINT comptecollaborateur_pk PRIMARY KEY (compteId)
);
COMMENT ON COLUMN ocpizza_dev.CompteCollaborateur.email IS 'on autorise la valeur null car les CDD, par exemple, n''auront pas besoin de donner leur email';


CREATE UNIQUE INDEX IF NOT EXISTS comptesalarie_idx
 ON ocpizza_dev.CompteCollaborateur
 ( numeroSecu );

CREATE UNIQUE INDEX IF NOT EXISTS comptesalarie_idx1
 ON ocpizza_dev.CompteCollaborateur
 ( email );

CREATE TABLE IF NOT EXISTS ocpizza_dev.CompteClient (
                compteId INTEGER NOT NULL,
                email VARCHAR(100) NOT NULL,
                restaurantId INTEGER,
                adresseLivraisonId INTEGER,
                statutConfirme BOOLEAN NOT NULL,
                dateNaissance DATE,
                CONSTRAINT compteclient_pk PRIMARY KEY (compteId)
);


CREATE UNIQUE INDEX IF NOT EXISTS compteclient_idx
 ON ocpizza_dev.CompteClient
 ( email );

CREATE SEQUENCE IF NOT EXISTS ocpizza_dev.commande_numero_seq;

CREATE TABLE IF NOT EXISTS ocpizza_dev.Commande (
                numero INTEGER NOT NULL DEFAULT nextval('ocpizza_dev.commande_numero_seq'),
                restaurantId INTEGER NOT NULL,
                compteIdClient INTEGER NOT NULL,
                date DATE NOT NULL,
                heure TIME NOT NULL,
                livraisonMode VARCHAR(20) NOT NULL,
                heureLivraisonPrevue TIME NOT NULL,
                paiementEnLigne BOOLEAN NOT NULL,
                moyenDePaiement VARCHAR(20) NOT NULL,
                compteIdPreparateur INTEGER NOT NULL,
                compteIdLivreur INTEGER,
                statut VARCHAR(20) NOT NULL,
                modifiable BOOLEAN NOT NULL,
                CONSTRAINT commande_pk PRIMARY KEY (numero)
);


ALTER SEQUENCE IF EXISTS ocpizza_dev.commande_numero_seq OWNED BY ocpizza_dev.Commande.numero;

CREATE SEQUENCE IF NOT EXISTS ocpizza_dev.lignecommande_id_seq;

CREATE TABLE IF NOT EXISTS ocpizza_dev.LigneCommande (
                id INTEGER NOT NULL DEFAULT nextval('ocpizza_dev.lignecommande_id_seq'),
                commandeNumero INTEGER NOT NULL,
                libelle VARCHAR(100) NOT NULL,
                produitId INTEGER NOT NULL,
                taille VARCHAR NOT NULL,
                quantite INTEGER NOT NULL,
                CONSTRAINT lignecommande_pk PRIMARY KEY (id)
);


ALTER SEQUENCE IF EXISTS ocpizza_dev.lignecommande_id_seq OWNED BY ocpizza_dev.LigneCommande.id;

CREATE TABLE IF NOT EXISTS ocpizza_dev.Supplement (
                ligneCommandeId INTEGER NOT NULL,
                ingredientId INTEGER NOT NULL,
                CONSTRAINT supplement_pk PRIMARY KEY (ligneCommandeId, ingredientId)
);


CREATE SEQUENCE IF NOT EXISTS ocpizza_dev.facture_numerofacture_seq;

CREATE TABLE IF NOT EXISTS ocpizza_dev.Facture (
                numeroFacture INTEGER NOT NULL DEFAULT nextval('ocpizza_dev.facture_numerofacture_seq'),
                commandeNumero INTEGER NOT NULL,
                datePaiement DATE NOT NULL,
                heurePaiement TIME NOT NULL,
                CONSTRAINT facture_pk PRIMARY KEY (numeroFacture)
);


ALTER SEQUENCE IF EXISTS ocpizza_dev.facture_numerofacture_seq OWNED BY ocpizza_dev.Facture.numeroFacture;

ALTER TABLE IF EXISTS ocpizza_dev.FormuleDuRestaurant ADD CONSTRAINT formule_formuledurestaurant_fk
FOREIGN KEY (formuleId)
REFERENCES ocpizza_dev.Formule (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_dev.CategorieParFormule ADD CONSTRAINT formule_categorieparformule_fk
FOREIGN KEY (formuleId)
REFERENCES ocpizza_dev.Formule (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_dev.ProduitsParCategorie ADD CONSTRAINT categorie_produitsparcategorie_fk
FOREIGN KEY (categorieId)
REFERENCES ocpizza_dev.Categorie (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_dev.CategorieParRestaurant ADD CONSTRAINT categorie_categorieparcarte_fk
FOREIGN KEY (categorieId)
REFERENCES ocpizza_dev.Categorie (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_dev.CategorieParFormule ADD CONSTRAINT categorie_categorieparformule_fk
FOREIGN KEY (categorieId)
REFERENCES ocpizza_dev.Categorie (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_dev.Supplement ADD CONSTRAINT ingredient_supplement_fk
FOREIGN KEY (ingredientId)
REFERENCES ocpizza_dev.Ingredient (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_dev.IngredientsParProduit ADD CONSTRAINT ingredient_ingredientsparrecette_fk
FOREIGN KEY (ingredientId)
REFERENCES ocpizza_dev.Ingredient (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_dev.IngredientParRestaurant ADD CONSTRAINT ingredient_ingredientparrestaurant_fk
FOREIGN KEY (ingredientId)
REFERENCES ocpizza_dev.Ingredient (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_dev.IngredientsParProduit ADD CONSTRAINT produit_ingredientsparproduit_fk
FOREIGN KEY (produitId)
REFERENCES ocpizza_dev.Produit (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_dev.LigneCommande ADD CONSTRAINT produit_lignecommande_fk
FOREIGN KEY (produitId)
REFERENCES ocpizza_dev.Produit (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_dev.ProduitsParCategorie ADD CONSTRAINT produit_produitsparcategorie_fk
FOREIGN KEY (produitId)
REFERENCES ocpizza_dev.Produit (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_dev.RestaurantProduitDispo ADD CONSTRAINT produit_restaurantproduitdispo_fk
FOREIGN KEY (produitId)
REFERENCES ocpizza_dev.Produit (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_dev.Restaurant ADD CONSTRAINT adresse_restaurant_fk
FOREIGN KEY (adresseId)
REFERENCES ocpizza_dev.Adresse (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_dev.Compte ADD CONSTRAINT adresse_compteutilisateur_fk
FOREIGN KEY (adresseId)
REFERENCES ocpizza_dev.Adresse (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_dev.CompteClient ADD CONSTRAINT adresse_compteclient_fk
FOREIGN KEY (adresseLivraisonId)
REFERENCES ocpizza_dev.Adresse (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_dev.CompteCollaborateur ADD CONSTRAINT adresse_comptesalarie_fk
FOREIGN KEY (adresseIdGeloLoc)
REFERENCES ocpizza_dev.Adresse (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_dev.CompteClient ADD CONSTRAINT restaurant_compteclient_fk
FOREIGN KEY (restaurantId)
REFERENCES ocpizza_dev.Restaurant (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_dev.CompteCollaborateur ADD CONSTRAINT restaurant_comptesalarie_fk
FOREIGN KEY (restaurantId)
REFERENCES ocpizza_dev.Restaurant (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_dev.IngredientParRestaurant ADD CONSTRAINT restaurant_ingredientparrestaurant_fk
FOREIGN KEY (restaurantId)
REFERENCES ocpizza_dev.Restaurant (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_dev.Commande ADD CONSTRAINT restaurant_commande_fk
FOREIGN KEY (restaurantId)
REFERENCES ocpizza_dev.Restaurant (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_dev.RestaurantProduitDispo ADD CONSTRAINT restaurant_restaurantproduitdispo_fk
FOREIGN KEY (restaurantId)
REFERENCES ocpizza_dev.Restaurant (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_dev.CategorieParRestaurant ADD CONSTRAINT restaurant_categorieparcarte_fk
FOREIGN KEY (restaurantId)
REFERENCES ocpizza_dev.Restaurant (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_dev.FormuleDuRestaurant ADD CONSTRAINT restaurant_formuledurestaurant_fk
FOREIGN KEY (restaurantId)
REFERENCES ocpizza_dev.Restaurant (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_dev.CompteClient ADD CONSTRAINT compteutilisateur_compteclient_fk
FOREIGN KEY (compteId)
REFERENCES ocpizza_dev.Compte (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_dev.CompteCollaborateur ADD CONSTRAINT compte_compteentreprise_fk
FOREIGN KEY (compteId)
REFERENCES ocpizza_dev.Compte (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_dev.Commande ADD CONSTRAINT comptesalarie_commande_fk
FOREIGN KEY (compteIdLivreur)
REFERENCES ocpizza_dev.CompteCollaborateur (compteId)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_dev.Commande ADD CONSTRAINT comptesalarie_commande_fk1
FOREIGN KEY (compteIdPreparateur)
REFERENCES ocpizza_dev.CompteCollaborateur (compteId)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_dev.Commande ADD CONSTRAINT compteclient_commande_fk
FOREIGN KEY (compteIdClient)
REFERENCES ocpizza_dev.CompteClient (compteId)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_dev.Facture ADD CONSTRAINT commande_facture_fk
FOREIGN KEY (commandeNumero)
REFERENCES ocpizza_dev.Commande (numero)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_dev.LigneCommande ADD CONSTRAINT commande_lignecommande_fk
FOREIGN KEY (commandeNumero)
REFERENCES ocpizza_dev.Commande (numero)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_dev.Supplement ADD CONSTRAINT lignecommande_supplement_fk
FOREIGN KEY (ligneCommandeId)
REFERENCES ocpizza_dev.LigneCommande (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
