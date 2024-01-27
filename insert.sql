INSERT INTO circuit (pays, nom, longueur) VALUES ('France', 'Circuit Paul Ricard', 5.842),
('Espagne', 'Circuit de Catalunya', 4.655),
('Monaco', 'Circuit de Monaco', 3.385),
('Canada', 'Circuit Gilles Villeneuve', 4.152);

INSERT INTO course (nom, date_course) VALUES ('Grand Prix de France', CURDATE(), 1);
INSERT INTO equipe(pays, nom, directeur_technique) VALUES ('France', 'Alpine F1 Team', 'Davide Brivio'),
('Espagne', 'Ferrari', 'Andreas Seild');
INSERT INTO pilote (nom, prenom, date_naissance, nationalite, equipe_id) VALUES ('Ocon', 'Esteban', '1996-09-17', 'France', 1),
('Alonso', 'Fernando', '1981-07-29', 'Espagne', 1),
('Maria', 'Carranza', '1991-07-29', 'Espagne', 2),
('Leclerc', 'Charles', '1997-10-16', 'Monaco', 2);

INSERT INTO course_pilote (pilote_id, course_id, position_pilote) VALUES (1, 1, 3),
(2, 1, 2),
(4, 1, 4);
INSERT INTO course_pilote(pilote_id, course_id, position_pilote) VALUES (3, 1, 1);
INSERT INTO course(nom, date_course, circuit_id) VALUE ('Eco course', '02/10/2000', 3);
INSERT INTO course_pilote(pilote_id, course_id, position_pilote) VALUES (1, 2, 1);