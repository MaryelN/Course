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