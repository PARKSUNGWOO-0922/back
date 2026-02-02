-- CREATE USER 사용자 생성
-- GRANT	권한 부여
-- REVOKE	권한 회수
-- CREATE USER	사용자 생성
-- DROP USER	사용자 삭제
-- SHOW GRANTS	권한 확인

-- CREATE USER
-- 1. user1 계정을 비밀번호 1234로 생성하시오.
-- CREATE USER '아이디'@'호스트명' IDENTIFIED BY '비밀번호';
CREATE USER 'user1'@'localhost'
IDENTIFIED BY '1234';
CREATE USER 'user2'@'%'
IDENTIFIED BY '1234';
CREATE USER 'user3'@'192.168.2.36'
IDENTIFIED BY '1234';


-- 2. 현재 DB에 존재하는 사용자를 조회하시오.
-- SELECT user,host FROM DB명.user;
SELECT user, host FROM mysql.user;
-- GRANT 
-- 3. user1에게 mydb 데이터베이스의 모든 권한(ALL PRIVILEGES)을 부여하시오.
/*  DBA 권한유형
        GRANT ALL PRIVILEGES 
        ON mydb.* TO '사용자명'@'호스트명'
*/
GRANT ALL PRIVILEGES 
ON mydb.* TO 'user1'@'localhost';
-- 4. user1에게 member 테이블의 SELECT 권한만 부여하시오.
GRANT SELECT  
ON mydb.member TO 'user1'@'localhost';

-- 5. user1에게 부여된 권한을 확인하시오.
--SHOW GRANT FOR '사용자명'@'호스트명';
SHOW GRANTS FOR 'user1'@'localhost';

-- REVOKE
-- 6. user1에게서 member 테이블의 SELECT 권한을 회수하시오.
/*
    권한회수
        REVOKE 권한유형
        ON DB명.테이블명 FROM '사용자'@'호스트명';
*/
REVOKE SELECT
ON mydb.member FROM 'user1'@'localhost';
-- 7. user1에게 부여된 testdb에 대한 모든 권한을 회수하시오.
REVOKE ALL PRIVILEGES
ON mydb.* FROM 'user1'@'localhost';
-- 8. user1의 비밀번호를 5678로 변경하시오.
ALTER 'user1'@'localhost'
IDENTIFIED BY '5678';
-- 9. 변경된 권한을 즉시 반영하시오.
FLUSH PRIVILEGES;
-- DROP USER
-- 10. user1 계정을 삭제하시오.
DROP USER 'user1'@'localhost';
show DATABASEs; -- 만든 db 조회방법