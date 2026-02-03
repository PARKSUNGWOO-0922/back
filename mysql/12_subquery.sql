/*
    서브퀄리
        - 쿼리 안의 쿼리
        - 서브쿼리는 반드시 괄호()로 감싼다.

        1. SELECT 절의 컬럼으로 사용 -> 스칼라 서브쿼리
        2. FROM 절의 테이블로 사용 -> 인라인 뷰
        3. WHERE 절의 값으로 사용 -> 서브쿼리
        4. GROUP BY 컬럼 HAVING 절
        <기본 구조>
        SELECT 컬럼
        FROM 테이블
        WHERE 컬럼 연산자 (SELECT 컬럼 FROM 테이블 	WHERE 조건)
);

*/


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


-- 1. 평균 급여보다 급여가 높은 사원을 조회하시오.
SELECT AVG(salary)
FROM employee; -- 3875.0000
SELECT emp_name,salary  
FROM employee;
SELECT emp_name, salary
FROM employee
WHERE salary > (
    SELECT AVG(salary) FROM employee
);
-- 2. 개발 또는 인사 부서에 속한 사원을 조회하시오.
SELECT emp_name
FROM employee
WHERE dept_id IN (
    SELECT dept_id
    FROM department
    WHERE dept_name IN ('개발', '인사')
);

-- 3. 인사 부서 사원 중 최소 급여보다 급여가 높은 사원을 조회하시오.
INSERT INTO employee VALUES 
( 5,'김철수',3700,20),
( 6,'안중근',4600,20),
( 7,'이용식',3200,20);
-- 최솟값 구하기
SELECT MIN(salary) FROM employee;
-- 인사부서에서 최소값을 구해 기준값만 가지고 전체사원에서 추출한내용
SELECT emp_name, salary,dept_id
FROM employee
WHERE salary > ANY (
    SELECT salary
    FROM employee
    WHERE dept_id = 20
);
-- 인사부서중 최소급여 이상
-- any 는 from 뒤에 employee 전체와 비교하게 되기 때문에 결론적으로 employee의 최솟값보다 크다는 의미가 된다. 
SELECT emp_name, salary,dept_id
FROM employee
WHERE dept_id = 20           -- [1] 대상자를 '인사부'로 먼저 한정합니다.
  AND salary > ANY (         -- [2] 그 사람들 중 다음 조건에 맞는 사람만!
      SELECT salary 
      FROM employee 
      WHERE dept_id = 20     -- [3] 인사부 월급들(기준치)보다 큰 사람
  );
-- 그래서 실무 권장형
SELECT emp_name, salary
FROM employee
WHERE dept_id = 20           -- 인사부 중에서
  AND salary > (             -- 월급이 더 큰 사람!
      SELECT MIN(salary) 
      FROM employee 
      WHERE dept_id = 20     -- 인사부 최소 월급보다
  );
  /*
    ANY: "리스트 중 조건을 만족하는 것이 최소한 하나라도 있는가?"
    ALL: "리스트의 모든 항목이 조건을 만족하는가?"
    이런 존재론적 비교를 할 때는 MIN()이나 MAX() 같은 계산 함수보다 
    ANY/ALL 연산자가 컴퓨터 공학적으로 훨씬 더 근본적이고 빠른 처리를 할 때가 있습니다.
  */
select * from employee;
-- 4. 인사 부서 사원 중 최대 급여보다 급여가 높은 사원을 조회하시오.
-- 5. 사원이 존재하는 부서만 조회하시오.
-- 6. 사원이 없는 부서를 조회하시오.
-- 7. 각 사원의 급여와 전체 평균 급여를 함께 조회하시오.
-- 8. 부서별 평균 급여가 4000 이상인 부서를 조회하시오.
-- 9. 각 부서에서 평균 급여보다 많이 받는 사원을 조회하시오.
-- 10. 평균 급여보다 높은 사원을 JOIN 방식으로도 조회하시오.