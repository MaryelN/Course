Base de données de Course
Présentation

Ce script SQL crée une base de données pour un championnat de courses automobiles. Il définit des tables pour les circuits, les courses, les équipes, les pilotes et les résultats de course. De plus, il crée une vue (score_pilote) pour afficher des informations sur les scores des pilotes.
Tables Créées

    circuit : Contient des informations sur les circuits de course.
    course : Représente les événements de course avec des détails tels que le nom, la date et le circuit associé.
    equipe : Représente les équipes de course avec des informations comme le nom, le pays et le directeur technique.
    pilote : Contient des détails sur les pilotes de course, y compris le nom, la date de naissance, la nationalité et l'équipe à laquelle ils appartiennent.
    course_pilote : Représente les résultats de chaque course, y compris la position du pilote.

Vues Créées

    score_pilote : Une vue qui affiche les scores des pilotes, y compris leur nom, prénom, nom de la course, date de la course, ID de la course et position.

Insertion de Données

    Les données sont insérées dans les tables circuit, course, equipe et pilote, représentant des informations sur les circuits, les courses, les équipes et les pilotes, respectivement.
    La vue score_pilote est peuplée en fonction des données des tables pilote, course_pilote et course.

Déclencheur

    Un déclencheur (update_compteur_course) est créé pour incrémenter un compteur (compteur_course) dans la table pilote à chaque insertion d'un nouveau enregistrement dans la table course_pilote.

Fonctionnalités Additionnelles

    Compteur pour les Pilotes :
        Une nouvelle colonne (compteur_course) est ajoutée à la table pilote pour suivre le nombre de courses auxquelles chaque pilote a participé.

    Déclencheur pour la Mise à Jour du Compteur :
        Un déclencheur est créé pour mettre à jour automatiquement la colonne compteur_course dans la table pilote lorsqu'un nouveau résultat de course est inséré dans la table course_pilote.

    Historique des Records :
        Une nouvelle table (historique) est créée pour stocker les records historiques des meilleurs temps de course pour chaque pilote, indépendamment du circuit ou du pays.
        Un champ (temps_course) est ajouté à la table course_pilote pour représenter le temps de course.
        Un ensemble de données est établi pour cette fonctionnalité, et un événement (bestHistoryTimeRecord) est créé pour mettre à jour les enregistrements historiques toutes les minutes.

Utilisation

    Voir les Scores des Pilotes :
        Exécutez SELECT * FROM score_pilote; pour voir les scores des pilotes.

    Voir Tous les Pilotes :
        Exécutez SELECT * FROM pilote; pour voir les détails de tous les pilotes.

    Insérer une Course Supplémentaire :
        Exécutez INSERT INTO course(nom, date_course, circuit_id) VALUES ('Eco course', '02/10/2000', 3); pour insérer une nouvelle course.
        Exécutez INSERT INTO course_pilote(pilote_id, course_id, position_pilote) VALUES (5, 5, 1), (6, 5, 2); pour insérer les résultats de la nouvelle course.

    Voir les Scores des Pilotes Mis à Jour :
        Exécutez SELECT * FROM score_pilote; pour voir les scores des pilotes mis à jour après la course supplémentaire.

    Records Historiques :
        Les records historiques sont mis à jour automatiquement toutes les minutes grâce à l'événement bestHistoryTimeRecord.