INSERT INTO ocpizza.produit (
  nom, prixunitairedebase, descriptif, recette)
  VALUES
    ('Pizza reine', 9.00, 'sauce tomate, champignons, jambon, fromage',
     'Recette pizza reine : Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
    ('Pizza quatre fromages', 9.50, 'sauce tomate, fontina, gorgonzola, emmental, mozzarella', 'Recette pizza quatre fromages : Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
    ('Pizza quatre saisons', 9.50, 'sauce tomate, jambon, champignons, artichauts, olives, fromage', 'Recette pizza quatre saisons : Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
    ('Pizza napolitaine', 8.00, 'sauce tommate, mozzarella', 'Recette pizza napolitaine : Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
    ('Pizza calzone', 9.50, 'sauce tomate, jambon, champignons, oeuf, fromage', 'Recette pizza calzone : Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
    ('Pizza bolognaise', 9.50, 'sauce bolognaise (boeuf), fromage', 'Recette pizza bolognaise : Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
    ('Pizza capricciosa', 9.50, 'sauce tomate, champignons, olives, jambon, poivrons, anchois, fromage', 'Recette pizza capricciosa : Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
    ('Pizza palermo', 9.50, 'sauce tomate, oignons, émincé de poulet, tomate fraîche, fromage', 'Recette pizza palermo : Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
    ('Pizza sisciliana', 9.50, 'sauce tomate, anchois, olives, origan, câpres, fromage', 'Recette pizza sisciliana : Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
    ('Pizza végétarienne', 9.00, 'sauce tomate, oignons, poivrons, champignons, fromage', 'Recette pizza végétarienne : Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
    ('Coca 50cl', 1.81, null, null),
    ('Coca 1.5L', 3.27, null, null),
    ('Orangina 50cl', 1.81, null, null),
    ('Orangina 1.5L', 3.27, null, null),
    ('Salade mixte', 3.27, 'salade verte, tomate, vinaigrette', null),
    ('Salade Rocola', 7.18, 'roquette, tomate, jambon italien, copeaux de parmesan', null),
    ('Tiramisu maison', 3.45, null, null),
    ('Tarte aux pommes', 2.27, null, null);

INSERT INTO ocpizza.categorie (
  nom)
  VALUES
    ('Entrées'),
    ('Pizzas'),
    ('Desserts'),
    ('Boissons 50cl'),
    ('Boissons 1L');

INSERT INTO ocpizza.formule(
	nom, prixhtformule)
	VALUES
    ('Solo', 12),
    ('Duo', 18.50);

INSERT INTO ocpizza.adresse (
  numerorue, rue, complement, codepostal, ville)
  VALUES
    (103, 'Place Diaghilev', null, 54000, 'Nancy'),
    (181, 'Rue Delaitre', null, 54200, 'Toul'),
    (172, 'Rue Bary', null, 54700, 'Pont-à-Mousson'),
    (140, 'Passage de la Ferme-Saint-Lazare', null, 57000, 'Metz'),
    (87, 'Rue du Docteur Babinsky', null, 67000, 'Strasbourg'),
    (226, 'Villa Guizot', 'apt 12', 54000, 'Nancy'),
    (201, 'Place Jacques-Rueff', null, 54000, 'Nancy'),
    (39, 'Rue Gustave-Zédé', 'apt 3', 54000, 'Nancy'),
    (118, 'Passage des Deux-Pavillons', null, 54000, 'Nancy'),
    (295, 'Rue Euler', 'apt 15', 54000, 'Nancy'),
    (224, 'Avenue Chantemesse', 'apt 2', 54000, 'Nancy'),
    (261, 'Impasse Fortin', 'digicode 1546', 54000, 'Nancy'),
    (186, 'Place du Chancelier-Adenauer', null, 54000, 'Nancy'),
    (176, 'Rue Alexandre-Parodi', null, 54000, 'Nancy'),
    (245, 'Rue Ferdinand-de-Béhagle', null, 54200, 'Toul'),
    (250, 'Rue Frédéric-Brunet', null, 54200, 'Toul'),
    (34, 'Avenue Iéna', null, 54200, 'Toul'),
    (234, 'Rue Bardinet', 'apt 5', 54200, 'Toul'),
    (26, 'Rue Irénée-Blanc', null, 54200, 'Toul'),
    (282, 'Place des Invalides', null, 57000, 'Metz'),
    (171, 'Rue Bargue', null, 57000, 'Metz'),
    (64, 'Rue Balard', null, 57000, 'Metz'),
    (121, 'Rue Gauguet', null, 57000, 'Metz'),
    (263, 'Rue Cassette', null, 57000, 'Metz'),
    (1, 'Rue de la Grange-aux-Belles', null, 57000, 'Metz'),
    (174, 'Rue Denis-Poisson', null, 67000, 'Strasbourg'),
    (140, 'Rue Fénelon', null, 67000, 'Strasbourg'),
    (284, 'Rue de la Duée', null, 67000, 'Strasbourg'),
    (70, 'Quai des Grands-Augustins', null, 67000, 'Strasbourg'),
    (189, 'Rue Huyghens', null, 67000, 'Strasbourg'),
    (64, 'Rue Caroline', null, 67000, 'Strasbourg'),
    (145, 'Rue Georges-Auric', null, 54700, 'Pont-à-Mousson'),
    (248, 'Rue Dagorno', null, 54700, 'Pont-à-Mousson'),
    (150, 'Villa Guizot', null, 54700, 'Pont-à-Mousson'),
    (288, 'Square Émile-Zola', null, 54700, 'Pont-à-Mousson'),
    (119, 'Rue Halévy', 'apt 3, digicode 1986', 54700, 'Pont-à-Mousson');

INSERT INTO ocpizza.restaurant (
  nom, horaire, adresseid)
  VALUES
    ('OC Pizza Nancy', 'Lundi à Samedi : 11h30 - 15h | 18h - 22h30', 1),
    ('OC Pizza Toul', 'Lundi à Samedi : 11h30 - 14h30 | 18h - 22h30', 2),
    ('OC Pizza Metz', 'Lundi à Samedi : 11h30 - 14h30 | 18h - 22h30', 3),
    ('OC Pizza Pont-à-Mousson', 'Lundi à Samedi : 11h30 - 14h30 | 18h - 22h30', 4),
    ('OC Pizza Strasbourg', 'Lundi à Samedi : 11h30 - 15h | 18h - 23h', 5);

INSERT INTO ocpizza.compte (
  motdepasse, civilite, prenom, nom, adresseid, telephone, datecreation)
  VALUES
    ('mNSW0f2F', 'h', 'Adrien', 'Verdier', 6, 0673700654, '2018-05-01'),
    ('rHjl6Rdi', 'h', 'Lucas', 'Renaud', 7, 0739264356, '2018-05-01'),
    ('91ieEUn6', 'f', 'Nina', 'Guichard', 8, 0657730033, '2018-05-01'),
    ('Z7nzju1l', 'h', 'Gilbert', 'Tardy', 9, 0601799750, '2018-05-01'),
    ('6hbukcas', 'f', 'Laura', 'Schneider', 10, 0708458677, '2018-05-01'),
    ('jM4saWp3', 'f', 'Léa', 'Rousseau', 11, 0630359420, '2018-05-01'),
    ('dJXQOzBL', 'f', 'Margaux', 'Turpin', 12, 0725337380, '2018-05-01'),
    ('DbmStjUi', 'h', 'Pierre', 'Chatelain', 13, 0794665273, '2018-05-01'),
    ('ds90rG9d', 'h', 'Alexandre', 'Mace', 14, 0741288150, '2018-05-01'),
    ('CgVH3fRi', 'h', 'Romain', 'Boyer', 15, 0732265994, '2018-05-01'),
    ('Di9ZYe8Q', 'f', 'Célia', 'Charles', 16, 0623495700, '2018-05-01'),
    ('XS3FkMrm', 'f', 'Chaïma', 'Chauveau', 17, 0628068696, '2018-05-01'),
    ('7@n7Sf3a', 'h', 'Yohan', 'Dumoulin', 18, 0775225627, '2018-05-01'),
    ('S8Yr@LOX', 'h', 'Davy', 'Millot', 19, 0618084247, '2018-05-01'),
    ('4RIrv5Mz', 'f', 'Julia', 'Rocher', 20, 0683375105, '2018-05-01'),
    ('KjySe1Ac', 'h', 'Hugo', 'Valentin', 21, 0602177179, '2018-05-01'),
    ('xQEYT5AK', 'h', 'Noë', 'Lebrun', 22, 0689644333, '2018-05-01'),
    ('jBsVApgc', 'f', 'Louise', 'Navarro', 23, 0762277108, '2018-05-01'),
    ('5fcrFwsO', 'f', 'Nina', 'Allain', 24, 0664541480, '2018-05-01'),
    ('5oEMstvx', 'h', 'Tristan', 'Garnier', 25, 0617554008, '2018-05-01'),
    ('0MmY7J4d', 'f', 'Mélissa', 'Bourdon', 26, 0675916530, '2018-05-01'),
    ('acq97NK6', 'h', 'Jordan', 'Huet', 27, 0677573922, '2018-05-01'),
    ('@ZpYIQNs', 'h', 'Aaron', 'Dupuis', 28, 0741575056, '2018-05-01'),
    ('iooCa4Xd', 'f', 'Carla', 'Mercier', 29, 0661162513, '2018-05-01'),
    ('3sLfkT0D', 'h', 'Malo', 'Gosselin', 30, 0620601284, '2018-05-01'),
    ('hPUW8A58', 'f', 'Maïwenn', 'Pottier', 31, 0799432642, '2018-05-01'),
    ('IQf6Uhsx', 'f', 'Julia', 'Texier', 32, 0726695986, '2018-05-01'),
    ('Lvat7NVP', 'h', 'Zacharis', 'Lesage', 33, 0699143525, '2018-05-01'),
    ('B6kblhtV', 'f', 'Tatiana', 'Bourgeois', 34, 0727488154, '2018-05-01'),
    ('2JWkv9HZ', 'h', 'Erwan', 'Fabre', 35, 0681294169, '2018-05-01'),
    ('I1rXt0qv', 'h', 'Enzo', 'Poulain', 36, 0743548503, '2018-05-01');

INSERT INTO ocpizza.comptecollaborateur (
  compteid, role, numerosecu, datenaissance, adresseidgeloloc, restaurantid, email)
  VALUES
    (1, 'Responsable', 113112873367172, '1983-06-21', null, 1, 'adrien@gmail.com'),
    (2, 'Employé', 195117948445773, '1995-02-13', null, 1, 'lucas@gmail.com'),
    (3, 'Employé', 231117113524229, '1997-08-26', null, 1, 'nina@gmail.com'),
    (4, 'Employé', 178109481263340, '1996-11-24', null, 1, 'gilbert@gmail.com'),
    (5, 'Livreur', 237114580691966, '1993-07-11', null, 1, 'laura@gmail.com'),
    (6, 'Livreur', 274103836717293, '1993-01-28', null, 1, 'lea"@gmail.com'),
    (10, 'Livreur', 192116112055381, '1995-03-24', null, 2, 'romain@gmail.com'),
    (11, 'Responsable', 260105518250126, '1980-09-10', null, 2, 'celia@gmail.com'),
    (12, 'Employé', 254118284482789, '1989-11-28', null, 2, 'chaima@gmail.com'),
    (15, 'Responsable', 220124022937457, '1986-05-02', null, 3, 'julia@gmail.com'),
    (16, 'Employé', 149125792976684, '1990-06-14', null, 3, 'hugo@gmail.com'),
    (17, 'Employé', 178127477626349, '1998-03-16', null, 3, 'noe@gmail.com'),
    (18, 'Livreur', 219129242711988, '1994-12-03', null, 3, 'louise@gmail.com'),
    (21, 'Responsable', 297113572044720, '1987-02-13', null, 4, 'melissa@gmail.com'),
    (22, 'Employé', 149111295494249, '1993-12-29', null, 4, 'jordan@gmail.com'),
    (23, 'Employé', 170114846836286, '1986-04-21', null, 4, 'aaron@gmail.com'),
    (24, 'Livreur', 217118669363458, '1997-10-16', null, 4, 'carla@gmail.com'),
    (27, 'Responsable', 256115683763882, '1986-08-14', null, 5, 'julia2@gmail.com'),
    (28, 'Employé', 155114963739392, '1995-03-06', null, 5, 'zacharis@gmail.com'),
    (29, 'Livreur', 290108171667241, '1997-05-28', null, 5, 'tatiana@gmail.com');

INSERT INTO ocpizza.compteclient(
	compteid, email, restaurantid, adresselivraisonid, statutconfirme, datenaissance)
	VALUES
    (7, 'margaux@gmail.com', 1, 12, true, null),
    (8, 'pierre@gmail.com', 1, 13, true, null),
    (9, 'alexandre@gmail.com', 1, 14, true, '1995-06-21'),
    (14, 'yohan@gmail.com', 2, 18, true, null),
    (15, 'davy@gmail.com', 2, 19, true, null),
    (19, 'nina@gmail.com', 3, 24, true, '1987-10-16'),
    (20, 'tristan@gmail.com', 3, 25, true, null),
    (25, 'malo@gmail.com', 4, 30, true, null),
    (26, 'maiwenn@gmail.com', 4, 31, true, null),
    (30, 'erwan@gmail.com', 5, 35, true, '1997-02-11'),
    (31, 'enzo@gmail.com', 5, 36, true, null);

INSERT INTO ocpizza.restaurantproduitdispo(
	produitid, restaurantid, disponible, stock)
	VALUES
    (1, 1, true, null),
    (2, 1, true, null),
    (3, 1, true, null),
    (4, 1, true, null),
    (5, 1, true, null),
    (6, 1, true, null),
    (7, 1, true, null),
    (8, 1, true, null),
    (9, 1, true, null),
    (10, 1, true, null),
    (11, 1, true, 100),
    (12, 1, true, 50),
    (13, 1, true, 50),
    (14, 1, true, 20),
    (15, 1, true, 30),
    (16, 1, true, 20),
    (17, 1, true, 50),
    (18, 1, true, 30),
    (1, 2, true, null),
    (2, 2, true, null),
    (3, 2, true, null),
    (4, 2, true, null),
    (5, 2, true, null),
    (6, 2, true, null),
    (7, 2, true, null),
    (8, 2, true, null),
    (9, 2, true, null),
    (10, 2, true, null),
    (11, 2, true, 50),
    (12, 2, true, 30),
    (13, 2, true, 40),
    (14, 2, true, 20),
    (15, 2, true, 15),
    (16, 2, true, 10),
    (17, 2, true, 30),
    (18, 2, true, 20),
    (1, 3, true, null),
    (2, 3, true, null),
    (3, 3, true, null),
    (4, 3, true, null),
    (5, 3, true, null),
    (6, 3, true, null),
    (7, 3, true, null),
    (8, 3, true, null),
    (9, 3, true, null),
    (10, 3, true, null),
    (11, 3, true, 100),
    (12, 3, true, 50),
    (13, 3, true, 50),
    (14, 3, true, 20),
    (15, 3, true, 30),
    (16, 3, true, 20),
    (17, 3, true, 50),
    (18, 3, true, 30),
    (1, 4, true, null),
    (2, 4, true, null),
    (3, 4, true, null),
    (4, 4, true, null),
    (5, 4, true, null),
    (6, 4, true, null),
    (7, 4, true, null),
    (8, 4, true, null),
    (9, 4, true, null),
    (10, 4, true, null),
    (11, 4, true, 80),
    (12, 4, true, 40),
    (13, 4, true, 40),
    (14, 4, true, 20),
    (15, 4, true, 25),
    (16, 4, true, 15),
    (17, 4, true, 40),
    (18, 4, true, 20),
    (1, 5, true, null),
    (2, 5, true, null),
    (3, 5, true, null),
    (4, 5, true, null),
    (5, 5, true, null),
    (6, 5, true, null),
    (7, 5, true, null),
    (8, 5, true, null),
    (9, 5, true, null),
    (10, 5, true, null),
    (11, 5, true, 100),
    (12, 5, true, 50),
    (13, 5, true, 50),
    (14, 5, true, 20),
    (15, 5, true, 30),
    (16, 5, true, 20),
    (17, 5, true, 50),
    (18, 5, true, 30);

INSERT INTO ocpizza.produitsparcategorie (
  categorieid, produitid)
  VALUES
    (1, 15),
    (1, 16),
    (2, 1),
    (2, 2),
    (2, 3),
    (2, 4),
    (2, 5),
    (2, 6),
    (2, 7),
    (2, 8),
    (2, 9),
    (2, 10),
    (3, 17),
    (3, 18),
    (4, 11),
    (5, 12),
    (4, 13),
    (5, 14);

INSERT INTO ocpizza.categorieparrestaurant (
  categorieid, restaurantid)
  VALUES
    (1, 1),
    (2, 1),
    (3, 1),
    (4, 1),
    (5, 1),
    (1, 2),
    (2, 2),
    (3, 2),
    (4, 2),
    (5, 2),
    (1, 3),
    (2, 3),
    (3, 3),
    (4, 3),
    (5, 3),
    (1, 4),
    (2, 4),
    (3, 4),
    (4, 4),
    (5, 4),
    (1, 5),
    (2, 5),
    (3, 5),
    (4, 5),
    (5, 5);

INSERT INTO ocpizza.categorieparformule(
	formuleid, categorieid, quantite)
	VALUES
    (1, 2, 1),
    (1, 4, 1),
    (1, 3, 1),
    (2, 2, 2),
    (2, 5, 1);

INSERT INTO ocpizza.formuledurestaurant(
	formuleid, restaurantid)
	VALUES
    (1, 1),
    (2, 1),
    (1, 2),
    (2, 2),
    (1, 3),
    (1, 4),
    (2, 4),
    (1, 5),
    (2, 5);

INSERT INTO ocpizza.ingredient(
	nom, prixhtsisupplement)
	VALUES
  ('sauce tomate', 1.00),
  ('tomate fraîche', 1.00),
  ('artichauts', 1.00),
  ('champignons', 1.00),
  ('poivrons', 1.00),
  ('oignons', 1.00),
  ('olives', 1.00),
  ('jambon', 1.00),
  ('émincé de poulet', 1.00),
  ('sauce bolognaise', 1.00),
  ('anchois', 1.00),
  ('câpres', 1.00),
  ('fromage', 1.00),
  ('fontina', 1.00),
  ('gorgonzola', 1.00),
  ('emmental', 1.00),
  ('mozzarella', 1.00),
  ('oeuf', 1.00),
  ('origan', 1.00);

INSERT INTO ocpizza.ingredientparrestaurant(
	restaurantid, ingredientid, stock)
	VALUES
    (1, 1, 100),
    (1, 2, 100),
    (1, 3, 100),
    (1, 4, 100),
    (1, 5, 100),
    (1, 6, 100),
    (1, 7, 100),
    (1, 8, 100),
    (1, 9, 100),
    (1, 10, 100),
    (1, 11, 100),
    (1, 12, 100),
    (1, 13, 100),
    (1, 14, 100),
    (1, 15, 100),
    (1, 16, 100),
    (1, 17, 100),
    (1, 18, 100),
    (2, 1, 100),
    (2, 2, 100),
    (2, 3, 100),
    (2, 4, 100),
    (2, 5, 100),
    (2, 6, 100),
    (2, 7, 100),
    (2, 8, 100),
    (2, 9, 100),
    (2, 10, 100),
    (2, 11, 100),
    (2, 12, 100),
    (2, 13, 100),
    (2, 14, 100),
    (2, 15, 100),
    (2, 16, 100),
    (2, 17, 100),
    (2, 18, 100),
    (3, 1, 100),
    (3, 2, 100),
    (3, 3, 100),
    (3, 4, 100),
    (3, 5, 100),
    (3, 6, 100),
    (3, 7, 100),
    (3, 8, 100),
    (3, 9, 100),
    (3, 10, 100),
    (3, 11, 100),
    (3, 12, 100),
    (3, 13, 100),
    (3, 14, 100),
    (3, 15, 100),
    (3, 16, 100),
    (3, 17, 100),
    (3, 18, 100),
    (4, 1, 100),
    (4, 2, 100),
    (4, 3, 100),
    (4, 4, 100),
    (4, 5, 100),
    (4, 6, 100),
    (4, 7, 100),
    (4, 8, 100),
    (4, 9, 100),
    (4, 10, 100),
    (4, 11, 100),
    (4, 12, 100),
    (4, 13, 100),
    (4, 14, 100),
    (4, 15, 100),
    (4, 16, 100),
    (4, 17, 100),
    (4, 18, 100),
    (5, 1, 100),
    (5, 2, 100),
    (5, 3, 100),
    (5, 4, 100),
    (5, 5, 100),
    (5, 6, 100),
    (5, 7, 100),
    (5, 8, 100),
    (5, 9, 100),
    (5, 10, 100),
    (5, 11, 100),
    (5, 12, 100),
    (5, 13, 100),
    (5, 14, 100),
    (5, 15, 100),
    (5, 16, 100),
    (5, 17, 100),
    (5, 18, 100);

INSERT INTO ocpizza.ingredientsparproduit(
	produitid, ingredientid, quantiteingredient)
	VALUES
    (1, 1, 1),
    (1, 4, 1),
    (1, 8, 1),
    (1, 13, 1),
    (2, 1, 1),
    (2, 14, 1),
    (2, 15, 1),
    (2, 16, 1),
    (2, 17, 1),
    (3, 1, 1),
    (3, 8, 1),
    (3, 4, 1),
    (3, 3, 1),
    (3, 7, 1),
    (3, 13, 1),
    (4, 1, 1),
    (4, 17, 1),
    (5, 1, 1),
    (5, 8, 1),
    (5, 4, 1),
    (5, 18, 1),
    (5, 13, 1),
    (6, 10, 1),
    (6, 13, 1),
    (7, 1, 1),
    (7, 4, 1),
    (7, 7, 1),
    (7, 8, 1),
    (7, 5, 1),
    (7, 11, 1),
    (7, 13, 1),
    (8, 1, 1),
    (8, 6, 1),
    (8, 9, 1),
    (8, 2, 1),
    (8, 13, 1),
    (9, 1, 1),
    (9, 11, 1),
    (9, 7, 1),
    (9, 19, 1),
    (9, 12, 1),
    (9, 13, 1),
    (10, 1, 1),
    (10, 19, 1),
    (10, 5, 1),
    (10, 4, 1),
    (10, 13, 1);

INSERT INTO ocpizza.commande(
	restaurantid, compteidclient, date, heure, livraisonmode, heurelivraisonprevue, paiementenligne, moyendepaiement, compteidpreparateur, compteidlivreur, statut, modifiable)
	VALUES
    (1, 7, '2018-04-21', '21:00:00', 'à emporter', '21:30:00', false, 'espèce', 3, null, 'à préparer', true);

INSERT INTO ocpizza.lignecommande(
	commandenumero, libelle, produitid, taille, quantite)
	VALUES
    (1, 'pizza 4 saisons', 3, 'grande', 1),
    (1, 'pizza napolitaine', 4, 'normale', 1);

INSERT INTO ocpizza.supplement(
	lignecommandeid, ingredientid)
	VALUES
    (2, 8);

INSERT INTO ocpizza.facture(
	commandenumero, datepaiement, heurepaiement)
	VALUES
    (1, '2018-04-21', '21:34:12');
