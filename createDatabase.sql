/* Création de la DATABASE 'FILMS' avec vérification qu'elle existe déjà */
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'FILMS')
	DROP DATABASE [FILMS]
GO
CREATE DATABASE [FILMS]
GO
use [FILMS]
GO

/* Création de la TABLE 'films' */
CREATE TABLE films
(
  idFilm INT IDENTITY(1,1) PRIMARY KEY,
	idPersonnage INT CONSTRAINT films_idPersonnage_FK FOREIGN KEY (idPersonnage) REFERENCES personnages(idPersonnage),
  idArtiste INT CONSTRAINT films_idArtiste_FK FOREIGN KEY (idArtiste) REFERENCES artistes(idArtiste),
  idDistinction INT CONSTRAINT films_idDistinction_FK FOREIGN KEY (idDistinction) REFERENCES distinction(idDistinction),
  idProduction INT CONSTRAINT films_idProduction_FK FOREIGN KEY (idProduction) REFERENCES societeproduction(idProduction),
	idCritique INT CONSTRAINT films_idCritique_FK FOREIGN KEY (idCritique) REFERENCES critique(idCritique),
	idBoxoffice INT CONSTRAINT films_idBoxoffice_FK FOREIGN KEY (idBoxoffice) REFERENCES boxoffice(idBoxoffice),
  idDatesortie INT CONSTRAINT films_idDatesortie_FK FOREIGN KEY (idDatesortie) REFERENCES datesortie(idDatesortie),
  titre_film VARCHAR(25) NOT NULL,
  genre VARCHAR(20) NOT NULL,
  budget INT NOT NULL,
  duree INT NOT NULL,
  pays_origine VARCHAR(15) NOT NULL
);
GO
/* Création de la TABLE 'personnages' */
CREATE TABLE personnages
(
	idPersonnage INT IDENTITY(1,1) PRIMARY KEY,
	idArtiste INT CONSTRAINT personnages_idArtiste_FK  FOREIGN KEY (idArtiste) REFERENCES artistes(idArtiste),
	idFilm INT CONSTRAINT personnages_idFilm_FK FOREIGN KEY (idFilm) REFERENCES films(idFilm),
	nom_personnage VARCHAR(25) NOT NULL,
	prenom_personnage VARCHAR(20) NOT NULL,
	naissance_personnage DATE NULL,
	activite_personnage VARCHAR(15) NOT NULL,
	taille_personnage DECIMAL(1,2),
	nemesis_personnage VARCHAR(15),
	createur_personnage VARCHAR(50)
);
GO
/* Création de la TABLE 'artistes' */
CREATE TABLE artistes
(
	idArtiste INT IDENTITY(1,1) PRIMARY KEY,
	idPersonnage INT CONSTRAINT  artistes_idPersonnage_FK FOREIGN KEY (idPersonnage) REFERENCES personnages(idPersonnage),
	idDistinction INT CONSTRAINT artistes_idDistinction_FK FOREIGN KEY (idDistinction) REFERENCES distinction(idDistinction),
	nom_artiste VARCHAR(25) NOT NULL,
	prenom_artiste VARCHAR(20) NOT NULL,
	naissance_artiste DATE NOT NULL,
	sexe VARCHAR(1),
	profession VARCHAR(15)
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
