-- 테이블 삭제
DROP TABLE member;
-- 테이블 생성
CREATE TABLE member (
  member_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50),
  age INT,
  gender CHAR(1),
  point INT,
  salary INT,
  regdate DATE
);
-- 데이터 삽입
INSERT INTO member VALUES
(1, 'Hong Gildong', 35, 'M', 500, 3000000, '2023-01-01'),
(2, 'Yi Sunsin', 22, 'M', 200, 2500000, '2022-01-01'),
(3, 'Kim Younghee', 19, 'F', NULL, 1800000, '2025-01-01'),
(4, 'Park Cheolsu', 45, 'M', 900, 5000000, '2021-01-01'),
(5, 'Choi Minsu', 31, 'F', 700, NULL, '2024-01-01');

SELECT * FROM member;
/*
    문자열 함수
        1.LENGTH(str)
        2.UPPER(str)

        LENGTH()	    바이트(Byte)수	    3 바이트	1 바이트	실제 저장 용량 확인
        CHAR_LENGTH()	글자(Character)수	1 글자	    1 글자	    실제 글자 수 제한/확인
*/
-- 1. 회원 이름의 길이를 조회하시오.
SELECT name,LENGTH(name)
FROM member;
-- 2. 회원 이름을 대문자로 조회하시오.
SELECT UPPER(name) FROM member; -- LOWER():소문자
SELECT LOWER(name) FROM member; 

-- 3. 회원 이름의 첫 글자만 조회하시오.
SELECT SUBSTRING(name,1,1) FROM member; -- SUBSTRING(name,1,2) 시작위치를 변경할수 있다.
SELECT name,LEFT(name,3) FROM member; -- 시작이 무조건 왼쪽끝
SELECT name,RIGHT(name,3) FROM member; -- 시작이 무조건 오른쪽끝
-- 4. 이름과 성별을 하나의 문자열로 조회하시오.
SELECT CONCAT(name,'(',gender,')') FROM member; 
-- () 때문에 복잡해진것 임 name ' ' gender 이렇게 해서 중간에 공백을 두어도 된다. 
--()안에 끝에 ,은 다음 또 추가될지도 모르는값을위해 준비용

-- 5. 포인트와 500의 차이를 절대값으로 조회하시오.
SELECT name,ABS(point-500) AS point_difference FROM member; -- 절댓값
-- 6. 급여를 만원 단위로 반올림하여 조회하시오.
SELECT name AS 이름,(salary/10000) AS 급여,ROUND(salary/10000) AS 급여_만원 FROM member;
select salary,CEILING(salary) FROM member;
select salary,FLOOR(salary) FROM member;
-- 7. 오늘 날짜를 조회하시오.
SELECT CURDATE();
    -- 오늘 시간
    SELECT CURTIME();
    -- 오늘 날짜+시간
    SELECT NOW();
    -- 오늘 연도만표기
    SELECT YEAR(CURDATE());
-- 8. 회원 가입 후 경과 일수를 조회하시오.
SELECT name AS 이름,CONCAT(DATEDIFF(CURDATE() , regdate),'일')
  AS 가입기간  FROM member; -- DATEDIFF(날짜1,날짜2); -(마이너스) 아님주의!!

-- 9. 포인트가 NULL이면 0으로 표시하시오.
    -- IFNULL은 **SELECT 절(지목 및 출력 단계)**에서 주로 쓰입니다. 
    -- "값을 가져오긴 할 건데, 혹시 비어있으면(NULL) 이 값으로 대신 보여줘!"지목한 값의 모양을 바꾸는 역할을 해요.
    -- cf)
    -- IS NULL은 **WHERE 절(필터링 단계)**에서 주로 쓰입니다. 
    -- "이 칸이 비어있는 **행(Record)**들만 다 모여!"라고 외치는 역할을 하죠.
SELECT name AS 이름 ,IFNULL(point,0) AS 포인트 FROM member;
    -- IFNULL은 **SELECT 절(지목 및 출력 단계)**에서 주로 쓰입니다. 
    -- "값을 가져오긴 할 건데, 혹시 비어있으면(NULL) 이 값으로 대신 보여줘!"라고 지목한 값의 모양을 바꾸는 역할
-- 10. 포인트가 500 이상이면 '우수', 아니면 '일반'으로 표시하시오.
SELECT name AS 이름 ,point AS 포인트,IF (point >=500,'우수','일반') AS 회원등급 FROM member;
/*
    *NULL까지 고려한 코드
    SELECT name AS 이름,point AS 포인트, 
    CASE 
        WHEN point >= 500 THEN '우수'
        WHEN point IS NULL THEN '데이터없음' 
        ELSE '일반'
    END AS 등급
    FROM member;
*/

-- 11. 나이에 따라 연령대(10대,20대,...,50대이상)를 분류하시오.
SELECT name AS 이름,age AS 나이,
CASE 
    WHEN age <20  THEN  '10대'
    WHEN age BETWEEN 20 AND 29  THEN  '20대'
    WHEN age BETWEEN 30 AND 39  THEN  '30대'
    WHEN age BETWEEN 40 AND 49  THEN  '40대'
    ELSE  '50대이상'
END AS 연령대
FROM member;
-- 12. 전체 회원 수를 조회하시오.
/*
    count(*) 는 NULL 포함하여 모든행의 수를 셉니다.

    보통 **Primary Key(기본키)**인 member_id를 넣어서 세는 경우가 많습니다.

    주의! 만약 COUNT(point)처럼 NULL이 섞여 있는 컬럼을 지정하면, NULL인 행은 빼고 숫자를 셉니다.
*/
SELECT COUNT(*) AS 회원수
FROM member;
SELECT COUNT(point) AS 회원수
FROM member; -- 결과 4
-- 13. 전체 포인트 합계를 조회하시오.
SELECT SUM(point) AS 포인트총합
FROM member; -- NULL 값은 제외하다.
-- 14. 평균 급여를 조회하시오.
SELECT round(AVG(salary),2) AS 평균급여 -- ROUND 3째자리 반올림 2째자리 까지 표시
FROM member;
-- 15. 성별별 평균 급여를 조회하시오.
/*
    (참고 ) GROUP BY 문의 에러 
    SELECT 
    name AS 이름, -> 여기서 에러발생됨.
    gender AS 성별, 
    FORMAT(AVG(salary),2) AS '평균 급여' -- 띄어쓰기 있을때 ''필수
    FROM member
    GROUP BY gender

    오류의 핵심: "이름(name)을 출력할 수 없습니다"
    사용자님, 한번 상상해 보세요. 지금 성별(gender)로 그룹을 묶었습니다.

    남성('M') 그룹 안에는 'Hong Gildong', 'Yi Sunsin', 'Park Cheolsu' 세 명이 모여 있습니다.

    그런데 SELECT에서 name(이름)을 보여달라고 명령하셨죠?

    컴퓨터는 당황합니다. "남성 그룹 한 줄에 이름은 세 개인데, 누구 이름을 출력해야 하지?"

*/
SELECT 
    gender AS 성별, 
    FORMAT(AVG(salary),2) AS '평균 급여' -- 띄어쓰기 있을때 ''필수
FROM member
GROUP BY gender;

    -- FORMAT(숫자, 소수점자리): 숫자에 콤마를 찍고, 지정한 소수점 자리까지 반올림해서 보여줍니다