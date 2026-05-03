-- SQLite
DROP TABLE IF EXISTS "users";
CREATE TABLE "users" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL
);


INSERT INTO "users" (
        "name",   
        "email", 
        "password"
    ) VALUES 
        ('Mouha', 'mouhatech317@gmail.com', 'Mouha@1234'), 
        ('Alice', 'alice12@gmail.com', 'password_1'), 
        ('Bob', 'bob035@gmail.com', 'password_2'), 
        ('Charlie', 'charle69@gmail.com', 'password_3'), 
        ('David', 'david15@gmail.com', 'password_4'), 
        ('Eve', 'eve57@gmail.com', 'password_5');

-- SELECT "name" as title_name, "email" FROM "users" WHERE "password" = 'password_1';
 
        
