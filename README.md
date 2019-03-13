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

1.  Sur tous les films sorties après les années 2002, quels est le budget moyen ?

     ```sql
    SELECT films 
    FROM MOVIES 
    WHERE year(dateSortie) > 2002

    ```

1.  Sur la totalité des films, quel est la durée moyenne d'un film ?

     ```sql
    SELECT films
    FROM MOVIES
    ```

1.  Quel film de Christopher Nolan a généré le plus de recettes et a le plus plu ?

     ```sql
    SELECT film
    FROM MOVIES m
    INNER JOIN artistes a
    ON (m.idFilm = a.idFilm)
    WHERE upper(nomArtiste) = "NOLAN"
    ```

1.  Quel film a connu la plus mauvaise critique d'Allociné et a le plus plu aux spectateurs ?

     ```sql
    INSERT INTO
    ```

1.  Quel film a eu le meilleur rendement financier ? (plus petit budget mais gros gains)

     ```sql
    INSERT INTO
    ```

1.  Ceci est un test de question

     ```sql
    INSERT INTO
    ```

1.  Ceci est un test de question

     ```sql
    INSERT INTO
    ```

1.  Ceci est un test de question

     ```sql
    INSERT INTO
    ```

1.  Ceci est un test de question

     ```sql
    INSERT INTO
    ```

1.  Ceci est un test de question

     ```sql
    INSERT INTO
    ```

Sur tous les fims quel acteur ressort avec le plus de récompenses ou de nominations par films
Sur tous les films faire un classement acteur principal par films qui ont généré le plus au box office
Quelle société de production a employé l'acteur dont le film a généré le plus de recette, le plus de critique positive et qui a été nominé au moins une fois avec une date de sortie en salle > 2006 (modifiable)