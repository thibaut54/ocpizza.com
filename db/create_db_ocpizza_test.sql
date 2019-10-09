
CREATE SCHEMA IF NOT EXISTS ocpizza_test;

CREATE SEQUENCE IF NOT EXISTS ocpizza_test.formule_id_seq;

CREATE TABLE IF NOT EXISTS ocpizza_test.Formule (
                id INTEGER NOT NULL DEFAULT nextval('ocpizza_test.formule_id_seq'),
                nom VARCHAR(50) NOT NULL,
                prixHTFormule NUMERIC(5,2),
                CONSTRAINT formule_pk PRIMARY KEY (id)
);


ALTER SEQUENCE IF EXISTS ocpizza_test.formule_id_seq OWNED BY ocpizza_test.Formule.id;

CREATE UNIQUE INDEX IF NOT EXISTS formule_idx
 ON ocpizza_test.Formule
 ( nom );

CREATE SEQUENCE IF NOT EXISTS ocpizza_test.categorie_nom_seq;

CREATE TABLE IF NOT EXISTS ocpizza_test.Categorie (
                id INTEGER NOT NULL DEFAULT nextval('ocpizza_test.categorie_nom_seq'),
                nom VARCHAR(50) NOT NULL,
                CONSTRAINT categorie_pk PRIMARY KEY (id)
);


ALTER SEQUENCE IF EXISTS ocpizza_test.categorie_nom_seq OWNED BY ocpizza_test.Categorie.id;

CREATE TABLE IF NOT EXISTS ocpizza_test.CategorieParFormule (
                formuleId INTEGER NOT NULL,
                categorieId INTEGER NOT NULL,
                quantite INTEGER NOT NULL,
                CONSTRAINT categorieparformule_pk PRIMARY KEY (formuleId, categorieId)
);


CREATE SEQUENCE IF NOT EXISTS ocpizza_test.ingredient_id_seq;

CREATE TABLE IF NOT EXISTS ocpizza_test.Ingredient (
                id INTEGER NOT NULL DEFAULT nextval('ocpizza_test.ingredient_id_seq'),
                nom VARCHAR(100) NOT NULL,
                prixHTSiSupplement NUMERIC(4,2) NOT NULL,
                CONSTRAINT ingredient_pk PRIMARY KEY (id)
);


ALTER SEQUENCE IF EXISTS ocpizza_test.ingredient_id_seq OWNED BY ocpizza_test.Ingredient.id;

CREATE SEQUENCE IF NOT EXISTS ocpizza_test.produit_reference_seq;

CREATE TABLE IF NOT EXISTS ocpizza_test.Produit (
                id INTEGER NOT NULL DEFAULT nextval('ocpizza_test.produit_reference_seq'),
                nom VARCHAR(50) NOT NULL,
                prixUnitaireDeBase NUMERIC(6,2) NOT NULL,
                descriptif VARCHAR(150),
                recette VARCHAR(1000),
                CONSTRAINT produit_pk PRIMARY KEY (id)
);


ALTER SEQUENCE IF EXISTS ocpizza_test.produit_reference_seq OWNED BY ocpizza_test.Produit.id;

CREATE UNIQUE INDEX IF NOT EXISTS produit_idx
 ON ocpizza_test.Produit
 ( nom );

CREATE TABLE IF NOT EXISTS ocpizza_test.ProduitsParCategorie (
                categorieId INTEGER NOT NULL,
                produitId INTEGER NOT NULL,
                CONSTRAINT produitsparcategorie_pk PRIMARY KEY (categorieId, produitId)
);


CREATE TABLE IF NOT EXISTS ocpizza_test.IngredientsParProduit (
                produitId INTEGER NOT NULL,
                ingredientId INTEGER NOT NULL,
                quantiteIngredient INTEGER NOT NULL,
                CONSTRAINT ingredientsparproduit_pk PRIMARY KEY (produitId, ingredientId)
);


CREATE SEQUENCE IF NOT EXISTS ocpizza_test.adresse_adresseid_seq;

CREATE TABLE IF NOT EXISTS ocpizza_test.Adresse (
                id INTEGER NOT NULL DEFAULT nextval('ocpizza_test.adresse_adresseid_seq'),
                numeroRue INTEGER NOT NULL,
                rue VARCHAR(150) NOT NULL,
                complement VARCHAR(200),
                codePostal INTEGER NOT NULL,
                ville VARCHAR(30) NOT NULL,
                CONSTRAINT adresse_pk PRIMARY KEY (id)
);


ALTER SEQUENCE IF EXISTS ocpizza_test.adresse_adresseid_seq OWNED BY ocpizza_test.Adresse.id;

CREATE SEQUENCE IF NOT EXISTS ocpizza_test.restaurant_nom_seq;

CREATE TABLE IF NOT EXISTS ocpizza_test.Restaurant (
                id INTEGER NOT NULL DEFAULT nextval('ocpizza_test.restaurant_nom_seq'),
                nom VARCHAR(50) NOT NULL,
                horaire VARCHAR NOT NULL,
                adresseId INTEGER NOT NULL,
                CONSTRAINT restaurant_pk PRIMARY KEY (id)
);


ALTER SEQUENCE IF EXISTS ocpizza_test.restaurant_nom_seq OWNED BY ocpizza_test.Restaurant.id;

CREATE TABLE IF NOT EXISTS ocpizza_test.FormuleDuRestaurant (
                formuleId INTEGER NOT NULL,
                restaurantId INTEGER NOT NULL,
                CONSTRAINT formuledurestaurant_pk PRIMARY KEY (formuleId, restaurantId)
);


CREATE TABLE IF NOT EXISTS ocpizza_test.CategorieParRestaurant (
                categorieId INTEGER NOT NULL,
                restaurantId INTEGER NOT NULL,
                CONSTRAINT categorieparrestaurant_pk PRIMARY KEY (categorieId, restaurantId)
);


CREATE TABLE IF NOT EXISTS ocpizza_test.RestaurantProduitDispo (
                produitId INTEGER NOT NULL,
                restaurantId INTEGER NOT NULL,
                disponible BOOLEAN NOT NULL,
                stock INTEGER,
                CONSTRAINT restaurantproduitdispo_pk PRIMARY KEY (produitId, restaurantId)
);
COMMENT ON COLUMN ocpizza_test.RestaurantProduitDispo.stock IS 'la valeur NULL est autoris�e pour les pizzas, dont on ne peut �valuer le stock';


CREATE TABLE IF NOT EXISTS ocpizza_test.IngredientParRestaurant (
                restaurantId INTEGER NOT NULL,
                ingredientId INTEGER NOT NULL,
                stock NUMERIC(8,2),
                CONSTRAINT ingredientparrestaurant_pk PRIMARY KEY (restaurantId, ingredientId)
);


CREATE SEQUENCE IF NOT EXISTS ocpizza_test.compte_id_seq;

CREATE TABLE IF NOT EXISTS ocpizza_test.Compte (
                id INTEGER NOT NULL DEFAULT nextval('ocpizza_test.compte_id_seq'),
                motDePasse VARCHAR(12) NOT NULL,
                civilite CHAR NOT NULL,
                prenom VARCHAR(50) NOT NULL,
                nom VARCHAR(50) NOT NULL,
                adresseId INTEGER NOT NULL,
                telephone INTEGER NOT NULL,
                dateCreation DATE NOT NULL,
                CONSTRAINT compte_pk PRIMARY KEY (id)
);


ALTER SEQUENCE IF EXISTS ocpizza_test.compte_id_seq OWNED BY ocpizza_test.Compte.id;

CREATE TABLE IF NOT EXISTS ocpizza_test.CompteCollaborateur (
                compteId INTEGER NOT NULL,
                role VARCHAR NOT NULL,
                numeroSecu BIGINT NOT NULL,
                dateNaissance DATE NOT NULL,
                adresseIdGeloLoc INTEGER,
                restaurantId INTEGER NOT NULL,
                email VARCHAR,
                CONSTRAINT comptecollaborateur_pk PRIMARY KEY (compteId)
);
COMMENT ON COLUMN ocpizza_test.CompteCollaborateur.email IS 'on autorise la valeur null car les CDD, par exemple, n''auront pas besoin de donner leur email';


CREATE UNIQUE INDEX IF NOT EXISTS comptesalarie_idx
 ON ocpizza_test.CompteCollaborateur
 ( numeroSecu );

CREATE UNIQUE INDEX IF NOT EXISTS comptesalarie_idx1
 ON ocpizza_test.CompteCollaborateur
 ( email );

CREATE TABLE IF NOT EXISTS ocpizza_test.CompteClient (
                compteId INTEGER NOT NULL,
                email VARCHAR(100) NOT NULL,
                restaurantId INTEGER,
                adresseLivraisonId INTEGER,
                statutConfirme BOOLEAN NOT NULL,
                dateNaissance DATE,
                CONSTRAINT compteclient_pk PRIMARY KEY (compteId)
);


CREATE UNIQUE INDEX IF NOT EXISTS compteclient_idx
 ON ocpizza_test.CompteClient
 ( email );

CREATE SEQUENCE IF NOT EXISTS ocpizza_test.commande_numero_seq;

CREATE TABLE IF NOT EXISTS ocpizza_test.Commande (
                numero INTEGER NOT NULL DEFAULT nextval('ocpizza_test.commande_numero_seq'),
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


ALTER SEQUENCE IF EXISTS ocpizza_test.commande_numero_seq OWNED BY ocpizza_test.Commande.numero;

CREATE SEQUENCE IF NOT EXISTS ocpizza_test.lignecommande_id_seq;

CREATE TABLE IF NOT EXISTS ocpizza_test.LigneCommande (
                id INTEGER NOT NULL DEFAULT nextval('ocpizza_test.lignecommande_id_seq'),
                commandeNumero INTEGER NOT NULL,
                libelle VARCHAR(100) NOT NULL,
                produitId INTEGER NOT NULL,
                taille VARCHAR NOT NULL,
                quantite INTEGER NOT NULL,
                CONSTRAINT lignecommande_pk PRIMARY KEY (id)
);


ALTER SEQUENCE IF EXISTS ocpizza_test.lignecommande_id_seq OWNED BY ocpizza_test.LigneCommande.id;

CREATE TABLE IF NOT EXISTS ocpizza_test.Supplement (
                ligneCommandeId INTEGER NOT NULL,
                ingredientId INTEGER NOT NULL,
                CONSTRAINT supplement_pk PRIMARY KEY (ligneCommandeId, ingredientId)
);


CREATE SEQUENCE IF NOT EXISTS ocpizza_test.facture_numerofacture_seq;

CREATE TABLE IF NOT EXISTS ocpizza_test.Facture (
                numeroFacture INTEGER NOT NULL DEFAULT nextval('ocpizza_test.facture_numerofacture_seq'),
                commandeNumero INTEGER NOT NULL,
                datePaiement DATE NOT NULL,
                heurePaiement TIME NOT NULL,
                CONSTRAINT facture_pk PRIMARY KEY (numeroFacture)
);


ALTER SEQUENCE IF EXISTS ocpizza_test.facture_numerofacture_seq OWNED BY ocpizza_test.Facture.numeroFacture;

ALTER TABLE IF EXISTS ocpizza_test.FormuleDuRestaurant ADD CONSTRAINT formule_formuledurestaurant_fk
FOREIGN KEY (formuleId)
REFERENCES ocpizza_test.Formule (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_test.CategorieParFormule ADD CONSTRAINT formule_categorieparformule_fk
FOREIGN KEY (formuleId)
REFERENCES ocpizza_test.Formule (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_test.ProduitsParCategorie ADD CONSTRAINT categorie_produitsparcategorie_fk
FOREIGN KEY (categorieId)
REFERENCES ocpizza_test.Categorie (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_test.CategorieParRestaurant ADD CONSTRAINT categorie_categorieparcarte_fk
FOREIGN KEY (categorieId)
REFERENCES ocpizza_test.Categorie (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_test.CategorieParFormule ADD CONSTRAINT categorie_categorieparformule_fk
FOREIGN KEY (categorieId)
REFERENCES ocpizza_test.Categorie (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_test.Supplement ADD CONSTRAINT ingredient_supplement_fk
FOREIGN KEY (ingredientId)
REFERENCES ocpizza_test.Ingredient (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_test.IngredientsParProduit ADD CONSTRAINT ingredient_ingredientsparrecette_fk
FOREIGN KEY (ingredientId)
REFERENCES ocpizza_test.Ingredient (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_test.IngredientParRestaurant ADD CONSTRAINT ingredient_ingredientparrestaurant_fk
FOREIGN KEY (ingredientId)
REFERENCES ocpizza_test.Ingredient (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_test.IngredientsParProduit ADD CONSTRAINT produit_ingredientsparproduit_fk
FOREIGN KEY (produitId)
REFERENCES ocpizza_test.Produit (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_test.LigneCommande ADD CONSTRAINT produit_lignecommande_fk
FOREIGN KEY (produitId)
REFERENCES ocpizza_test.Produit (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_test.ProduitsParCategorie ADD CONSTRAINT produit_produitsparcategorie_fk
FOREIGN KEY (produitId)
REFERENCES ocpizza_test.Produit (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_test.RestaurantProduitDispo ADD CONSTRAINT produit_restaurantproduitdispo_fk
FOREIGN KEY (produitId)
REFERENCES ocpizza_test.Produit (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_test.Restaurant ADD CONSTRAINT adresse_restaurant_fk
FOREIGN KEY (adresseId)
REFERENCES ocpizza_test.Adresse (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_test.Compte ADD CONSTRAINT adresse_compteutilisateur_fk
FOREIGN KEY (adresseId)
REFERENCES ocpizza_test.Adresse (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_test.CompteClient ADD CONSTRAINT adresse_compteclient_fk
FOREIGN KEY (adresseLivraisonId)
REFERENCES ocpizza_test.Adresse (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_test.CompteCollaborateur ADD CONSTRAINT adresse_comptesalarie_fk
FOREIGN KEY (adresseIdGeloLoc)
REFERENCES ocpizza_test.Adresse (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_test.CompteClient ADD CONSTRAINT restaurant_compteclient_fk
FOREIGN KEY (restaurantId)
REFERENCES ocpizza_test.Restaurant (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_test.CompteCollaborateur ADD CONSTRAINT restaurant_comptesalarie_fk
FOREIGN KEY (restaurantId)
REFERENCES ocpizza_test.Restaurant (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_test.IngredientParRestaurant ADD CONSTRAINT restaurant_ingredientparrestaurant_fk
FOREIGN KEY (restaurantId)
REFERENCES ocpizza_test.Restaurant (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_test.Commande ADD CONSTRAINT restaurant_commande_fk
FOREIGN KEY (restaurantId)
REFERENCES ocpizza_test.Restaurant (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_test.RestaurantProduitDispo ADD CONSTRAINT restaurant_restaurantproduitdispo_fk
FOREIGN KEY (restaurantId)
REFERENCES ocpizza_test.Restaurant (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_test.CategorieParRestaurant ADD CONSTRAINT restaurant_categorieparcarte_fk
FOREIGN KEY (restaurantId)
REFERENCES ocpizza_test.Restaurant (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_test.FormuleDuRestaurant ADD CONSTRAINT restaurant_formuledurestaurant_fk
FOREIGN KEY (restaurantId)
REFERENCES ocpizza_test.Restaurant (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_test.CompteClient ADD CONSTRAINT compteutilisateur_compteclient_fk
FOREIGN KEY (compteId)
REFERENCES ocpizza_test.Compte (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_test.CompteCollaborateur ADD CONSTRAINT compte_compteentreprise_fk
FOREIGN KEY (compteId)
REFERENCES ocpizza_test.Compte (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_test.Commande ADD CONSTRAINT comptesalarie_commande_fk
FOREIGN KEY (compteIdLivreur)
REFERENCES ocpizza_test.CompteCollaborateur (compteId)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_test.Commande ADD CONSTRAINT comptesalarie_commande_fk1
FOREIGN KEY (compteIdPreparateur)
REFERENCES ocpizza_test.CompteCollaborateur (compteId)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_test.Commande ADD CONSTRAINT compteclient_commande_fk
FOREIGN KEY (compteIdClient)
REFERENCES ocpizza_test.CompteClient (compteId)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_test.Facture ADD CONSTRAINT commande_facture_fk
FOREIGN KEY (commandeNumero)
REFERENCES ocpizza_test.Commande (numero)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_test.LigneCommande ADD CONSTRAINT commande_lignecommande_fk
FOREIGN KEY (commandeNumero)
REFERENCES ocpizza_test.Commande (numero)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE IF EXISTS ocpizza_test.Supplement ADD CONSTRAINT lignecommande_supplement_fk
FOREIGN KEY (ligneCommandeId)
REFERENCES ocpizza_test.LigneCommande (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
