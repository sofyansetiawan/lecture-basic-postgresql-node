-- INI PERINTAH UNTUK CREATE TABLE LHO...

CREATE TABLE "Students" (
	"id" SERIAL PRIMARY KEY,
	"firstname" VARCHAR(50) NOT NULL,
	"lastname" VARCHAR(50) NOT NULL,
	"address" TEXT NOT NULL,
	"age" INTEGER NOT NULL
);

-- INI PERINTAH UNTUK HAPUS TABEL LHO...

DROP TABLE IF EXISTS "Students";

-- INI PERINTAH UNTUK RENAME TABEL LHO...


ALTER TABLE IF EXISTS "Buddies" RENAME TO "Students";

-- INI PERINTAH UNTUK MENAMBAH KOLOM TABEL LHO...

ALTER TABLE IF EXISTS "Students" ADD COLUMN "email" VARCHAR(50) UNIQUE NOT NULL;

-- INI PERINTAH UNTUK DROP COLUMN..

ALTER TABLE "Students" DROP COLUMN IF EXISTS "email";

-- INI PERINTAH DML

-- INSERT DATA STUDENT

INSERT INTO "Students" ("firstname", "lastname", "address", "age", "email") 
VALUES ('Sofyan', 'Setiawan', 'Jakarta', 29, 'sofyan@gmail.com');

-- 0 1 (0 row yang diubah, 1 row baru)

-- INSERT DATA STUDENT

INSERT INTO "Students" ("firstname", "lastname", "address", "age", "email") 
VALUES ('Ricky', 'Kurniawan', 'Sulawesi', 29, 'riki21@gmail.com'), 
('Renhard', 'Julindra', 'Bandung', 25, 'renhard231@gmail.com'), ('Renhard', 'Julindra', 'Bandung', 25, 'renhard341@gmail.com') RETURNING email;


-- SELECT DATA STUDENT

SELECT * FROM "Students" WHERE address = 'Sulawesi';


-- UPDATE DATA STUDENT

UPDATE "Students" SET firstname = 'Fauza', lastname = 'Riawan' WHERE id = 1;

-- 1 (1 row yang diubah)

-- DELETE DATA STUDENT

DELETE FROM "Students" WHERE address = 'Bandung';

-- 1 (1 row yang didelete)


SELECT * FROM "Students" WHERE firstname LIKE 'D%';
-- AWAL

SELECT * FROM "Students" WHERE firstname LIKE '%ky';
-- AKHIR

SELECT * FROM "Students" WHERE firstname LIKE 'B%u%';
-- DITENGAH


-- AND OR LIMIT ORDER BY DATA STUDENT

SELECT * FROM "Students" WHERE firstname = 'Budi' AND lastname = 'Riawan';

SELECT * FROM "Students" LIMIT 3;

SELECT * FROM "Students" ORDER BY age DESC;


-- CREATE TABLE RELATION


CREATE TABLE "IdentityStudents" (
	id SERIAL PRIMARY KEY,
	phone VARCHAR(50) NOT NULL,
	id_student INTEGER NOT NULL,
	FOREIGN KEY (id_student) REFERENCES "Students" (id)
);

-- JOIN

SELECT * FROM "Students" 
LEFT JOIN "IdentityStudents"
ON "Students".id = "IdentityStudents".id_student;

-- PENGGUNAAN AGGREGATE FUNCTION


SELECT COUNT(*) FROM "Students";
-- MENGHITUNG BANYAKNYA DATA


SELECT MIN(age) FROM "Students";
-- MENGHITUNG TOTAL DARI KOLOM
