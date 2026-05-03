-- SQLite
-- ALTER TABLE post RENAME category TO author;

-- DROP TABLE post;

-- CREATE TABLE recipes (
--       title VARCHAR(150),
--       slug VARCHAR(50),
--       content TEXT,
--       duration SMALLINT,
--       online BOOLEAN,
--       created_at DATETIME
-- );


-- INSERT INTO recipes (
--      title,
--      slug,
--      content,
--      duration,
--      online,
--      created_at
-- ) VALUES (
--      'Soupe2',
--      'Soupe2',
--      'Contenu de texte',
--      13,
--     FALSE,
--      1727531127
-- ),
-- (
--      'Soupe3',
--      'Soupe3',
--      'Contenu de texte',
--      10,
--     FALSE,
--      1727531127
-- );


-- SELECT title, duration FROM recipes;

-- SELECT * 
-- FROM recipes
-- WHERE slug IN ('soupe', 'salade-de-fruit')
-- WHERE (slug != 'banane' OR duration > 20) AND online = TRUE


-- SELECT * FROM recipes WHERE duration < 20;

-- SELECT * 
-- FROM recipes 
-- WHERE slug = 'soupe';

-- SELECT * 
-- FROM recipes 
-- WHERE duration BETWEEN 0 AND 20;

-- SELECT * 
-- FROM recipes 
-- WHERE slug IN ('Soupe', 'Salade-de-fruit');

-- SELECT * 
-- FROM recipes 
-- WHERE 
--      (slug != 'Soupe' OR duration > 20)
--       AND online = TRUE;

SELECT * 
FROM recipes 
WHERE title LIKE '%de%';


-- DELETE FROM recipes WHERE title = 'Soupe3';

-- UPDATE recipes SET title = 'Soupe de légume' WHERE title = 'Soupe';

-- SELECT title, duration FROM recipes;

-- SELECT * FROM recipes;




/*opération boolean 
TRUE AND TRUE = TRUE
TRUE AND FALSE = FALSE
FALSE AND FALSE = FALSE

TRUE OR FALSE = TRUE
FALSE OR TRUE = TRUE
TRUE OR TRUE = TRUE
FALSE OR FALSE = FALSE
*/

-- 🔹 1. Création des bases
CREATE DATABASE IF NOT EXISTS etudiantsdb CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
CREATE DATABASE IF NOT EXISTS gestiontaches CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- 🔹 2. Table universités dans gestiontaches
USE gestiontaches;
CREATE TABLE IF NOT EXISTS universites (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nom VARCHAR(100),
  filiere VARCHAR(100)
);

-- 🔹 3. Table étudiants dans etudiantsdb
USE etudiantsdb;
CREATE TABLE IF NOT EXISTS etudiants (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nom VARCHAR(100),
  universite_id INT
);

-- 🔹 4. Données de test universités
USE gestiontaches;
INSERT INTO universites (nom, filiere) VALUES
('Université de Dakar', 'Informatique'),
('Université de Thiès', 'Gestion'),
('Université Virtuelle', 'Communication');

-- 🔹 5. Données de test étudiants
USE etudiantsdb;
INSERT INTO etudiants (nom, universite_id) VALUES
('Aminata Sow', 1),
('Cheikh Ndiaye', 2),
('Fatou Diop', 3);

-- 🔹 6. Requête join inter-bases
SELECT e.nom, u.nom AS universite, u.filiere
FROM etudiantsdb.etudiants AS e
JOIN gestiontaches.universites AS u ON e.universite_id = u.id;

-- 🔹 7. Création d’une vue simplifiée
CREATE VIEW vue_etudiants_universites AS
SELECT e.nom, u.nom AS universite, u.filiere
FROM etudiantsdb.etudiants AS e
JOIN gestiontaches.universites AS u ON e.universite_id = u.id;
