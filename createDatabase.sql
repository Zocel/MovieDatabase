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
  IdFilm INT PRIMARY KEY (IdFilm),
	IdPersonnage INT NOT NULL FOREIGN KEY (IdPersonnage) REFERENCES personnages (IdPersonnage),
  IdArtiste INT NOT NULL FOREIGN KEY (IdArtiste) REFERENCES artistes (IdArtiste),
  IdDistinction INT NOT NULL FOREIGN KEY (IdDistinction) REFERENCES distinction (IdDistinction),
  IdProduction INT NOT NULL FOREIGN KEY (IdProduction) REFERENCES societeproduction (IdProduction),
  IdBoxoffice INT NOT NULL FOREIGN KEY (IdBoxoffice) REFERENCES boxoffice (IdBoxoffice),
  IdDatesortie INT NOT NULL FOREIGN KEY (IdDatesortie) REFERENCES datesortie (IdDatesortie),
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
	IdPersonnage INT PRIMARY KEY (IdPersonnage),
	IdArtiste INT NOT NULL FOREIGN KEY (IdArtiste) REFERENCES artistes (IdArtiste),
	IdFilm INT NOT NULL FOREIGN KEY (IdFilm) REFERENCES films (IdFilm),
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
	IdArtiste INT PRIMARY KEY (IdArtiste),
	IdPersonnage INT NOT NULL FOREIGN KEY (IdPersonnage) REFERENCES personnages (IdPersonnage),
	IdDistinction INT NOT NULL FOREIGN KEY (IdDistinction) REFERENCES distinction (IdDistinction),
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
	IdDistinction INT PRIMARY KEY (IdDistinction),
	Titre_distinction VARCHAR(25) NOT NULL,
	Type_distinction VARCHAR(10) NOT NULL,
	Date_distinction DATE NOT NULL,
	Lieu_distinction VARCHAR(10)
);
GO
/* Création de la TABLE 'societeproduction' */
CREATE TABLE societeproduction
(
	IdProduction INT PRIMARY KEY (IdProduction),
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
	IdBoxoffice INT PRIMARY KEY (IdBoxoffice),
	Pay_boxoffice VARCHAR(10) NOT NULL,
	Recette_boxoffice INT NOT NULL,
	Date_arret_boxoffice DATE,
	Nombre_semaines INT
);
GO
/* Création de la TABLE 'datesortie' */
CREATE TABLE datesortie
(
	IdDatesortie INT PRIMARY KEY (IdDatesortie),
	Pays_datesortie VARCHAR(10) NOT NULL,
	Date_sortie DATE NOT NULL
);
GO
