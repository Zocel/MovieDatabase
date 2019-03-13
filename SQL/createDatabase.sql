/* Création de la DATABASE 'MOVIES' avec vérification qu'elle existe déjà */

IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'MOVIES')
DROP DATABASE [MOVIES]
GO
CREATE DATABASE [MOVIES]
GO
use [MOVIES]
GO

/* Création de la TABLE 'films' */

CREATE TABLE films
(
	idFilm INT IDENTITY(1,1) PRIMARY KEY,
	titreFilm VARCHAR(55) CONSTRAINT films_titreFilm_NN NOT NULL,
	genreFilm VARCHAR(20) CONSTRAINT films_genreFilm_NN NOT NULL,
	budgetFilm INT CONSTRAINT films_budgetFilm_NN NOT NULL,
	dureeFilm INT CONSTRAINT films_dureeFilm_NN NOT NULL,
	paysorigineFilm VARCHAR(15) CONSTRAINT films_paysorigineFilm_NN NOT NULL
);
GO

/* Création de la TABLE 'personnages' */

CREATE TABLE personnages
(
	idPersonnage INT IDENTITY(1,1) PRIMARY KEY,
	nomPersonnage VARCHAR(25),
	prenomPersonnage VARCHAR(20),
	aliasPersonnage VARCHAR(15),
	lieuPersonnage VARCHAR(20),
	activitePersonnage VARCHAR(15),
	nemesisPersonnage VARCHAR(15),
	createurPersonnage VARCHAR(50),
	idFilm INT CONSTRAINT personnages_idFilm_FK REFERENCES films
);
GO

/* Création de la TABLE 'distinctions' */

CREATE TABLE distinctions
(
	idDistinction INT IDENTITY(1,1) PRIMARY KEY,
	titreDistinction VARCHAR(25),
	typeDistinction VARCHAR(10) CONSTRAINT distinctions_typeDistinction_CK CHECK(typeDistinction IN ('Récompense','Nominations')),
	dateDistinction DATE,
	lieuDistinction VARCHAR(10),
	idFilm INT CONSTRAINT distinctions_idFilm_FK REFERENCES films,
	idCategorie INT CONSTRAINT distinctions_idCategorie_FK REFERENCES categoriedistinctions,
	idArtiste INT CONSTRAINT distinctions_idArtiste_FK REFERENCES artistes
);
GO

/* Création de la TABLE 'categoriedistinctions' */

CREATE TABLE categoriedistinctions
(
	idCategorie INT IDENTITY(1,1) PRIMARY KEY,
	nomCategorie VARCHAR(15),
);
GO

/* Création de la TABLE 'artistes' */

CREATE TABLE artistes
(
	idArtiste INT IDENTITY(1,1) PRIMARY KEY,
	idPersonnage INT CONSTRAINT  artistes_idPersonnage_FK REFERENCES personnages,
	idDistinction INT CONSTRAINT artistes_idDistinction_FK REFERENCES distinctions,
	nomArtiste VARCHAR(25) CONSTRAINT artistes_nomArtiste_NN NOT NULL,
	prenomArtiste VARCHAR(20) CONSTRAINT artistes_prenomArtiste_NN NOT NULL,
	naissanceArtiste DATE CONSTRAINT artistes_naissanceArtiste_NN NOT NULL,
	mortArtiste DATE,
	sexeArtiste VARCHAR(1) CONSTRAINT artistes_sexeArtiste_CK CHECK (sexeArtiste IN ('M','F')),
	tailleArtiste DECIMAL(3,2),
	nationaliteArtiste VARCHAR(15),
	professionArtiste VARCHAR(30),
	idFilm INT CONSTRAINT artistes_idFilm_FK REFERENCES films
);
GO

/* Création de la TABLE 'societeproduction' */

CREATE TABLE societeproduction
(
	idProduction INT IDENTITY(1,1) PRIMARY KEY,
	nomProduction VARCHAR(20) CONSTRAINT societeproduction_nomProduction_NN NOT NULL,
	creationProduction DATE CONSTRAINT societeproduction_creationProduction_NN NOT NULL,
	fondateurProduction VARCHAR(50) CONSTRAINT societeproduction_fondateurProduction_NN NOT NULL,
	siegesocialProduction VARCHAR(10) CONSTRAINT societeproduction_siegesocialProduction_NN NOT NULL,
	directeurProduction VARCHAR(50),
	idFilm INT CONSTRAINT societeproduction_idFilm_FK REFERENCES films
);
GO

/* Création de la TABLE 'critique' */

CREATE TABLE critique
(
	idCritique INT IDENTITY(1,1) PRIMARY KEY,
	nomCritique VARCHAR(20),
	notepresseCritique DECIMAL(2,1),
	notespectateurCritique DECIMAL(2,1),
	idFilm INT CONSTRAINT critique_idFilm_FK REFERENCES films
);
GO

/* Création de la TABLE 'boxoffice' */

CREATE TABLE boxoffice
(
	idBoxoffice INT IDENTITY(1,1) PRIMARY KEY,
	paysBoxoffice VARCHAR(10) CONSTRAINT boxoffice_paysBoxoffice_NN NOT NULL,
	recetteBoxoffice INT CONSTRAINT boxoffice_recetteBoxoffice_NN NOT NULL,
	datearretBoxoffice DATE,
	nombresemainesBoxoffice INT,
	idFilm INT CONSTRAINT boxoffice_idFilm_FK REFERENCES films
);
GO

/* Création de la TABLE 'datesortie' */

CREATE TABLE datesortie
(
	idDatesortie INT IDENTITY(1,1) PRIMARY KEY,
	paysDatesortie VARCHAR(10) CONSTRAINT datesortie_paysDatesortie_NN NOT NULL,
	forbiddenpaysDatesortie VARCHAR(10),
	dateSortie DATE CONSTRAINT datesortie_dateSortie_NN NOT NULL,
	idFilm INT CONSTRAINT datesortie_idFilm_FK REFERENCES films
);
GO
