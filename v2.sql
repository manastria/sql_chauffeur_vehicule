use mabase;

-- Supression des contraintes PK et FK de toutes les tables
DECLARE @sql nvarchar(max) = '';
SELECT  @sql += 'ALTER TABLE ' + Table_Name  +'  drop constraint ' + Constraint_Name + ';'
FROM Information_Schema.CONSTRAINT_TABLE_USAGE 
ORDER BY Constraint_Name 
EXEC SP_EXECUTESQL @sql;
GO


-- supression des tables de la BDD
EXEC sp_MSforeachtable @command1 = "DROP TABLE ?"
GO

CREATE TABLE chauffeur (
	-- -- num_chauffeur INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	numChauffeur int NOT NULL,
	nomChauffeur varchar(max)
);

CREATE TABLE vehicule (
	numVehicule int NOT NULL,
	marqueVehicule varchar(max)
);

CREATE TABLE chauffeur_vehicule (
	numChauffeur int NOT NULL,
	numVehicule int NOT NULL,
	dateUtil date
);

GO

INSERT INTO vehicule (numVehicule, marqueVehicule)
VALUES 
	(1, 'M1'),
	(2, 'M2'),
	(3, 'M3'),
	(4, 'M4')
;

INSERT INTO chauffeur (numChauffeur, nomChauffeur)
VALUES 
	(1, 'C1'),
	(2, 'C2'),
	(3, 'C3'),
	(4, 'C4')
;

INSERT INTO chauffeur_vehicule (numVehicule, numChauffeur, dateUtil)
VALUES 
	(1, 2, '2015-02-28')
;
GO

-- ajout des contraintes pour les clés primaire

ALTER TABLE chauffeur ADD CONSTRAINT PK_chauffeur PRIMARY KEY (numChauffeur);
ALTER TABLE vehicule ADD CONSTRAINT PK_vehicule PRIMARY KEY (numVehicule);
ALTER TABLE chauffeur_vehicule ADD CONSTRAINT PK_chauffeur_vehicule PRIMARY KEY (numVehicule, numChauffeur);

-- ajout des contraintes pour les clés étrangères
ALTER TABLE chauffeur_vehicule ADD CONSTRAINT FK_chauffeur_vehicule_vehicule 
	FOREIGN KEY (numVehicule) REFERENCES vehicule (numVehicule) 
	;
ALTER TABLE chauffeur_vehicule ADD CONSTRAINT FK_chauffeur_vehicule_chauffeur
	FOREIGN KEY (numChauffeur) REFERENCES chauffeur (numChauffeur) 
	;