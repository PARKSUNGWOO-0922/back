CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(30)
);

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(30),
    salary INT,
    dept_id INT
);

INSERT INTO department VALUES
(10, '개발'),
(20, '인사'),
(30, '영업');

INSERT INTO employee VALUES
(1, '홍길동', 4000, 10),
(2, '이순신', 5000, 10),
(3, '강감찬', 3500, 20),
(4, '유관순', 3000, NULL);

/*
    조인(JOIN)
        1.내부 왜부 : [inner] join
        2. 외부 조인
            - 왼쪽 외부 조인: left [outer] join
            - 오른쪽 외부 조인: right [outer] join


*/

-- 1문제: 사원이 속한 부서 이름을 함께 조회하시오.
/*
    내부 조인(INNER JOIN):두 테이블에서 조인 조건을 만족하는 행만 결합
        SELECT 필드,... 
        FROM 테이블 JOIN 테이블
        ON employee.dept_id = department.dept_id;
*/
SELECT emp_name,dept_name
FROM employee JOIN department
ON employee.dept_id = department.dept_id;

SELECT emp_name,dept_name 
FROM employee LEFT JOIN department
ON employee.dept_id = department.dept_id;

SELECT emp_name,dept_name 
FROM employee RIGHT JOIN department
ON employee.dept_id = department.dept_id;
-- 2문제: 부서가 없는 사원도 포함하여 사원명과 부서명을 조회하시오.
-- 왼쪽 외부조인
SELECT emp_name,dept_name 
FROM employee LEFT JOIN department
ON employee.dept_id = department.dept_id;

SELECT emp_name,dept_name 
FROM employee LEFT JOIN department
ON employee.dept_id = department.dept_id
WHERE department.dept_id IS NULL;

SELECT emp_name,dept_name 
FROM employee RIGHT JOIN department
ON employee.dept_id = department.dept_id
WHERE employee.dept_id IS NULL;

-- 3문제: 소속 사원이 없는 부서도 포함하여 조회하시오.
SELECT emp_name,dept_name 
FROM employee RIGHT JOIN department
ON employee.dept_id = department.dept_id;
-- 4문제: 사원과 부서의 모든 조합을 조회하시오.
/*
    교차조인(CROSS JOIN , 카티션 곱)
    SELECT *
    FROM 테이브1 AS 별칭1
    CROSS JION 테이블2 AS 별칭2
*/
SELECT emp_name,dept_name 
FROM employee CROSS JOIN department;
-- 5문제: 같은 테이블을 사용하여 이름이 다른 사원끼리 이름을 나란히 조회하시오.
/*
    자기조인(SELF JOIN)
    같은 테이블을 별칭을 다르게 하여 두번 이상 사용하는 조인
    SELECT컬럼,...
    FROM 테이블1 AS 별칭1
    JOIN 테이블1 AS 별칭2
    ON 별칭1.공통컬럼 = 별칭2.공통컬럼
*/
SELECT e1.emp_name AS 이름1, e2.emp_name AS 이름2
FROM employee e1
JOIN employee e2
ON e1.emp_name <> e2.emp_name;
/*
    MySQL에서는 FULL OUTER JOIN이라는 명령어 대신, LEFT JOIN 결과와 RIGHT JOIN 결과를 UNION으로 합쳐서 똑같은 결과를 만들어냅니다.
    -- 1. 왼쪽 기준 합치기 (LEFT JOIN)
    -- 2. 오른쪽 기준 합치기 (RIGHT JOIN)
        SELECT * FROM tableA LEFT JOIN tableB USING (id)
        UNION -- 두 결과를 합치고 중복은 제거함!
        SELECT * FROM tableA RIGHT JOIN tableB USING (id);
    💡 왜 UNION인가요?
    UNION은 두 쿼리의 결과물을 하나로 합쳐주는 연산자입니다.

    기본적으로 중복된 행은 하나만 남기고 제거해주기 때문에, 
    LEFT JOIN과 RIGHT JOIN에서 겹쳤던 데이터(INNER JOIN 영역)가
    깔끔하게 정리되어 완벽한 FULL OUTER JOIN의 형상을 갖추게 된다
*/
-- (INNER JOIN)인경우 USING결과와 동일
SELECT emp_name,dept_name 
FROM employee LEFT JOIN department
ON employee.dept_id = department.dept_id
WHERE department.dept_id IS NOT  NULL
UNION
SELECT emp_name,dept_name 
FROM employee RIGHT JOIN department
ON employee.dept_id = department.dept_id
WHERE employee.dept_id IS NOT  NULL;
-- 6문제: USING 절을 사용하여 사원과 부서를 조인하시오.
/*
    USING 절
        - 공통 컬럼명이 동일한 경우 사용;
    SELECT
    FROM 테이블1 별칭 별칭1
    FROM 테이블1 별칭 별칭2
    USING (공통컬럼)
*/
SELECT emp_name AS 이름,dept_name AS 부서 
FROM employee e JOIN department d
USING (dept_id);
-- 7문제: 공통 컬럼을 기준으로 자동 조인을 수행하시오.
/*
    자연 조인(Natural Join)
        -공통 컬럼을 기준으로 자동 조인

        SELECT 컬럼
        FROM 테이블1 AS 별칭1
        NATURAL JOIN 테이블2 AS 별칭2
*/
SELECT e.emp_name AS 이름, d.dept_name AS 부서
FROM employee e
NATURAL JOIN department d ;
-- 8문제: 개발 부서 사원만 조회하시오.
SELECT e.emp_name AS 이름, d.dept_name AS 부서
FROM employee e
JOIN department d
ON e.dept_id = d.dept_id
WHERE d.dept_name = '개발';
-- 9문제: 부서별 평균 급여를 조회하시오.
SELECT d.dept_name, AVG(e.salary) AS 평균급여
FROM employee e
JOIN department d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name;
-- 10문제: 부서가 없는 사원만 조회하시오.
SELECT emp_name
FROM employee
WHERE dept_id IS NULL;