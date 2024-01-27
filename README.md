# Base de données de Course

## Présentation

Bienvenue dans la base de données de course, un projet académique réalisé avec l'aide d'un cours en ligne pendant mes études. Cette base de données a été conçue pour gérer les informations d'un championnat de courses automobiles. Voici un aperçu des principales fonctionnalités et entités.

### Entités Principales

- **Circuit** : Informations sur les circuits de course.
- **Course** : Événements de course avec détails tels que le nom, la date et le circuit associé.
- **Équipe** : Équipes de course avec des détails tels que le nom, le pays et le directeur technique.
- **Pilote** : Détails sur les pilotes de course, y compris le nom, la date de naissance, la nationalité et l'équipe.
- **Course_Pilote** : Résultats de chaque course avec la position du pilote.

### Vues et Fonctionnalités

- **Score_Pilote** : Vue affichant les scores des pilotes, y compris les détails sur la course.
- **Compteur de Courses** : Chaque pilote a un compteur (`compteur_course`) pour suivre le nombre de courses auxquelles il a participé.
- **Historique des Records** : La table `historique` stocke les meilleurs temps de course de chaque pilote, mis à jour régulièrement.

### Utilisation

1. **Voir les Scores des Pilotes :**
   - Exécutez `SELECT * FROM score_pilote;` pour consulter les scores des pilotes.

2. **Voir Tous les Pilotes :**
   - Exécutez `SELECT * FROM pilote;` pour afficher les détails de tous les pilotes.

3. **Insérer une Nouvelle Course :**
   - Exécutez `INSERT INTO course(nom, date_course, circuit_id) VALUES ('Eco course', '02/10/2000', 3);` pour ajouter une nouvelle course.
   - Exécutez `INSERT INTO course_pilote(pilote_id, course_id, position_pilote) VALUES (5, 5, 1), (6, 5, 2);` pour ajouter les résultats de la nouvelle course.

4. **Voir les Scores Mis à Jour :**
   - Exécutez `SELECT * FROM score_pilote;` pour voir les scores des pilotes après l'ajout de la nouvelle course.

5. **Records Historiques :**
   - Les records historiques sont automatiquement mis à jour toutes les minutes grâce à l'événement `bestHistoryTimeRecord`.

### Fonctionnalités Avancées

- **Déclencheur de Compteur :**
   - Un déclencheur (`update_compteur_course`) met à jour automatiquement le compteur de courses des pilotes.

### Configuration

Assurez-vous que votre serveur de base de données MySQL prend en charge les événements et les déclencheurs pour bénéficier de toutes les fonctionnalités de ce script.

**Note :** Ce projet a été réalisé dans un contexte académique et a été enrich
