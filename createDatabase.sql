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
  Titre_film VARCHAR(25) NOT NULL,
  Genre VARCHAR(20) NOT NULL,
  Budget INT NOT NULL,
  Duree INT NOT NULL,
  Pays_origine VARCHAR(15) NOT NULL,
  IdArtiste INT NOT NULL FOREIGN KEY (IdArtiste) REFERENCES Artiste (IdArtiste),
  IdDistinction INT NOT NULL FOREIGN KEY (IdDistinction) REFERENCES Distinction (IdDistinction),
  IdProduction INT NOT NULL FOREIGN KEY (IdProduction) REFERENCES Production (IdProduction),
  IdBoxoffice INT NOT NULL FOREIGN KEY (IdBoxoffice) REFERENCES Boxoffice (IdBoxoffice),
  IdDatesortie INT NOT NULL FOREIGN KEY (IdDatesortie) REFERENCES Datesortie (IdDatesortie)
);
GO
