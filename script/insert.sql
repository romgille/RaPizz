INSERT INTO Ingredient(id, nom)
VALUE
(1, "Sauce Tomate"),
(2, "Poivron"),
(3, "Merguez"),
(4, "Sauce Blanche"),
(5, "Champignon"),
(6, "Mozzarella"),
(7, "Ananas"),
(8, "Jambon de cochon");

INSERT INTO Pizza(id, nom, prix)
VALUE
(1, "Fermière", 11),
(2, "Orientale", 15),
(3, "Hawaïenne", 20);

INSERT INTO Contient(quantite, id_Pizza, id_Ingredient)
VALUE
(1, 1, 4),
(3, 1, 5),
(2, 1, 8),
(1, 2, 1),
(2, 2, 2),
(3, 2, 3),
(2, 2, 6),
(1, 3, 1),
(1, 3, 7),
(2, 3, 8);

INSERT INTO Taille(id, ratio, label)
VALUE
(1, 1, "Humaine"),
(2, 0.66, "Naine"),
(3, 1.33, "Ogresse");

INSERT INTO Vehicule(id, label, immatriculation)
VALUE
(1, "Le Camion", "AA-000-AA"),
(2, "La Scooter de Momo", NULL),
(3, "La Voiture", "AA-000-AB");

INSERT INTO Livreur(id, nom, prenom)
VALUE
(1, "El Baghdady", "Momo"),
(2, "Durand", "Roger");

INSERT INTO Client(id, solde, nom, prenom, email, tel)
VALUE
(1, 2048, "Fillon", "François", "francois.fillon@paselysee2017.fr", "+33101010101"),
(2, 3, "Lassale", "Jean", null, null),
(3, 20, "Cheminade", "Jacques", "jacques.cheminade@surmars.espace", "+999293854");

INSERT INTO Addresse(id, ville, voie, numero, zipcode)
VALUE
(1, "Doha", "Allée de la monaie", "999", "27-865"),
(2, "Versailles", "Place d'Armes", null, "78000"),
(3, "Brocéliande", "Forêt", null, "35380"),
(4, "Marsville", "Chemin des colons", "42", "99999");

INSERT INTO Habite(id_Addresse, id_Client)
VALUE
(1, 1),
(2, 1),
(3, 2),
(4, 3);

INSERT INTO Commande(
    heureCommande,
    heureLivraison,
    id_Vehicule,
    id_Pizza,
    id_Client,
    id_Addresse,
    id_Taille,
    id_Livreur
)
VALUE
(0, 1497363310, 1, 3, 3, 4, 2, 2),
(1497363310, 1497363555, 2, 1, 2, 3, 3, 1),
(1497363310, null, 2, 2, 1, 2, 1, 1);

