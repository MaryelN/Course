CREATE VIEW score_pilote AS 
(SELECT p.nom, p.prenom, c.nom as 'nom_course', c.date_course, cp.course_id, cp.position_pilote
FROM pilote as p
JOIN course_pilote as cp ON p.pilote_id = cp.pilote_id
JOIN course as c ON c.course_id = cp.course_id);

SELECT * FROM score_pilote;
SELECT * FROM pilote;
-- 2. Je veux que ce compteur ce mette à jour à chaque insertion dans course_pilote(incrementation de 1) 
--J'insere dans course_pilote
--Je met à jour le compteur
CREATE OR REPLACE TRIGGER update_compteur_course
    AFTER INSERT ON course_pilote   
    FOR EACH ROW 
    BEGIN
        UPDATE pilote 
        SET compteur_course = compteur_course + 1
        WHERE pilote_id = NEW.pilote_id;
    END;