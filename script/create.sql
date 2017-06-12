#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Pizza
#------------------------------------------------------------

CREATE TABLE Pizza(
        id          int (11) Auto_increment  NOT NULL ,
        nom         Varchar (25) NOT NULL ,
        prix        Float NOT NULL ,
        id_Commande Int NOT NULL ,
        PRIMARY KEY (id ,id_Commande ) ,
        UNIQUE (nom )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Ingredient
#------------------------------------------------------------
exec --no-startup-id dunst -config /home/romain/.dunstrc
exec_always feh --bg-scale $(find /home/romain/Dropbox/wallpaper -type f | shuf -n 1)

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
        immaticulation Varchar (25) NOT NULL ,
        id_Commande    Int NOT NULL ,
        PRIMARY KEY (id ,id_Commande ) ,
        UNIQUE (immaticulation )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Livreur
#------------------------------------------------------------

CREATE TABLE Livreur(
        id          int (11) Auto_increment  NOT NULL ,
        nom         Varchar (25) NOT NULL ,
        prenom      Varchar (25) NOT NULL ,
        id_Commande Int NOT NULL ,
        PRIMARY KEY (id ,id_Commande )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Commande
#------------------------------------------------------------

CREATE TABLE Commande(
        id             int (11) Auto_increment  NOT NULL ,
        heureCommande  TimeStamp NOT NULL ,
        heureLivraison TimeStamp ,
        PRIMARY KEY (id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Taille
#------------------------------------------------------------

CREATE TABLE Taille(
        id          int (11) Auto_increment  NOT NULL ,
        ratio       Float NOT NULL ,
        label       Varchar (25) NOT NULL ,
        id_Commande Int NOT NULL ,
        PRIMARY KEY (id ,id_Commande )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Addresse
#------------------------------------------------------------

CREATE TABLE Addresse(
        id          int (11) Auto_increment  NOT NULL ,
        ville       Varchar (25) ,
        voie        Varchar (25) ,
        numero      Int NOT NULL ,
        zipCode     Varchar (25) NOT NULL ,
        id_Commande Int NOT NULL ,
        PRIMARY KEY (id ,id_Commande )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Client
#------------------------------------------------------------

CREATE TABLE Client(
        id          int (11) Auto_increment  NOT NULL ,
        solde       Float NOT NULL ,
        nom         Varchar (25) NOT NULL ,
        prenom      Varchar (25) NOT NULL ,
        email       Varchar (25) NOT NULL ,
        tel         Varchar (25) NOT NULL ,
        id_Commande Int NOT NULL ,
        PRIMARY KEY (id ,id_Commande )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Contient
#------------------------------------------------------------

CREATE TABLE Contient(
        quantite      Int NOT NULL ,
        id            Int NOT NULL ,
        id_Pizza      Int NOT NULL ,
        id_Ingredient Int NOT NULL ,
        PRIMARY KEY (id ,id_Commande ,id_Ingredient )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Habite
#------------------------------------------------------------

CREATE TABLE Habite(
        id            Int NOT NULL ,
        id_Commande   Int NOT NULL ,
        id_Client     Int NOT NULL ,
        id_Commande_1 Int NOT NULL ,
        PRIMARY KEY (id ,id_Commande ,id_Client ,id_Commande_1 )
)ENGINE=InnoDB;

ALTER TABLE Pizza ADD CONSTRAINT FK_Pizza_id_Commande FOREIGN KEY (id_Commande) REFERENCES Commande(id);
ALTER TABLE Vehicule ADD CONSTRAINT FK_Vehicule_id_Commande FOREIGN KEY (id_Commande) REFERENCES Commande(id);
ALTER TABLE Livreur ADD CONSTRAINT FK_Livreur_id_Commande FOREIGN KEY (id_Commande) REFERENCES Commande(id);
ALTER TABLE Taille ADD CONSTRAINT FK_Taille_id_Commande FOREIGN KEY (id_Commande) REFERENCES Commande(id);
ALTER TABLE Addresse ADD CONSTRAINT FK_Addresse_id_Commande FOREIGN KEY (id_Commande) REFERENCES Commande(id);
ALTER TABLE Client ADD CONSTRAINT FK_Client_id_Commande FOREIGN KEY (id_Commande) REFERENCES Commande(id);
ALTER TABLE Contient ADD CONSTRAINT FK_Contient_id FOREIGN KEY (id) REFERENCES Pizza(id);
ALTER TABLE Contient ADD CONSTRAINT FK_Contient_id_Commande FOREIGN KEY (id_Commande) REFERENCES Commande(id);
ALTER TABLE Contient ADD CONSTRAINT FK_Contient_id_Ingredient FOREIGN KEY (id_Ingredient) REFERENCES Ingredient(id);
ALTER TABLE Habite ADD CONSTRAINT FK_Habite_id FOREIGN KEY (id) REFERENCES Addresse(id);
ALTER TABLE Habite ADD CONSTRAINT FK_Habite_id_Commande FOREIGN KEY (id_Commande) REFERENCES Commande(id);
ALTER TABLE Habite ADD CONSTRAINT FK_Habite_id_Client FOREIGN KEY (id_Client) REFERENCES Client(id);
ALTER TABLE Habite ADD CONSTRAINT FK_Habite_id_Commande_1 FOREIGN KEY (id_Commande_1) REFERENCES Commande(id);

