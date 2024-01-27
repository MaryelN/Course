INSERT INTO circuit (pays, nom, longueur) VALUES ('France', 'Circuit Paul Ricard', 5.842),
('Espagne', 'Circuit de Catalunya', 4.655),
('Monaco', 'Circuit de Monaco', 3.385),
('Canada', 'Circuit Gilles Villeneuve', 4.152);

INSERT INTO course (nom, date_course) VALUES ('Grand Prix de France', CURDATE()),
('Grand Prix d''Espagne', CURDATE()),
('Grand Prix de Monaco', CURDATE()),
('Grand Prix du Canada', CURDATE());
INSERT INTO equipe(pays, nom, directeur_technique) VALUES ('France', 'Alpine F1 Team', 'Davide Brivio'),
('Espagne', 'Ferrari', 'Andreas Seild'),
('Italie', 'Mercedes', 'Toto Wolff'),
('UK', 'Red Bull Racing', 'Christian Horner');
INSERT INTO pilote (nom, prenom, date_naissance, nationalite, equipe_id) VALUES ('Ocon', 'Esteban', '1996-09-17', 'France', 1),
('Alonso', 'Fernando', '1981-07-29', 'Espagne', 1),
('Maria', 'Carranza', '1991-07-29', 'Espagne', 2),
('Leclerc', 'Charles', '1997-10-16', 'Monaco', 2),
('Hamilton', 'Lewis', '1985-01-07', 'UK', 3),
('Verstappen', 'Max', '1997-09-30', 'Pays-Bas', 3),
('Verstappen', 'Max', '1997-09-30', 'Pays-Bas', 4),
('Leclerc', 'Charles', '1997-10-16', 'Monaco', 4);
-- 1.Ajouter un compteur de course sur le pilotes
ALTER TABLE pilote ADD COLUMN compteur_course INTEGER NOT NULL DEFAULT 0; 
INSERT INTO course_pilote (pilote_id, course_id, position_pilote) VALUES (1, 1, 3),
(2, 1, 2),
(3, 1, 4),
(4, 1, 1),
(5, 1, 5),
(6, 1, 8),
(7, 1, 6),
(8, 1, 7),
(1, 2, 1),
(3, 2, 2),
(5, 3, 1),
(7, 3, 2),
(2, 4, 1),
(4, 4, 2);