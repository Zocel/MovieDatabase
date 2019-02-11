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
  IdFilm INT IDENTITY(1,1) PRIMARY KEY,
	IdPersonnage INT CONSTRAINT films_IdPersonnage_FK FOREIGN KEY (IdPersonnage) REFERENCES personnages(IdPersonnage),
  IdArtiste INT CONSTRAINT films_IdArtiste_FK FOREIGN KEY (IdArtiste) REFERENCES artistes(IdArtiste),
  IdDistinction INT CONSTRAINT films_IdDistinction_FK FOREIGN KEY (IdDistinction) REFERENCES distinction(IdDistinction),
  IdProduction INT CONSTRAINT films_IdProduction_FK FOREIGN KEY (IdProduction) REFERENCES societeproduction(IdProduction),
  IdBoxoffice INT CONSTRAINT films_IdBoxoffice_FK FOREIGN KEY (IdBoxoffice) REFERENCES boxoffice(IdBoxoffice),
  IdDatesortie INT CONSTRAINT films_IdDatesortie_FK FOREIGN KEY (IdDatesortie) REFERENCES datesortie(IdDatesortie),
  Titre_film VARCHAR(25) NOT NULL,
  Genre VARCHAR(20) NOT NULL,
  Budget INT NOT NULL,
  Duree INT NOT NULL,
  Pays_origine VARCHAR(15) NOT NULL
);
GO
/* Création de la TABLE 'personnages' */
CREATE TABLE personnages
(
	IdPersonnage INT IDENTITY(1,1) PRIMARY KEY,
	IdArtiste INT CONSTRAINT personnages_IdArtiste_FK  FOREIGN KEY (IdArtiste) REFERENCES artistes(IdArtiste),
	IdFilm INT CONSTRAINT personnages_IdFilm_FK FOREIGN KEY (IdFilm) REFERENCES films(IdFilm),
	Nom_personnage VARCHAR(25) NOT NULL,
	Prenom_personnage VARCHAR(20) NOT NULL,
	Naissance_personnage DATE NOT NULL,
	Activite_personnage VARCHAR(15) NOT NULL,
	Taille_personnage DECIMAL(3),
	Nemesis_personnage VARCHAR(15),
	Createur_personnage VARCHAR(50)
);
GO
/* Création de la TABLE 'artistes' */
CREATE TABLE artistes
(
	IdArtiste INT IDENTITY(1,1) PRIMARY KEY,
	IdPersonnage INT CONSTRAINT  artistes_IdPersonnage_FK FOREIGN KEY (IdPersonnage) REFERENCES personnages(IdPersonnage),
	IdDistinction INT CONSTRAINT artistes_IdDistinction_FK FOREIGN KEY (IdDistinction) REFERENCES distinction(IdDistinction),
	Nom_artiste VARCHAR(25) NOT NULL,
	Prenom_artiste VARCHAR(20) NOT NULL,
	Naissance_artiste DATE NOT NULL,
	Sexe VARCHAR(1),
	Profession VARCHAR(15)
);
GO
/* Création de la TABLE 'distinctions' */
CREATE TABLE distinctions
(
	IdDistinction INT IDENTITY(1,1) PRIMARY KEY,
	Titre_distinction VARCHAR(25) NOT NULL,
	Type_distinction VARCHAR(10) NOT NULL,
	Date_distinction DATE NOT NULL,
	Lieu_distinction VARCHAR(10)
);
GO
/* Création de la TABLE 'societeproduction' */
CREATE TABLE societeproduction
(
	IdProduction INT IDENTITY(1,1) PRIMARY KEY,
	Nom_societe VARCHAR(20) NOT NULL,
	Creation DATE NOT NULL,
	Fondateur VARCHAR(50) NOT NULL,
	Siege_social VARCHAR(10) NOT NULL,
	Directeur VARCHAR(50) NOT NULL
);
GO
/* Création de la TABLE 'boxoffice' */
CREATE TABLE boxoffice
(
	IdBoxoffice INT IDENTITY(1,1) PRIMARY KEY,
	Pay_boxoffice VARCHAR(10) NOT NULL,
	Recette_boxoffice INT NOT NULL,
	Date_arret_boxoffice DATE,
	Nombre_semaines INT
);
GO
/* Création de la TABLE 'datesortie' */
CREATE TABLE datesortie
(
	IdDatesortie INT IDENTITY(1,1) PRIMARY KEY,
	Pays_datesortie VARCHAR(10) NOT NULL,
	Date_sortie DATE NOT NULL
);
GO
