/* Création de la DATABASE 'MOVIES' avec vérification qu'elle existe déjà */
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'MOVIES')
DROP DATABASE [MOVIES]
GO
CREATE DATABASE [MOVIES]
GO
use [MOVIES]
GO

/* Création de la TABLE 'personnages' */
CREATE TABLE personnages
(
	idPersonnage INT IDENTITY(1,1) CONSTRAINT personnages_idPersonnage_PK PRIMARY KEY,
	nom_personnage VARCHAR(25) NOT NULL,
	prenom_personnage VARCHAR(20) NOT NULL,
	naissance_personnage DATE NULL,
	activite_personnage VARCHAR(15) NOT NULL,
	taille_personnage DECIMAL(3,2),
	nemesis_personnage VARCHAR(15),
	createur_personnage VARCHAR(50)
);
GO
/* Création de la TABLE 'distinctions' */
CREATE TABLE distinctions
(
	idDistinction INT IDENTITY(1,1) PRIMARY KEY,
	titre_distinction VARCHAR(25) NOT NULL,
	type_distinction VARCHAR(10) NOT NULL,
	date_distinction DATE NOT NULL,
	lieu_distinction VARCHAR(10)
);
GO
/* Création de la TABLE 'artistes' */
CREATE TABLE artistes
(
	idArtiste INT IDENTITY(1,1) PRIMARY KEY,
	idPersonnage INT CONSTRAINT  artiste_idPersonnage_FK REFERENCES personnages,
	idDistinction INT CONSTRAINT artiste_idDistinction_FK REFERENCES distinctions,
	nom_artiste VARCHAR(25) NOT NULL,
	prenom_artiste VARCHAR(20) NOT NULL,
	naissance_artiste DATE NOT NULL,
	sexe VARCHAR(1),
	profession VARCHAR(15)
);
GO
/* Création de la TABLE 'societeproduction' */
CREATE TABLE societeproduction
(
	idProduction INT IDENTITY(1,1) PRIMARY KEY,
	nom_societe VARCHAR(20) NOT NULL,
	creation DATE NOT NULL,
	fondateur VARCHAR(50) NOT NULL,
	siege_social VARCHAR(10) NOT NULL,
	directeur VARCHAR(50) NOT NULL
);
GO
/* Création de la TABLE 'critique' */
CREATE TABLE critique
(
	idCritique INT IDENTITY(1,1) PRIMARY KEY,
	nom_critique VARCHAR(20),
	note_critique DECIMAL(2,1)
);
GO
/* Création de la TABLE 'boxoffice' */
CREATE TABLE boxoffice
(
	idBoxoffice INT IDENTITY(1,1) PRIMARY KEY,
	pays_boxoffice VARCHAR(10) NOT NULL,
	recette_boxoffice INT NOT NULL,
	date_arret_boxoffice DATE,
	nombre_semaines INT
);
GO
/* Création de la TABLE 'datesortie' */
CREATE TABLE datesortie
(
	idDatesortie INT IDENTITY(1,1) PRIMARY KEY,
	pays_datesortie VARCHAR(10) NOT NULL,
	date_sortie DATE NOT NULL
);
GO
/* Création de la TABLE 'films' */
CREATE TABLE films
(
	idFilm INT IDENTITY(1,1) CONSTRAINT films_idFilm_PK PRIMARY KEY,
	titre_film VARCHAR(25) NOT NULL,
	genre VARCHAR(20) NOT NULL,
	budget INT NOT NULL,
	duree INT NOT NULL,
	pays_origine VARCHAR(15) NOT NULL,
	idPersonnage INT CONSTRAINT films_idPersonnage_FK REFERENCES personnages,
	idArtiste INT CONSTRAINT films_idArtiste_FK REFERENCES artistes,
	idDistinction INT CONSTRAINT films_idDistinction_FK REFERENCES distinctions,
	idProduction INT CONSTRAINT films_idProduction_FK REFERENCES societeproduction,
	idCritique INT CONSTRAINT films_idCritique_FK REFERENCES critique,
	idBoxoffice INT CONSTRAINT films_idBoxoffice_FK REFERENCES boxoffice,
	idDatesortie INT CONSTRAINT films_idDatesortie_FK REFERENCES datesortie
);
GO
