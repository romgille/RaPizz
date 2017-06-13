#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Pizza
#------------------------------------------------------------

CREATE TABLE Pizza(
    id   int (11) Auto_increment  NOT NULL ,
    nom  Varchar (25) NOT NULL ,
    prix Float NOT NULL ,
    PRIMARY KEY (id ) ,
    UNIQUE (nom )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Ingredient
#------------------------------------------------------------

CREATE TABLE Ingredient(
    id  int (11) Auto_increment  NOT NULL ,
    nom Varchar (25) NOT NULL ,
    PRIMARY KEY (id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Vehicule
#------------------------------------------------------------

CREATE TABLE Vehicule(
    id             int (11) Auto_increment  NOT NULL ,
    label          Varchar (25) NOT NULL ,
    immatriculation Varchar (25),
    PRIMARY KEY (id ) ,
    UNIQUE (immatriculation )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Livreur
#------------------------------------------------------------

CREATE TABLE Livreur(
    id     int (11) Auto_increment  NOT NULL ,
    nom    Varchar (25) NOT NULL ,
    prenom Varchar (25) NOT NULL ,
    PRIMARY KEY (id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Commande
#------------------------------------------------------------

CREATE TABLE Commande(
    id             int (11) Auto_increment  NOT NULL ,
    heureCommande  TimeStamp NOT NULL ,
    heureLivraison TimeStamp ,
    id_Vehicule    Int ,
    id_Pizza       Int NOT NULL ,
    id_Client      Int NOT NULL ,
    id_Addresse    Int NOT NULL ,
    id_Taille      Int NOT NULL ,
    id_Livreur     Int ,
    PRIMARY KEY (id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Taille
#------------------------------------------------------------

CREATE TABLE Taille(
    id    int (11) Auto_increment  NOT NULL ,
    ratio Float NOT NULL ,
    label Varchar (25) NOT NULL ,
    PRIMARY KEY (id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Addresse
#------------------------------------------------------------

CREATE TABLE Addresse(
    id      int (11) Auto_increment  NOT NULL ,
    ville   Varchar (25) ,
    voie    Varchar (25) ,
    numero  Int ,
    zipCode Varchar (25) NOT NULL ,
    PRIMARY KEY (id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Client
#------------------------------------------------------------

CREATE TABLE Client(
    id     int (11) Auto_increment  NOT NULL ,
    solde  Float NOT NULL ,
    nom    Varchar (25) NOT NULL ,
    prenom Varchar (25) NOT NULL ,
    email  Varchar (25),
    tel    Varchar (25),
    PRIMARY KEY (id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Contient
#------------------------------------------------------------

CREATE TABLE Contient(
    quantite      Int NOT NULL ,
    id_Pizza      Int NOT NULL ,
    id_Ingredient Int NOT NULL ,
    PRIMARY KEY (id_Pizza ,id_Ingredient )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Habite
#------------------------------------------------------------

CREATE TABLE Habite(
    id_Addresse   Int NOT NULL ,
    id_Client     Int NOT NULL ,
    PRIMARY KEY (id_Addresse ,id_Client )
)ENGINE=InnoDB;

ALTER TABLE Commande ADD CONSTRAINT FK_Commande_id_Vehicule FOREIGN KEY (id_Vehicule) REFERENCES Vehicule(id);
ALTER TABLE Commande ADD CONSTRAINT FK_Commande_id_Pizza FOREIGN KEY (id_Pizza) REFERENCES Pizza(id);
ALTER TABLE Commande ADD CONSTRAINT FK_Commande_id_Client FOREIGN KEY (id_Client) REFERENCES Client(id);
ALTER TABLE Commande ADD CONSTRAINT FK_Commande_id_Addresse FOREIGN KEY (id_Addresse) REFERENCES Addresse(id);
ALTER TABLE Commande ADD CONSTRAINT FK_Commande_id_Taille FOREIGN KEY (id_Taille) REFERENCES Taille(id);
ALTER TABLE Commande ADD CONSTRAINT FK_Commande_id_Livreur FOREIGN KEY (id_Livreur) REFERENCES Livreur(id);
ALTER TABLE Contient ADD CONSTRAINT FK_Contient_id FOREIGN KEY (id_Pizza) REFERENCES Pizza(id);
ALTER TABLE Contient ADD CONSTRAINT FK_Contient_id_Ingredient FOREIGN KEY (id_Ingredient) REFERENCES Ingredient(id);
ALTER TABLE Habite ADD CONSTRAINT FK_Habite_id FOREIGN KEY (id_Addresse) REFERENCES Addresse(id);
ALTER TABLE Habite ADD CONSTRAINT FK_Habite_id_Client FOREIGN KEY (id_Client) REFERENCES Client(id);

