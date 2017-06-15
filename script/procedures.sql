DELIMITER $$


CREATE PROCEDURE AjoutIngredient (IN ingredient VARCHAR(25)) MODIFIES SQL DATA
BEGIN
    INSERT INTO Ingredient (nom) VALUE (ingredient);
END$$

CREATE PROCEDURE AjoutLivreur (IN nom VARCHAR(25), prenom VARCHAR(25)) MODIFIES SQL DATA
BEGIN
    INSERT INTO Livreur (nom, prenom) VALUE (nom, prenom);
END$$

CREATE PROCEDURE AjoutVehicule (IN label VARCHAR(25), immat VARCHAR(25)) MODIFIES SQL DATA
BEGIN
    INSERT INTO Vehicule (label, immatriculation) VALUE (label, immat);
END$$


DELIMITER ;
