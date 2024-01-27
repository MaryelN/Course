--Event : un event est effectué tous les certains temps(secondes, minutes, heures, jours, mois, années)
--chaque semaine,on souhaite avoir une table "historique" les temps records de chaque pilote
--On doit obtenier le meilleur temps par pilote,  peu importe le circuit ou le pays
--On doit avoir le nom du pilote, le prenom, nationalité et le temps
--1.Creation du champ temps
ALTER TABLE course_pilote ADD COLUMN temps_course TIME NOT NULL DEFAULT "00:00:00";
--2.Creation de table historique
CREATE OR REPLACE TABLE historique(
    nom VARCHAR(100),
    prenom VARCHAR(100),
    nationalite VARCHAR(100),
    best_time TIME
);
--3.Creation d'un jeu de donnees
UPDATE course_pilote SET temps_course = "00:20:00" WHERE pilote_id = 1 AND course_id = 1;
UPDATE course_pilote SET temps_course = "00:10:00" WHERE pilote_id = 1 AND course_id = 2;
UPDATE course_pilote SET temps_course = "00:11:00" WHERE pilote_id = 2 AND course_id = 1;
UPDATE course_pilote SET temps_course = "00:09:00" WHERE pilote_id = 2 AND course_id = 4;
UPDATE course_pilote SET temps_course = "00:25:00" WHERE pilote_id = 3 AND course_id = 1;
UPDATE course_pilote SET temps_course = "00:15:00" WHERE pilote_id = 3 AND course_id = 2;
UPDATE course_pilote SET temps_course = "00:08:00" WHERE pilote_id = 4 AND course_id = 1;
UPDATE course_pilote SET temps_course = "00:14:00" WHERE pilote_id = 4 AND course_id = 4;
UPDATE course_pilote SET temps_course = "00:30:00" WHERE pilote_id = 6 AND course_id = 1;
UPDATE course_pilote SET temps_course = "00:14:00" WHERE pilote_id = 6 AND course_id = 5;
UPDATE course_pilote SET temps_course = "00:26:00" WHERE pilote_id = 7 AND course_id = 1;
UPDATE course_pilote SET temps_course = "00:28:00" WHERE pilote_id = 7 AND course_id = 3;
UPDATE course_pilote SET temps_course = "00:28:00" WHERE pilote_id = 8 AND course_id = 1;
UPDATE course_pilote SET temps_course = "00:02:00" WHERE pilote_id = 5 AND course_id = 5;
UPDATE course_pilote SET temps_course = "00:06:00" WHERE pilote_id = 5 AND course_id = 3;
UPDATE course_pilote SET temps_course = "00:15:00" WHERE pilote_id = 5 AND course_id = 1;

CREATE OR REPLACE EVENT bestHistoryTimeRecord
ON SCHEDULE EVERY 1 MINUTE
DO
DELETE FROM historique WHERE 1=1;
INSERT INTO historique (
SELECT p.nom, p.prenom, p.nationalite, MIN(cp.temps_course) AS 'temps_course'
FROM course_pilote cp
JOIN pilote p ON p.pilote_id = cp.pilote_id
GROUP BY p.pilote_id
);