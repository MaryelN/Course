
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