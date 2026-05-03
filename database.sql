-- SQLite
PRAGMA foreign_key = ON;

DROP TABLE IF EXISTS categories_recipes;
DROP TABLE IF EXISTS ingredients_recipes;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS recipes;
DROP TABLE IF EXISTS ingredients;
DROP TABLE IF EXISTS food;



--users table
CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    username VARHAR(150) NOT NULL UNIQUE,
    email VARHAR(150) NOT NULL UNIQUE
);

--recipes table
CREATE TABLE recipes (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    title VARHAR(150) NOT NULL,
    slug VARHAR(150) NOT NULL,
    date DATETIME,
    duration INTEGER DEFAULT 0 NOT NULL,
    user_id INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

--categories table
CREATE TABLE categories (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    title VARHAR(150) NOT NULL
);

--categories_recipes table
CREATE TABLE categories_recipes (
    recipe_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    FOREIGN KEY (recipe_id) REFERENCES recipes(id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE,
    PRIMARY KEY (recipe_id, category_id),
    UNIQUE (recipe_id, category_id)
);

--ingredients table
CREATE TABLE ingredients (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name VARHAR(150) NOT NULL
);

--ingredients_recipes table
CREATE TABLE ingredients_recipes (
    recipe_id INTEGER NOT NULL,
    ingredient_id INTEGER NOT NULL,
    quantity INTEGER,
    unit VARCHAR(20),
    FOREIGN KEY (recipe_id) REFERENCES recipes(id) ON DELETE CASCADE,
    FOREIGN KEY (ingredient_id) REFERENCES ingredients(id) ON DELETE CASCADE,
    PRIMARY KEY (recipe_id, ingredient_id),
    UNIQUE (recipe_id, ingredient_id)
);


--users insertion
INSERT INTO users (username, email) 
VALUES 
    ('user1', 'user1@example.com'),
    ('user2', 'user2@example.com');

--categories insertion
INSERT INTO categories (title)
VALUES
   ('Plat'),
   ('Dessert'),
   ('Gâteau');

--recipes insertion
INSERT INTO recipes (title, slug, duration, user_id)
VALUES
   ('Cake', 'cake', 15, 1),
   ('Pizza', 'pizza', 30, 1),
   ('Salade de fruit', 'salade-de-fruit', 10, 1);

--categorie_recipes insertion
INSERT INTO categories_recipes (recipe_id, category_id)
VALUES
   (1, 1),
   (2, 2),
   (2, 3);

--ingredients insertion
INSERT INTO ingredients (name)
VALUES
   ('Sucre'),
   ('Farine'),
   ('Lait'),
   ('Levure'),
   ('Beurre'),
   ('Oeufs'),
   ('Miel');

--ingredients_recipes insertion   
INSERT INTO ingredients_recipes (recipe_id, ingredient_id, quantity, unit)
VALUES
   (2, 1, 200, 'g'),
   (2, 2, 300, 'g'),
   (2, 3, 100, 'ml'),
   (2, 4, 10, 'g'),
   (2, 5, 50, 'g'),
   (2, 6, 3, NULL),
   (3, 1, 60, 'g');

SELECT r.title FROM ingredients i
JOIN ingredients_recipes ir ON i.id = ir.ingredient_id
JOIN recipes r ON ir.recipe_id = r.id
WHERE i.name = 'Oeufs';


SELECT * FROM recipes r
LEFT JOIN ingredients_recipes ir ON r.id = ir.recipe_id
WHERE ir.recipe_id IS NULL;

-- DELETE FROM ingredients WHERE id = 3;


SELECT r.title, ir.quantity, ir.unit, i.name AS ingredient
FROM recipes r
JOIN ingredients_recipes ir ON r.id = ir.recipe_id
JOIN ingredients i ON ir.ingredient_id = i.id;






UPDATE recipes SET date = 100  WHERE id = 2;


SELECT COUNT(id) AS count, duration, date FROM recipes;
SELECT SUM(duration) AS Somme FROM recipes;
SELECT AVG(duration) AS Moyenne FROM recipes;
SELECT MAX(duration) AS Max FROM recipes;
SELECT MIN(duration) AS Min FROM recipes;
SELECT SUM(duration) AS Somme FROM recipes WHERE duration != 10;
SELECT GROUP_CONCAT(title, ', ') AS title_group FROM recipes;
SELECT COUNT(id) AS count, duration FROM recipes GROUP BY duration HAVING count >=1;


SELECT DISTINCT i.name
FROM ingredients i 
LEFT JOIN ingredients_recipes ir ON i.id = ir.ingredient_id
LEFT JOIN recipes r ON ir.recipe_id = r.id
WHERE ir.recipe_id IS NOT NULL;



SELECT i.name, COUNT(ir.recipe_id) AS count
FROM ingredients i 
JOIN ingredients_recipes ir ON i.id = ir.ingredient_id
JOIN recipes r ON ir.recipe_id = r.id
GROUP BY i.name
ORDER BY count DESC, i.name ASC
LIMIT 3 OFFSET 0;

SELECT  * FROM recipes r
JOIN ingredients_recipes ir ON r.id = ir.recipe_id
JOIN ingredients i ON ir.ingredient_id = i.id;
-- WHERE name LIKE '%%';


-- SELECT r.title, c.title AS category FROM recipes r 
-- JOIN categories_recipes cr ON r.id = cr.recipe_id
-- JOIN categories c ON cr.category_id = c.id; 

-- SELECT r.title FROM ingredients i
-- JOIN ingredients_recipes ir ON i.id = ir.ingredient_id
-- JOIN recipes r ON ir.recipe_id = r.id
-- WHERE i.name = 'Oeufs';


-- SELECT r.title, ir.quantity, ir.unit, i.name AS ingredient
-- FROM recipes r
-- JOIN ingredients_recipes ir ON r.id = ir.recipe_id
-- JOIN ingredients i ON ir.ingredient_id = i.id;

-- SELECT * FROM recipes WHERE id = 2;

-- SELECT ir.quantity, ir.unit, i.name as ingredient
-- FROM ingredients_recipes ir 
-- JOIN ingredients i ON ir.ingredient_id = i.id
-- WHERE ir.recipe_id = 2;

-- UPDATE ingredients_recipes
-- SET quantity = 15
-- WHERE recipe_id = 2 AND ingredient_id = 3;
-- SELECT *
-- FROM recipes;

-- UPDATE categories SET title = 'Tacos' WHERE id = 1;

-- DELETE FROM ingredients WHERE id = 3;

-- SELECT * FROM recipes WHERE slug = 'salade-de-fruit';

-- SELECT COUNT(id) as count
-- FROM recipes ;

-- UPDATE recipes SET date = 100 WHERE id = 2;

-- SELECT COUNT(*)
-- FROM recipes ;

-- SELECT SUM(duration) as sum_duration
-- FROM recipes ;

-- SELECT GROUP_CONCAT(title, ', ') as title_group FROM recipes;

-- SELECT COUNT(id) as count, duration 
-- FROM recipes 
-- GROUP BY duration
-- HAVING count >= 1;

-- SELECT i.name, COUNT(id) as count FROM ingredients i
-- LEFT JOIN ingredients_recipes ir ON ir.ingredient_id = i.id
-- GROUP BY i.name;

-- SELECT i.name, COUNT(ir.recipe_id) as count
-- FROM ingredients i
-- LEFT JOIN ingredients_recipes ir ON ir.ingredient_id = i.id
-- LEFT JOIN recipes r ON ir.recipe_id = r.id
-- GROUP BY i.name
-- ORDER BY count DESC, i.name ASC
-- LIMIT 3 OFFSET 3;

-- SELECT DISTINCT i.name, r.duration
-- FROM ingredients i
-- LEFT JOIN ingredients_recipes ir ON ir.ingredient_id = i.id
-- LEFT JOIN recipes r ON ir.recipe_id = r.id
-- WHERE ir.recipe_id IS NOT NULL;



-- SELECT SUM(duration) FROM recipes;

-- SELECT GROUP_CONCAT(title, ', ') FROM recipes;

-- UPDATE recipes SET date = 100 WHERE id = 2;


-- SELECT *, (
-- SELECT COUNT(*) FROM ingredients_recipes
-- WHERE recipe_id = r.id
-- ) as count
-- FROM recipes r;

-- SELECT r.title
-- FROM (
--  SELECT * FROM recipes
-- ) r;

-- SELECT r.count
-- FROM (
--  SELECT COUNT(id) as count  FROM recipes
-- ) r;

-- -- SELECT * FROM categories c
-- -- LEFT JOIN categories_recipes cr ON cr.category_id = c.id
-- -- WHERE c.title = 'Dessert'

-- EXPLAIN QUERY PLAN SELECT i.* 
-- FROM ingredients_recipes ir
-- LEFT JOIN ingredients i ON i.id = ir.ingredient_id
-- WHERE ir.recipe_id IN ( 
--   SELECT cr.recipe_id 
--   FROM categories c
--   LEFT JOIN categories_recipes cr ON cr.category_id = c.id
--   WHERE c.title NOT IN ('Dessert', 'Gâteau')
-- );


-- CREATE TABLE food (
--     id INTEGER PRIMARY KEY AUTOINCREMENT,
--     name VARCHAR5(30), 
--     price DECIMAL(10, 2),
--     created_at DATETIME
-- );

-- INSERT INTO food ( name, price )
-- VALUES ('Pizza', 10.99),
-- ('Burger', 7.99),
-- ('Salad', 8.99),
-- ('Fries', 3.99);

-- UPDATE food SET created_at = 11 WHERE id = 3;
-- ALTER TABLE food RENAME created_at TO number;
SELECT sqlite_version();
SELECT sqlite_compileoption_used('ENABLE_FTS3');
