

-- 사용자 생성
-- 1. user1 계정을 비밀번호 1234로 생성하시오.
-- CREATE USER '아이디'@'호스트명' IDENTIFIED BY '비밀번호';
/*
    1. @ 기호의 의미: "장소"를 나타내는 이정표
       여기서 @는 영어의 전치사 **"at(~에, ~에서)"**의 의미를 그대로 가져온 것입니다.
       'user1'@'localhost'
       해석: **"localhost(이 컴퓨터)에 있는 user1"**이라는 뜻입니다.
*/
CREATE USER 'user1'@'localhost'
IDENTIFIED BY '1234';
CREATE USER 'user2'@'%'
IDENTIFIED BY '1234';
CREATE USER 'user3'@'192.168.2.27'
IDENTIFIED BY '1234';

-- 2. 현재 DB에 존재하는 사용자를 조회하시오.
/*
    전체 사용자 목록 조회
        SELECT 컬럼1, ... FROM DB.테이블;
        SELECT user, host FROM mysql.user;
            - mysql은 MySQL 내부 시스템 DB이다.
<<<<<<< HEAD
*/
/*
    1. Host의 정체: "어디서 왔니?"
    데이터베이스는 보안을 위해 ID/PW만 확인하지 않습니다. 
    **"허락된 장소에서 온 접속인가?"**를 한 번 더 검사하는데, 
    그 장소를 기록하는 칸이 바로 host입니다
    **MySQL(프로그램)**을 설치하면, 그 시스템이 스스로를 관리하기 위해 내부적으로 **
    mysql이라는 이름의 데이터베이스(시스템 스키마)**를 자동으로 생성합니다
*/

/*
    1. mysql.user는 "주소"입니다
       mysql: 데이터베이스(스키마)의 이름입니다. 
       MySQL 엔진이 자신의 설정값들을 저장해두는 기본 폴더라고 생각하시면 됩니다.
    2. SELECT user는 "내용물"입니다

*/
SELECT user, host
FROM mysql.user;

-- 권한 부여
-- 3. user1에게 mydb 데이터베이스의 모든 권한(ALL PRIVILEGES)을 부여하시오.
/*  
    GRANT : 특정 사용자에게 데이터베이스 객체(테이블, 뷰 등)에 대한 조작 권한을 부여
        예시: GRANT SELECT, INSERT ON employees TO 'user_id';
        설명: 신입 사원이나 특정 애플리케이션 계정에 "읽기"와 "쓰기" 권한만 골라 줄 때 사용합니다
=======
*/
SELECT user, host
FROM mysql.user;

-- 권한 부여
-- 3. user1에게 mydb 데이터베이스의 모든 권한(ALL PRIVILEGES)을 부여하시오.
/* 
>>>>>>> d533d8cb3746d31d430533ff9a20ad6ef9e22d8d
    DBA 역할
        GRANT 권한유형
        ON DB명.테이블명
        TO '사용자명'@'호스트명';
            - *는 모든 테이블
*/
GRANT ALL PRIVILEGES
ON mydb.*
TO 'user1'@'localhost';

-- 4. user1에게 member 테이블의 SELECT 권한만 부여하시오.
GRANT SELECT
ON mydb.member
TO 'user1'@'localhost';

-- 권한 확인
-- 5. user1에게 부여된 권한을 확인하시오.
-- SHOW GRANT FOR '사용자명'@'호스트명';
SHOW GRANTS FOR 'user1'@'localhost';

-- REVOKE: 권한 회수
<<<<<<< HEAD
-- GRANT로 주었던 권한을 다시 뺏어올 때 사용
/*
    예시: REVOKE DELETE ON orders FROM 'user_id';
    설명: "너 이제 삭제는 못 해"라고 권한을 박탈하는 직관적인 명령어입니다.
*/
=======
>>>>>>> d533d8cb3746d31d430533ff9a20ad6ef9e22d8d
-- 6. user1에게서 member 테이블의 SELECT 권한을 회수하시오.
/* 
    권한 회수
        REVOKE 권한유형
        ON DB명.테이블명
        FROM '사용자명'@'호스트명';
*/
REVOKE SELECT
ON mydb.member
FROM 'user1'@'localhost';

-- 7. user1에게 부여된 mydb에 대한 모든 권한을 회수하시오.
REVOKE ALL PRIVILEGES
ON mydb.*
FROM 'user1'@'localhost';

-- 8. user1의 비밀번호를 5678로 변경하시오.
/* 
    ALTER USER '사용자명'@'호스트명'
    IDENTIFIED BY '변경할비밀번호';
*/
ALTER USER 'user1'@'localhost'
IDENTIFIED BY '5678';

-- 9. 변경된 권한을 즉시 반영하시오.
FLUSH PRIVILEGES;

-- DROP USER: 사용자 삭제
-- 10. user1 계정을 삭제하시오.
DROP USER 'user1'@'localhost';