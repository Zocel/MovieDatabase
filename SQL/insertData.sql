INSERT INTO films (titreFilm, genreFilm, budgetFilm, dureeFilm, paysorigineFilm)
VALUES
('Interstellar', 'Science-fiction', 165000000, 169, 'Royaume-Uni'),
('Dunkerque', 'Guerre', 100000000, 106, 'Royaume-Uni'),
('The Dark Knight : Le Chevalier noir', 'Super-héros', 185000000, 147, 'Royaume-Uni'),
('John Rambo', 'Action', 50000000, 91, 'État-Unis'),
('Projet X', 'Comédie', 12000000, 88, 'État-Unis'),
('Hannibal', 'Horreur', 87000000, 125, 'État-Unis'),
('Dragons', 'Animation', 165000000, 93, 'État-Unis'),
('Doctor Strange', 'Super-héros', 165000000, 147, 'État-Unis'),
('Invictus', 'Drame', 60000000, 134, 'État-Unis'),
('Indiana Jones et le Royaume du crâne de cristal', 'Aventure', 125000000, 123, 'État-Unis');

INSERT INTO personnages (nomPersonnage, prenomPersonnage, aliasPersonnage, lieuPersonnage, activitePersonnage, nemesisPersonnage, createurPersonnage, idFilm)
VALUES
('Cooper', 'Joseph', NULL, NULL, 'Ancien pilote de la NASA', NULL, NULL, 1),
('Brand', 'Amélia', NULL, NULL, 'Docteur', NULL, NULL, 1),
('Cooper', 'Murphy', NULL, NULL, 'Chercheuse scientifique', NULL, NULL, 1),
('Brand', 'John', NULL, NULL, 'Professeur', NULL, NULL, 1),
('Cooper', 'Tom', NULL, NULL, 'Agriculteur', NULL, NULL, 1),
('Cooper', 'Donald', NULL, NULL, NULL, NULL, NULL, 1),
(NULL, 'Tommy', NULL, 'Dunkerque', 'Soldat du CEB', 'Soldats allemands', NULL, 2),
(NULL, 'Peter', NULL, 'Dunkerque', 'Fils du capitaine du Moonstone', 'Soldats allemands', NULL, 2),
(NULL, 'Collins', NULL, 'Dunkerque', 'Pilote de la Royal Air Force', 'Soldats allemands', NULL, 2),
(NULL, 'Alex', NULL, 'Dunkerque', 'Soldat des Argyll & Sutherland Highlanders', 'Soldats allemands', NULL, 2),
(NULL, 'George', NULL, 'Dunkerque', "Membre d'équipage du Moonstone", 'Soldats allemands', NULL, 2),
(NULL, NULL, NULL, 'Dunkerque', 'Officier du CEB', 'Soldats allemands', NULL, 2),
('Wayne', 'Bruce','Batman', 'Gotham City', 'Propriétaire de Wayne Enterprises', 'Le Joker', '', 3),
(NULL, NULL,'Le Joker', 'Gotham City', 'Tueur en série', 'Batman', 'Bob Kane & Bill Finger', 3),
('Pennyworth', 'Alfred',NULL, 'Gotham City', 'Majordome', NULL, 'Bob Kane', 3),
('Gordon', 'Jim', NULL, 'Gotham City', 'Commissaire', 'Le Joker', 'Bob Kane & Bill Finger', 3),
('Dent', 'Harvey', 'Double-Face', 'Gotham City', 'Ancien procureur de district', 'Batman', 'Bob Kane & Bill Finger', 3),
('Dawes', 'Rachel', NULL, 'Gotham City', 'Ancien procureur général', NULL, 'David S. Goyer & Christopher Nolan', 3),
('Fox', 'Lucius', NULL, 'Gotham City', 'Directeur général de Wayne Enterprises', NULL, 'Len Wein & John Calnan',3),
('Crane', 'Jonathan', "L'Épouvantail", 'Gotham City', 'Docteur en psychologie', 'Batman','Bob Kane & Bill Finger', 3),
('Rambo', 'John James H.', 'Corbeau', 'Thaïlande', 'Militaire', 'Major Tint', 'David Morrell', 4),
('Miller', 'Sarah', NULL, 'États-Unis', NULL, 'Major Tint', NULL, 4),
('Burnett', 'Michael', NULL, 'États-Unis', 'Docteur', 'Major Tint', NULL, 4),
('Lewis', NULL, NULL, 'États-Unis', 'Militaire', 'Major Tint', NULL, 4),
(NULL, NULL, "L'Écolier", 'États-Unis', 'Militaire', 'Major Tint', NULL, 4),
('En-Joo', NULL, NULL, 'États-Unis', 'Militaire', 'Major Tint', NULL, 4),
('Trautman', 'Samuel', 'Sam', NULL, 'Colonel', NULL, 'David Morrell',4),
('Kub', 'Thomas', NULL, 'Pasadena', 'Élève de terminale', NULL, NULL, 5),
(NULL, NULL, 'Costa', 'Pasadena', 'Élève de terminale', NULL, NULL, 5),
(NULL, NULL, 'JB', 'Pasadena', 'Élève de terminale', NULL, NULL, 5),
(NULL, 'Kirby', NULL, 'Pasadena', 'Élève de terminale', NULL, NULL, 5),
(NULL, 'Everett', NULL, 'Pasadena', 'Élève de terminale', NULL, NULL, 5),
(NULL, 'Alexis', NULL, 'Pasadena', 'Élève de terminale', NULL, NULL, 5),
('Lecter', 'Hannibal', 'Hannibal le Cannibale', 'Florence', 'Psychiatre', 'Mason Verger', 'Thomas Harris', 6),
('Starling', 'Clarice', NULL, 'Florence', 'Agent du FBI', 'Hannibal Lecter', 'Thomas Harris', 6),
('Verger', 'Mason', NULL, 'Florence', 'Milliardaire pédophile', 'Hannibal Lecter', 'Thomas Harris', 6),
('Haddock', "Harold Horrib'", NULL, 'Île de Beurk', 'Jeune apprenti forgeron', NULL, 'Cressida Cowell', 7),
(NULL, 'Stoïk', 'Stoïk la Brute', 'Île de Beurk', NULL, NULL, 'Cressida Cowell', 7),
(NULL, NULL, 'Gueulfor', 'Île de Beurk', NULL, NULL, 'Cressida Cowell', 7),
('Hofferson', 'Astrid', NULL, 'Île de Beurk', NULL, NULL, 'Cressida Cowell', 7),
('Strange', 'Stephen', 'Docteur Strange', 'New York', 'Ancien neurochirurgien', 'Dormammu', 'Stan Lee & Steve Ditko', 8),
('Mordo', 'Karl Amadeus', 'Baron Mordo', 'Kamar-Taj', "Ancien prince consort d'Umar", 'Docteur Strange', 'Stan Lee & Steve Ditko', 8),
('Strange', 'Stephen', 'Docteur Strange', 'New York', 'Ancien neurochirurgien', 'Dormammu', 'Stan Lee & Steve Ditko', 8),
(NULL, 'Yao', "L'Ancien", "Kamar-Taj", 'Sorcier Suprême', 'Dormammu', 'Stan Lee & Steve Ditko', 8),
('Palmer', 'Christine', NULL, 'New York', 'Docteur', NULL, NULL, 8),
('Mandela', 'Nelson', 'Madiba', 'Afrique du Sud', "Président de l'Afrique du Sud", NULL, NULL, 9),
('Pienaar', 'Francois', NULL, 'Afrique du Sud', 'Capitaine des Springboks', NULL, NULL, 9),
('Stransky', 'Joël', NULL, 'Afrique du Sud', 'Joueur de rugby à XV Sud-Africain', NULL, NULL, 9),
('Jones', 'Henry Walton', 'Indiana Jones', NULL, 'Archéologue', 'Colonel Irina Spalko ', 'George Lucas', 10),
('Ravenwood', 'Marion', NULL, NULL, NULL, NULL, 'George Lucas', 10),
('Spalko', 'Irina', NULL, NULL, 'Colonel soviétique', 'Indiana Jones', NULL, 10),
('Williams', 'Henry', 'Mutt', NULL, NULL, 'Colonel Irina Spalko', NULL, 10),
('Oxley', 'Harold', NULL, NULL, 'Professeur', NULL, NULL, 10);


INSERT INTO boxoffice(paysBoxoffice, recetteBoxoffice, datearretBoxoffice, nombresemaineBoxoffice, idFilm)
VALUES
('France', 2640439, '2015-02-03', 13, 1),
('France', 2525630, '2017-10-31', 15, 2),
('France', 3036568, '2009-11-05', 11, 3),
('France', 850346, '2008-04-09', 11, 4),
('France', 1847000, '2012-05-15', 11, 5),
('France', 2579878, '2001-04-03', 11, 6),
('France', 2225690, '2010-10-16', 11, 7),
('France', 1973652, '2016-11-22', 11, 8),
('France', 3110394, '2010-03-23', 11, 9),
('États-Unis', 786000000, '2008-08-05', 11, 10);

INSERT INTO datesortie(paysDatesortie, forbiddenpaysDatesortie, dateSortie, idFilm) 
VALUES
('France', NULL, '2014-11-05', 1),
('France', NULL, '2017-07-19', 2),
('France', NULL, '2008-08-13', 3),
('France', NULL, '2008-02-06', 4),
('France', NULL, '2012-03-14', 5),
('France', NULL, '2001-02-28', 6),
('France', NULL, '2010-06-30', 7),
('France', NULL, '2016-10-26', 8),
('France', NULL, '2010-01-13', 9),
('France', NULL, '2008-05-21', 10);

INSERT INTO critique(nomCritique, notepresseCritique, notespectateurCritique, idFilm)
VALUES
(Allociné, 3.8, 4.5, 1),
(Allociné, 4.1, 3.9, 2),
(Allociné, 4.0, 4.5, 3),
(Allociné, 2.6, 3.4, 4),
(Allociné, 3.0, 3.4, 5),
(Allociné, 3.3, 3.4, 6),
(Allociné, 3.8, 4.4, 7),
(Allociné, 3.1, 4.0, 8),
(Allociné, 4.1, 4.1, 9),
(Allociné, 3.0, 3.0, 10);

INSERT INTO societeproduction(nomProduction, creationProduction, fondateurProduction, siegesocialProduction, directeurProduction, idFilm)
VALUES
('Syncopy Films', '2001-01-01', 'Christopher Nolan', 'Londres', 'Christopher Nolan', 1),
('Syncopy Films', '2001-01-01', 'Christopher Nolan', 'Londres', 'Christopher Nolan', 2),
('Syncopy Films', '2001-01-01', 'Christopher Nolan', 'Londres', 'Christopher Nolan', 3),
('Lionsgate', '1997-07-03', 'Frank Giustra', 'Santa Monica', 'Jon Felthheimer', 4),
('Green Hat Films', '2008-01-01', NULL, NULL, NULL, 5),
('Scott Free Productions', '1995-01-01', 'Ridley Scott', 'Londres', 'Ridley Scott', 6),
('DreamWorks Animation', '1994-10-12', 'Steven Spielberg', 'Glendale', 'Christopher DeFaria', 7),
('Marvel Studios', '1992-05-13', 'Avi Arad', 'Californie', 'Kevin Feige', 8),
('Malpaso Productions', '1967-01-01', 'Clint Eastwood', 'Burbank', 'Clint Eastwood', 9),
('Lucasfilm', '1971-01-01', 'Georges Lucas', 'Californie', 'Kathleen Kennedy', 10);