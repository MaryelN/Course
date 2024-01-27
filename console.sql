-- Active: 1706298425424@@mysql-maryel-n.alwaysdata.net@3306@maryel-n_pilotes
DROP TABLE IF EXISTS course_pilote;
DROP TABLE IF EXISTS course;
DROP TABLE IF EXISTS circuit;
DROP TABLE IF EXISTS pilote;
DROP TABLE IF EXISTS equipe;
DROP VIEW IF EXISTS score_pilote;

CREATE TABLE circuit(
    circuit_id INTEGER AUTO_INCREMENT UNIQUE PRIMARY KEY,
    pays VARCHAR(50),
    nom VARCHAR(50),
    longueur FLOAT
);

CREATE TABLE course(
    course_id INTEGER AUTO_INCREMENT,
    CONSTRAINT course_PK PRIMARY KEY (course_id),
    nom VARCHAR(255),
    date_course DATE,
    circuit_id INTEGER,
    CONSTRAINT course_FK FOREIGN KEY (circuit_id) REFERENCES circuit(circuit_id)
);

CREATE TABLE equipe(
    equipe_id INTEGER AUTO_INCREMENT UNIQUE PRIMARY KEY,
    nom VARCHAR(50),
    pays VARCHAR(50),
    directeur_technique VARCHAR(100)
);

CREATE TABLE pilote(
    pilote_id INTEGER AUTO_INCREMENT UNIQUE,
    CONSTRAINT pilote_PK PRIMARY KEY (pilote_id),
    nom VARCHAR(50),
    prenom VARCHAR(50),
    date_naissance DATE,
    nationalite VARCHAR(50),
    equipe_id INTEGER,
    FOREIGN KEY (equipe_id) REFERENCES equipe(equipe_id)
);

CREATE TABLE course_pilote(
    pilote_id INTEGER,
    course_id INTEGER,
    position_pilote INTEGER NOT NULL,
    CONSTRAINT course_pilote_FK FOREIGN KEY (pilote_id) REFERENCES pilote(pilote_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    CONSTRAINT course_pilote_PK PRIMARY KEY (pilote_id, course_id)
);

CREATE INDEX circuit_pays ON circuit(pays);

CREATE VIEW score_pilote AS 
(SELECT p.nom, p.prenom, c.nom as 'nom_course', c.date_course, cp.course_id, cp.position_pilote
FROM pilote as p
JOIN course_pilote as cp ON p.pilote_id = cp.pilote_id
JOIN course as c ON c.course_id = cp.course_id);

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
-- 1.Ajouter un compteur de course sur le pilotes
ALTER TABLE pilote ADD COLUMN compteur_course INTEGER NOT NULL DEFAULT 0; 
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
INSERT INTO course_pilote (pilote_id, course_id, position_pilote) VALUES (1, 1, 3),
(2, 1, 2),
(4, 1, 4);
--Appel à la vue : 1
SELECT * FROM score_pilote;
INSERT INTO course_pilote(pilote_id, course_id, position_pilote) VALUES (3, 1, 1);
--Appel de la vue : 2
SELECT * FROM score_pilote;
--Affichage de toutes les pilotes
SELECT * FROM pilote;
INSERT INTO course(nom, date_course, circuit_id) VALUES ('Eco course', '02/10/2000', 3);
INSERT INTO course_pilote(pilote_id, course_id, position_pilote) VALUES (1, 2, 1);

SELECT * FROM pilote;