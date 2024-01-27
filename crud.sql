CREATE VIEW score_pilote AS 
(SELECT p.nom, p.prenom, c.nom as 'nom_course', c.date_course, cp.course_id, cp.position_pilote
FROM pilote as p
JOIN course_pilote as cp ON p.pilote_id = cp.pilote_id
JOIN course as c ON c.course_id = cp.course_id);

SELECT * FROM score_pilote;
SELECT * FROM pilote;
