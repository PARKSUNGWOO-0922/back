-- DB생성

CREATE TABLE users (
  id VARCHAR(20) PRIMARY KEY,
  userpw VARCHAR(20) NOT NULL
);
INSERT INTO `testdb`.`users` (`id`, `userpw`) 
VALUES ('hong', '1234');

INSERT INTO users (id, userpw) VALUES ('freshlover', 'subway123');
INSERT INTO users (id, userpw) VALUES ('sandwichking', 'eatfresh1');
INSERT INTO users (id, userpw) VALUES ('veggie_hero', 'green2024');
INSERT INTO users (id, userpw) VALUES ('footlong99', 'sub9999');
INSERT INTO users (id, userpw) VALUES ('cookie_addict', 'sweet12');

SELECT * FROM testdb.users;
DELETE FROM `testdb`.`users` WHERE (`id` = 'hong');
SHOW DATABASES;
SELECT * FROM testdb.users;

