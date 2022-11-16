CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "name" varchar(50) NOT NULL,
  "email" varchar(50) NOT NULL,
  "password" varchar(50) NOT NULL,
  "age" integer NOT NULL,
  "role_id" serial,
  "created" timestamp DEFAULT now()
);

CREATE TABLE "courses" (
  "id" uuid PRIMARY KEY,
  "title" varchar(50) NOT NULL,
  "description" text DEFAULT 'without description',
  "level" varchar(50) DEFAULT 'beginner',
  "teacher_id" uuid,
  "category_id" serial,
  "created" timestamp DEFAULT now()
);

CREATE TABLE "courses_videos" (
  "id" uuid PRIMARY KEY,
  "title" varchar(50) NOT NULL,
  "url" varchar(80) NOT NULL,
  "course_id" uuid,
  "created" timestamp DEFAULT now()
);

CREATE TABLE "categories" (
  "id" serial PRIMARY KEY,
  "name" varchar(50) NOT NULL,
  "created" timestamp DEFAULT now()
);

CREATE TABLE "roles" (
  "id" serial PRIMARY KEY,
  "name" varchar(50) NOT NULL,
  "created" timestamp DEFAULT now()
);

CREATE TABLE "teachers" (
  "id" uuid PRIMARY KEY,
  "firstname" varchar(50) NOT NULL,
  "lastname" varchar(50) NOT NULL,
  "email" varchar(50) NOT NULL,
  "phone" integer,
  "created" timestamp DEFAULT now()
);

CREATE TABLE "users_courses" (
  "id" uuid PRIMARY KEY,
  "user_id" uuid,
  "course_id" uuid,
  "created" timestamp DEFAULT now()
);
-- --------------------
-- Generacion de FK ---
-- --------------------

ALTER TABLE "courses_videos" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("teacher_id") REFERENCES "teachers" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("role_id") REFERENCES "roles" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("id");

ALTER TABLE "users_courses" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "users_courses" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

-- ----------------------------
-- Inserts para las pruebas ---
-- ----------------------------

insert into roles("name") values ('student');
insert into roles("name") values ('teacher');
insert into roles("name") values ('admin');

insert into categories("name") values ('development web');
insert into categories("name") values ('development mobile');

insert into teachers("id","firstname","lastname","email","phone") values ('ccea4c9d-bc5c-47fd-92de-b629ec0560ea','sahid','kick','sahid@mail.com',999888001);
insert into teachers("id","firstname","lastname","email","phone") values ('dc0f9c25-be09-47f5-ae69-1713e1d0b203','benjamin','flores','benjamin@mail.com',999888002);
insert into teachers("id","firstname","lastname","email","phone") values ('3bd96c20-df50-408a-a6be-311c96d487e1','bryan','muñoz','bryan@mail.com',999888003);

insert into users("id","name","email","password","age","role_id") values ('0e0eb01a-823d-4396-a6d0-8c1f17340045','italo','italo@mail.com','pass1234',28,1);
insert into users("id","name","email","password","age","role_id") values ('943ba22d-7398-4b4a-8fcb-cad447478b85','eduardo','eduardo@mail.com','pass1234',39,1);
insert into users("id","name","email","password","age","role_id") values ('4d08670f-3ded-4e28-8fee-e45a4aa46a84','jordan','jordan@mail.com','pass1234',17,1);


insert into courses("id","title","description","level","teacher_id","category_id") values ('8a40ea8e-2a26-43f8-b988-c08a400edeaf','reactjs','development web with reactjs','middle','dc0f9c25-be09-47f5-ae69-1713e1d0b203','1');
insert into courses("id","title","description","level","teacher_id","category_id") values ('bef70761-2902-493a-b252-5496866f3c4b','javascript','programming fundamentals with JS','beginner','3bd96c20-df50-408a-a6be-311c96d487e1','1');
insert into courses("id","title","description","level","teacher_id","category_id") values ('bbeb134f-2a8b-445f-a1a7-577f5692b2c1','react native','development mobile with react','middle','dc0f9c25-be09-47f5-ae69-1713e1d0b203','2');
insert into courses("id","title","description","level","teacher_id","category_id") values ('33e7add9-dc07-4ed9-9f64-12ff300e4502','docker','container development in docker','expert','ccea4c9d-bc5c-47fd-92de-b629ec0560ea','1');
insert into courses("id","title","description","level","teacher_id","category_id") values ('0f76cedd-0735-49b4-b03a-81ab8376da59','express','development of a backend server','beginner','ccea4c9d-bc5c-47fd-92de-b629ec0560ea','1');

insert into courses_videos("id","title","url","course_id") values ('b9121461-2e9a-4491-917a-2f0cc4a6e483','introduction reactjs','https://192.168.0.1/','8a40ea8e-2a26-43f8-b988-c08a400edeaf');
insert into courses_videos("id","title","url","course_id") values ('5fe596b9-7c9e-4223-a443-becb583ef1b2','introduction javascript','https://192.168.0.1/','bef70761-2902-493a-b252-5496866f3c4b');
insert into courses_videos("id","title","url","course_id") values ('043475c1-22da-427d-b6f4-2a34ec59888d','arrow function','https://192.168.0.1/','bef70761-2902-493a-b252-5496866f3c4b');
insert into courses_videos("id","title","url","course_id") values ('defe71b4-7114-4b39-918a-209c18beb26b','introduction react native','https://192.168.0.1/','bbeb134f-2a8b-445f-a1a7-577f5692b2c1');
insert into courses_videos("id","title","url","course_id") values ('098fbfef-2753-4721-85d6-a4b3e953f61e','introduction docker','https://192.168.0.1/','33e7add9-dc07-4ed9-9f64-12ff300e4502');
insert into courses_videos("id","title","url","course_id") values ('e17872a8-4de6-49e8-9006-e1ef59902949','introduction express','https://192.168.0.1/','0f76cedd-0735-49b4-b03a-81ab8376da59');
insert into courses_videos("id","title","url","course_id") values ('a273f745-60a7-437f-b0e4-9ed1d76016f5','deployment server express','https://192.168.0.1/','0f76cedd-0735-49b4-b03a-81ab8376da59');


insert into users_courses("id","user_id","course_id") values ('4e5a624a-f69b-4df2-9008-a8a6fb205b4d','0e0eb01a-823d-4396-a6d0-8c1f17340045','bef70761-2902-493a-b252-5496866f3c4b');
insert into users_courses("id","user_id","course_id") values ('c1aed4b5-cd1a-450c-88b3-45e46f4f92ad','0e0eb01a-823d-4396-a6d0-8c1f17340045','8a40ea8e-2a26-43f8-b988-c08a400edeaf');
insert into users_courses("id","user_id","course_id") values ('d56f5626-c449-4d7e-bbeb-9dc010ba3145','0e0eb01a-823d-4396-a6d0-8c1f17340045','0f76cedd-0735-49b4-b03a-81ab8376da59');
insert into users_courses("id","user_id","course_id") values ('f5145faa-cb42-4cb7-9d31-35f370441381','943ba22d-7398-4b4a-8fcb-cad447478b85','33e7add9-dc07-4ed9-9f64-12ff300e4502');
insert into users_courses("id","user_id","course_id") values ('501d3cce-805e-4b0b-8b44-84d721440b00','943ba22d-7398-4b4a-8fcb-cad447478b85','bbeb134f-2a8b-445f-a1a7-577f5692b2c1');
insert into users_courses("id","user_id","course_id") values ('e4cf9684-3c69-4490-b1c5-7e5cafc24513','4d08670f-3ded-4e28-8fee-e45a4aa46a84','8a40ea8e-2a26-43f8-b988-c08a400edeaf');
insert into users_courses("id","user_id","course_id") values ('cdf61197-3985-4446-81fe-3f82d11ea5bb','4d08670f-3ded-4e28-8fee-e45a4aa46a84','33e7add9-dc07-4ed9-9f64-12ff300e4502');


-- ----------------------------
-- -------- Busquedas ---------
-- ----------------------------

-- ------ URLs de un Curso ----- 
select courses.title,courses.level,courses_videos.title,courses_videos.url from courses inner join courses_videos on courses.id=courses_videos.course_id where courses.title='reactjs';

-- ------ Cursos de un Usuario Rol Estudiante ----- 
-- ------- User : Italo------------------------
select users.name,users.email,courses.title,courses.level FROM users_courses inner join users on users_courses.user_id=users.id inner join courses on users_courses.course_id=courses.id  where users_courses.user_id='0e0eb01a-823d-4396-a6d0-8c1f17340045'  ;

-- ------ Profesores de cada curso ----- 
select teachers.firstname as nombre,teachers.lastname as apellido,teachers.phone as telefono,courses.title as curso,courses.level as nivel from courses inner join teachers on courses.teacher_id=teachers.id;
