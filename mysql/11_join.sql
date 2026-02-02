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
            -...나머지는 복사하자.



*/

-- 1문제: 사원이 속한 부서 이름을 함께 조회하시오.
SELECT * FROM employee;
SELECT * FROM department;

/*
    내부 조인(INNER JOIN)
        SELECT 필드,... 
        FROM 테이블 JOIN 테이블
        ON employee.dept_id = department.dept_id;

*/
SELECT emp_name,dept_name 
FROM employee JOIN department
ON employee.dept_id = department.dept_id;
-- 2문제: 부서가 없는 사원도 포함하여 사원명과 부서명을 조회하시오.
-- 3문제: 소속 사원이 없는 부서도 포함하여 조회하시오.
-- 4문제: 사원과 부서의 모든 조합을 조회하시오.
-- 5문제: 같은 테이블을 사용하여 사원끼리 이름을 나란히 조회하시오.
-- 6문제: USING 절을 사용하여 사원과 부서를 조인하시오.
-- 7문제: 공통 컬럼을 기준으로 자동 조인을 수행하시오.
-- 8문제: 개발 부서 사원만 조회하시오.
-- 9문제: 부서별 평균 급여를 조회하시오.
-- 10문제: 부서가 없는 사원만 조회하시오.