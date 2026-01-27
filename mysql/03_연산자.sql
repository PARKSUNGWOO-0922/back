SELECT * FROM member;
-- 산술연산자(+,-,*,/)
-- 1. 회원 포인트에 100을 더한 값을 조회하시오.
SELECT name, point AS 이전포인트,point +100 AS 100점추가 FROM member;
-- 2. 회원 포인트에서 50을 차감한 값을 조회하시오.
SELECT name, point AS 이전포인트,point -50 AS 50점차감 FROM member;
-- 3. 포인트를 2배로 계산하여 조회하시오.
SELECT name, point AS 이전포인트,point * 2 AS '2배로 인상' FROM member;
-- 4. 포인트를 10으로 나눈 값을 조회하시오.
SELECT name, point AS 이전포인트,point / 10 AS 10나눈값 FROM member;
-- 비교 연산자(=,!=)
-- 5. 등급이 VIP인 회원을 조회하시오.
SELECT * FROM member WHERE grade = 'VIP';
-- 6. 등급이 VIP가 아닌 회원을 조회하시오.
SELECT * FROM member WHERE grade != 'VIP';
-- 7. 포인트가 500 초과인 회원을 조회하시오.
SELECT * FROM member WHERE point > 500;
-- 8. 나이가 30 이상인 회원을 조회하시오.
SELECT * FROM member WHERE age >= 30;
-- 논리 연산자
-- 9. 성별이 F이고 포인트가 500 이상인 회원을 조회하시오.
SELECT * FROM member WHERE point >= 500 AND gender = 'F';
-- 10. 등급이 GOLD 또는 VIP인 회원을 조회하시오.
SELECT * FROM member WHERE grade ='GOLD' OR grade = 'VIP';

SELECT * FROM member WHERE grade IN ('GOLD' ,'VIP'); -- 필드가 같은경우 묶을수 있다.
-- 11. 성별이 M이 아닌 회원을 조회하시오.
SELECT * FROM member WHERE gender != 'M';
SELECT * FROM member WHERE NOT gender = 'M';
-- 범위/집합 연산자
/* 
    Between a AND b   -> a와 b 사이(a,b포함)
    IN(값1,값2,...)   -> 여러개 값중에 하나
 */
-- 12. 포인트가 200에서 700 사이인 회원을 조회하시오.
SELECT * FROM member WHERE point BETWEEN 200 AND 700;
-- 13. 등급이 BRONZE 또는 SILVER인 회원을 조회하시오.
-- Collation:utf8mb4_general_ci ->  (Case Insensitive)값의 대소문자를 구별하지 않는다.
SELECT * FROM member WHERE grade IN ('BRONZE','SILVER');
/* 
    패턴 연산자
        % 모든문자
        _ 문자 1자

        예) like '%김%' -> 김을 포함한
        예) like '김%' -> 김으로 시작하는
        예) like '%김' -> 김으로 끝나는
 */
-- 14. 이름에 '수'가 포함된 회원을 조회하시오.
SELECT * FROM member WHERE name LIKE '%수%';
/* 
    NULL 관련 연산자
        IS NULL         NULL이다
        IS NOT NULL     NULL아니다
 */
-- 15. 포인트가 NULL인 회원을 조회하시오.
SELECT * FROM member WHERE point = 'NULL'; -- 이경우에는 point 가 0 인 경우도 출력됨
SELECT * FROM member WHERE point IS NULL; -- 0인 경우는 출력안함.
-- 16. 포인트가 NULL이 아닌 회원을 조회하시오.
SELECT * FROM member WHERE point IS NOT NULL;
-- 17. 회원 등급을 중복 없이 조회하시오.
SELECT DISTINCT grade FROM member;