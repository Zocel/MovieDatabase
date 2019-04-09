CREATE TABLE categoriedistinctions
(
	idCategorie INT IDENTITY(1,1) PRIMARY KEY,
	nomCategorie VARCHAR(50),
);
GO

/* Création de la TABLE 'distinctions' */

CREATE TABLE distinctions
(
	idDistinction INT IDENTITY(1,1) PRIMARY KEY,
	titreDistinction VARCHAR(50),
	typeDistinction VARCHAR(20) CONSTRAINT distinctions_typeDistinction_CK CHECK(typeDistinction IN ('Récompense','Nominations')),
	dateDistinction DATE,
	lieuDistinction VARCHAR(50),
	idCategorie INT CONSTRAINT distinctions_idCategorie_FK REFERENCES categoriedistinctions NOT NULL
);
GO

/* Création de la TABLE 'films' */

CREATE TABLE films
(
	idFilm INT IDENTITY(1,1) PRIMARY KEY,
	titreFilm VARCHAR(55) CONSTRAINT films_titreFilm_NN NOT NULL,
	genreFilm VARCHAR(50) CONSTRAINT films_genreFilm_NN NOT NULL,
	budgetFilm INT CONSTRAINT films_budgetFilm_NN NOT NULL,
	dureeFilm INT CONSTRAINT films_dureeFilm_NN NOT NULL,
	paysorigineFilm VARCHAR(50) CONSTRAINT films_paysorigineFilm_NN NOT NULL,
	idDistinction INT CONSTRAINT films_idDistinction_FK REFERENCES distinctions
);
GO

/* Création de la TABLE 'personnages' */

CREATE TABLE personnages
(
	idPersonnage INT IDENTITY(1,1) PRIMARY KEY,
	nomPersonnage VARCHAR(50),
	prenomPersonnage VARCHAR(50),
	aliasPersonnage VARCHAR(50),
	lieuPersonnage VARCHAR(50),
	activitePersonnage VARCHAR(50),
	nemesisPersonnage VARCHAR(50),
	createurPersonnage VARCHAR(50),
	idFilm INT CONSTRAINT personnages_idFilm_FK REFERENCES films
);
GO

/* Création de la TABLE 'artistes' */

CREATE TABLE artistes
(
	idArtiste INT IDENTITY(1,1) PRIMARY KEY,
	idDistinction INT CONSTRAINT aqrtistes_idDistinction_FK REFERENCES distinctions,
	nomArtiste VARCHAR(50) CONSTRAINT artistes_nomArtiste_NN NOT NULL,
	prenomArtiste VARCHAR(50) CONSTRAINT artistes_prenomArtiste_NN NOT NULL,
	naissanceArtiste DATE CONSTRAINT artistes_naissanceArtiste_NN NOT NULL,
	mortArtiste DATE,
	sexeArtiste VARCHAR(1) CONSTRAINT artistes_sexeArtiste_CK CHECK (sexeArtiste IN ('M','F')),
	tailleArtiste DECIMAL(3,2),
	nationaliteArtiste VARCHAR(50),
	professionArtiste VARCHAR(50),
	idFilm INT CONSTRAINT artistes_idFilm_FK REFERENCES films NOT NULL,
	idPersonnage INT CONSTRAINT artistes_idPersonnage_FK REFERENCES personnages
);
GO

/* Création de la TABLE 'societeproduction' */

CREATE TABLE societeproduction
(
	idProduction INT IDENTITY(1,1) PRIMARY KEY,
	nomProduction VARCHAR(50) CONSTRAINT societeproduction_nomProduction_NN NOT NULL,
	creationProduction DATE CONSTRAINT societeproduction_creationProduction_NN NOT NULL,
	fondateurProduction VARCHAR(50),
	siegesocialProduction VARCHAR(50),
	directeurProduction VARCHAR(50),
	idFilm INT CONSTRAINT societeproduction_idFilm_FK REFERENCES films
);
GO

/* Création de la TABLE 'critique' */

CREATE TABLE critique
(
	idCritique INT IDENTITY(1,1) PRIMARY KEY,
	nomCritique VARCHAR(50),
	notepresseCritique DECIMAL(2,1),
	notespectateurCritique DECIMAL(2,1),
	idFilm INT CONSTRAINT critique_idFilm_FK REFERENCES films
);
GO

/* Création de la TABLE 'boxoffice' */

CREATE TABLE boxoffice
(
	idBoxoffice INT IDENTITY(1,1) PRIMARY KEY,
	paysBoxoffice VARCHAR(50) CONSTRAINT boxoffice_paysBoxoffice_NN NOT NULL,
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
	forbiddenpaysDatesortie VARCHAR(50),
	dateSortie DATE CONSTRAINT datesortie_dateSortie_NN NOT NULL,
	idFilm INT CONSTRAINT datesortie_idFilm_FK REFERENCES films
);
GO