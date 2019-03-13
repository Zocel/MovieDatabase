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
    SELECT ( SUM(budgetFilm) / SUM(films) )
    FROM MOVIES m
    INNER JOIN datesortie ds
    ON (m.idDatesortie = ds.idDatesortie)
    WHERE YEAR(ds.dateSortie) > 2010;
    ```

1.  Sur la totalité des films, quel est la durée moyenne d'un film ?

     ```sql
    SELECT ( SUM(dureeFilm) / SUM(films))
    FROM MOVIES;
    ```

1.  Quel film de Christopher Nolan a généré le plus de recettes et a le plus plu ?

     ```sql
    SELECT film
    FROM MOVIES m
    INNER JOIN artistes a
    ON (m.idFilm = a.idFilm)
    WHERE UPPER(a.nomArtiste) = "NOLAN";
    ```

1.  Quel film a connu la plus mauvaise critique d'Allociné et a le plus plu aux spectateurs ?

     ```sql
    SELECT film
    FROM MOVIES m
    INNER JOIN critique c
    ON (m.idFilm = c.idFilm)
    WHERE MIN(c.notepresseCritique) AND MAX(c.notespectateurCritique);
    ```

1.  Quel film a eu le meilleur rendement financier ? (plus petit budget mais gros gains au box-office)

     ```sql
    SELECT film
    FROM MOVIES m
    INNER JOIN boxoffice b
    ON (m.idFilm = b.idFilm)
    WHERE MIN(m.budgetFilm) and MAX(b.recetteBoxoffice);
    ```

1.  Sur tous les fims quel acteur ressort avec le plus de récompenses ou de nominations par films

     ```sql
    SELECT p.personnages,
    FROM MOVIES m
    INNER JOIN personnages p
    ON (m.idFilm = p.idFilm)
    INNER JOIN distinctions d
    ON (p.idDistinction = d.idDistinction)
    WHERE SUM()
    ```

1.  Quel acteur principal a permit à un film de générer le plus d'argent lors d'un box-office ?

     ```sql
    SELECT p.personnages
    FROM MOVIES m
    INNER JOIN personnages p
    ON (m.idFilm = p.idFilm)
    WHERE 
    ```

1.  Quel film a reçu le plus de nominations ? (classé par ordre croissant)

     ```sql
    SELECT film
    FROM MOVIES m
    INNER JOIN distinctions d
    ON (m.idFilm = d.idFilm)
    WHERE MAX(d.distinctions);
    ```

1.  Ceci est un test de question

     ```sql
    INSERT INTO
    ```

1.  Quelle société de production a employé l'acteur dont le film a généré le plus de recette, le plus de critique positive et qui a été nominé au moins une fois avec une date de sortie en salle > 2006 (modifiable)

     ```sql
    INSERT INTO
    ```