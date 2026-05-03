-- SQLite
PRAGMA foreign_key = ON;
DROP TABLE IF EXISTS posts;

-- Création de table posts
CREATE TABLE posts (
     id INTEGER PRIMARY KEY AUTOINCREMENT,
     title VARCHAR(20),
     content TEXT,
     duration SMALLINT,
     online BOOLEAN,
     category VARCHAR(50),
     creation DATETIME
);

-- Insérer la table
INSERT INTO posts (
        title, 
        content, 
        duration,
        online,
        category, 
        creation 
    ) VALUES (
        'Mon premier post',
        'Ceci est mon premier post',
        10,
        TRUE,
        'Test,1', 
        '14/01/2024'
    ), (
        'Mon deuxième post',
        'Ceci est mon deuxième post',
        20,
        FALSE,
        'Test 2',
        '14/01/2024'
    ), (
        'Mon troisième post',
        'Ceci est mon troisième post',
        30,
        TRUE,
        'Test 3',
        '14/01/2024'
    ), (
        'Mon quatrième post',
        'Ceci est mon quatrième post',
        40,
        FALSE,
        'Test 4',
        '14/01/2024'
    ), (
        'Mon cinquième post',
        'Ceci est mon cinquième post',
        50,
        TRUE,
        'Test 5',
        '14/01/2024'
    ), (
        'Mon sixième post',
        'Ceci est mon sixième post',
        60,
        FALSE,
        'Test 6',
        '14/01/2024'
    ), (
        'Mon septième post',
        'Ceci est mon septième post',
        70,
        TRUE,
        'Test 7',
        '14/01/2024'
    ), (
        'Mon huitième post',
        'Ceci est mon huitième post',
        80,
        FALSE,
        'Test 8',
        '14/01/2024'
    ), (
        'Mon neuvième post',
        'Ceci est mon neuvième post',
        90,
        TRUE,
        'Test 9',
        '14/01/2024'
    ), (
        'Mon dixième post',
        'Ceci est mon dixième post',
        100,
        FALSE,
        'Test 10', 
        '14/01/2024'
    );

-- SELECT * FROM posts WHERE category = 'Test 2';
-- ALTER TABLE posts ADD categorie VARCHAR(50);
-- ALTER TABLE posts ADD domaine VARCHAR(40);
-- ALTER TABLE posts RENAME domaine TO articles;
-- ALTER TABLE posts DROP domaine ;

-- SELECT * 
-- FROM posts
-- WHERE duration BETWEEN 0 AND 20;

-- SELECT * 
-- FROM posts
-- WHERE content LIKE '%Mon%';
-- WHERE (content = 'Ceci est mon deuxième post' OR duration == 10) AND online = FALSE;
-- WHERE duration <= 10;
-- WHERE content IN('Ceci est mon premier post', 'Ceci est mon deuxième post');

-- DELETE FROM posts WHERE online = False;
UPDATE posts SET title = 'post_1' WHERE id = 1;
UPDATE posts SET title = 'post_2' WHERE id = 2;
UPDATE posts SET title = 'post_3' WHERE id = 3;
UPDATE posts SET title = 'post_4' WHERE id = 4;
UPDATE posts SET title = 'post_5' WHERE id = 5;
UPDATE posts SET content = 'mon premier poste' WHERE id = 1;
SELECT * FROM posts;

ALTER TABLE posts RENAME content TO slug;

EXPLAIN QUERY PLAN SELECT * FROM posts WHERE slug = 'mon premier poste';
-- EXPLAIN QUERY PLAN SELECT * FROM posts WHERE slug = 'mon premier poste' AND category = 'Test,1';

CREATE UNIQUE INDEX idx_slug ON posts(slug);

--  PRAGMA index_list('posts');
--  PRAGMA index_info('idx_slug');
--  PRAGMA table_info('posts');
--  PRAGMA foreign_key_list('posts');
-- DROP INDEX idx_slug;