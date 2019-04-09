# MovieDatabase

Ce projet de *Ydays* consiste en la création d'une base de données en **SQL** sur les films.


## Auteurs

**Bordeaux Ynov Campus Informatique**

+   **Thibault FEUGÈRE** - B1 A - [ThibaultFeugere](https://github.com/ThibaultFeugere)
+   **Rémi FEYDIT** - B1 A - [RemiFeydit](https://github.com/RemiFeydit)
+   **Yann LE COZ** - B1 B - [ianlcz](https://github.com/ianlcz)


## Sommaire

+   [Qu'est-ce que le SQL ?](#quest-ce-que-le-sql-)
+   [Modèle Conceptuel de Données](#modèle-conceptuel-de-données)
+   [Pool de 10 questions](#pool-de-10-questions)


## Qu'est-ce que le SQL ?

Le **SQL** (Structured Query Language) est un langage informatique normalisé servant à exploiter des bases de données. La partie langage de manipulation des données de SQL permet de rechercher, d'ajouter, de modifier ou de supprimer des données dans les bases de données.


## Modèle Conceptuel de Données

![](https://github.com/ianlcz/MovieDatabase/blob/master/Images/Sch%C3%A9ma%20MCD%20MovieDatabase.png)


## Pool de 10 questions

1.  Sur tous les films sorties après les années 2010, quels est le budget moyen ?

     ```sql
     SELECT FORMAT((SUM(f.budgetFilm) / COUNT(f.titreFilm)), 'C', 'en-us') as "Budget Moyen Film année 2010"
     FROM FILMS f
     INNER JOIN datesortie ds
     ON (f.idFilm = ds.idFilm)
     WHERE YEAR(ds.dateSortie) > 2010;
    ```

1.  Sur la totalité des films, quel est la durée moyenne d'un film ?

     ```sql
    SELECT (SUM(dureeFilm) / COUNT(titreFilm)) as "Durée moyenne film"
    FROM FILMS;
    ```

1.  Quel film de Christopher Nolan a généré le plus de recettes ?

     ```sql
     SELECT f.titreFilm, FORMAT(b.recetteBoxoffice, 'C', 'en-us') AS "Recette"
     FROM FILMS f
     INNER JOIN artistes a
     ON (f.idFilm = a.idFilm)
     INNER JOIN boxoffice b
     ON f.idFilm = b.idFilm
     WHERE UPPER(a.nomArtiste) = 'NOLAN'
     AND b.recetteBoxoffice = (SELECT MAX(recetteboxoffice)
                              FROM FILMS f
                              INNER JOIN boxoffice b
                              ON f.idFilm = b.idFilm
                              INNER JOIN artistes a
                              ON f.idFilm = a.idFilm
                              WHERE UPPER(a.nomArtiste) = 'NOLAN');
    ```

1.  Quel film a connu la plus mauvaise critique de la presse sur Allociné ?

     ```sql
    SELECT titreFilm
    FROM FILMS f
    INNER JOIN critique c
    ON f.idFilm = c.idFilm
    WHERE c.notepresseCritique = (SELECT MIN(notepresseCritique) 
    				  FROM critique 
				  WHERE UPPER(nomCritique) = 'ALLOCINÉ');
    ```

1.  Quel film a eu le meilleur rendement financier (à gagné plus que ce qu'il n'a coûté) ?

     ```sql
    SELECT f.titreFilm
    FROM FILMS f
    INNER JOIN boxoffice b
    ON (f.idFilm = b.idFilm)
    WHERE f.budgetFilm - b.recetteBoxOffice = (SELECT MAX(budgetFilm - recetteBoxoffice)
                                               FROM FILMS f
                                               INNER JOIN boxoffice b
                                               ON (f.idFilm = b.idFilm));
    ```

1.  Sur tous les fims, quels acteurs ont participés au film avec le plus de recettes ?

     ```sql
    SELECT CONCAT(a.nomArtiste, ' ' , a.prenomArtiste) as "Acteurs", a.professionArtiste
    FROM FILMS f
    INNER JOIN artistes a
    ON f.idFilm = a.idFilm
    INNER JOIN boxoffice b
    ON f.idFilm = b.idFilm
    WHERE b.recetteBoxOffice = (SELECT max(recetteBoxoffice)
				FROM boxoffice)
    AND LOWER(a.professionArtiste) = 'Acteur';
    ```
1.  Afficher le nom et le prénom des artistes décédés avec leurs dates de naissance, de decès ainsi que leur âge quand ils sont morts

     ```sql
    SELECT nomArtiste, prenomArtiste, naissanceArtiste, mortArtiste, DATEDIFF(year, naissanceArtiste, mortArtiste) AS "Àge de l'artiste à sa mort"
    FROM artistes 
    WHERE mortArtiste IS NOT NULL;
    ```

1.  Quelle est la moyenne d'âge des artistes ?
     ```sql
    SELECT AVG(DATEDIFF(year, naissanceArtiste, GETDATE())) as "Moyenne âge artistes"
    FROM artistes;
    ```

1.  Quel est le film qui est resté le plus longtemps dans les salles, le nombre de semaine et le pays ?

     ```sql
     SELECT f.titreFilm, b.nombresemainesBoxoffice, b.paysBoxoffice
     FROM films f
     INNER JOIN boxoffice b
     ON f.idFilm = b.idFilm
     WHERE b.nombresemainesBoxoffice = (SELECT MAX(nombresemainesboxoffice)
                                        FROM boxoffice);
    ```

1.  Afficher les noms des films avec le nom complet du héros ou son alias (s'il en a un) ainsi que son némésis

     ```sql
     SELECT f.titreFilm,
	CASE
	     WHEN p.aliasPersonnage IS NOT NULL THEN p.aliasPersonnage
          WHEN p.nomPersonnage IS NULL THEN p.prenomPersonnage
          WHEN p.prenomPersonnage IS NOT NULL THEN p.nomPersonnage
	     ELSE CONCAT(nomPersonnage, ' ', prenomPersonnage)
	     END as "Héro",
	p.nemesisPersonnage
     FROM films f
     INNER JOIN personnages p
     ON f.idFilm = p.idFilm
     WHERE p.nemesisPersonnage IS NOT NULL;
    ```
