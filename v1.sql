use mabase;

IF OBJECT_ID('dbo.chauffeur', 'U') IS NOT NULL 
  DROP TABLE dbo.chauffeur;
IF OBJECT_ID('dbo.vehicule', 'U') IS NOT NULL 
  DROP TABLE dbo.vehicule;
GO

CREATE TABLE chauffeur (
	-- -- num_chauffeur INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	numChauffeur int NOT NULL,
	nomChauffeur varchar(max),
	numVehicule int
);

CREATE TABLE vehicule (
	numVehicule int NOT NULL,
	marqueVehicule varchar(max)
);

GO

INSERT INTO vehicule (numVehicule, marqueVehicule)
VALUES 
	(1, 'M1'),
	(2, 'M2'),
	(3, 'M3'),
	(4, 'M4')
;

INSERT INTO chauffeur (numChauffeur, nomChauffeur, numVehicule)
VALUES 
	(1, 'C1', 1),
	(2, 'C2', 1),
	(3, 'C3', 3),
	(4, 'C4', 4)
;

INSERT INTO chauffeur (numChauffeur, nomChauffeur)
VALUES 
	(5, 'C1')
;
GO


-- Créer une erreur d'intégrité référentielle
--INSERT INTO chauffeur (numChauffeur, nomChauffeur, numVehicule)
--VALUES 
--(6, 'C1', 6)
--;
--GO



-- création des clés primaire
-- ALTER : modifier
-- PK_chauffeur le nom donné à la contrainte
ALTER TABLE chauffeur ADD CONSTRAINT PK_chauffeur PRIMARY KEY (numChauffeur);
ALTER TABLE vehicule ADD CONSTRAINT PK_vehicule PRIMARY KEY (numVehicule);

-- création des clés étrangères
ALTER TABLE chauffeur ADD CONSTRAINT FK_chauffeur_vehicule 
	FOREIGN KEY (numVehicule) REFERENCES vehicule (numVehicule) -- ON DELETE CASCADE
	;

-- Créer une erreur d'intégrité référentielle
--DELETE FROM vehicule WHERE numVehicule=1;
--GO