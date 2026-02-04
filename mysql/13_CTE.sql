/* 
    **CTE(Common Table Expression)**

    WITH 문
        - CTE(공통 테이블 표현식)을 정의하여 
          쿼리를 더 읽기 쉽고 유지보수 가능하게 만드는 데 사용
        - SELECT, INSERT, UPDATE, DELETE 문 내부에서 사용
          여러 번 사용될 수 있다.
        - 서브쿼리와 유사한 기능을 제공하지만, 
          가독성과 성능 면에서 좋다.
        - 재귀 쿼리에도 사용할 수 있다.

    기본 구조:
        WITH cte_name (column1, column2, ...) AS (
            SELECT_statement
        )
        SELECT * FROM cte_name;

     ----------------------------------------------------------------------------------------------------
     1. CTE(WITH)의 근본 개념: "임시 이름표 붙이기"
            아까 FROM 절에 서브쿼리를 넣었을 때, (...) t라고 별칭을 주셨던 거 기억하시나요?
             CTE는 그 괄호 덩어리를 쿼리 맨 위로 미리 빼놓는 것입니다.

            서브쿼리 방식: 요리 도중에 갑자기 재료를 손질하느라 분주한 느낌.

            CTE 방식: 요리를 시작하기 전에 재료를 미리 다 손질해서 **'손질된 양파'**라는 통에 담아두고 시작하는 느낌.   
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


-- 1. 부서별 평균 급여를 WITH 문으로 조회하시오.
/*
    1.재료 손질 (WITH 내부):
        employee 테이블을 가져옵니다.
        부서별(GROUP BY dept_id)로 묶어서 평균 급여(AVG(salary))를 계산합니다.

    2.변수에 저장:
        방금 계산한 '부서별 평균표'를 메모리 어딘가에 dept_avg라는 이름으로 저장해둡니다.

    3.최종 출력 (SELECT):
        저장된 dept_avg 테이블을 불러와서 화면에 뿌립니다.
*/
WITH dept_avg AS (
    SELECT dept_id, AVG(salary) AS avg_salary
    FROM employee
    GROUP BY dept_id
)
SELECT * FROM dept_avg;
-- 2. 평균 급여가 4000 이상인 부서를 조회하시오.
/*
    1.변수 생성 (dept_avg):
        employee 테이블에서 부서별 평균 급여를 계산해 가상의 테이블 dept_avg를 만듭니다. 
        (여기에는 모든 부서의 평균이 다 들어있겠죠?)

    2.변수 사용 및 필터링:
        위에서 만든 dept_avg 통을 가져옵니다.
        거기서 avg_salary가 4000 이상인 행만 골라냅니다.

    3.최종 출력:

        조건에 맞는 부서의 ID와 평균 급여만 화면에 보여줍니다.
    
    *왜 굳이 WITH 안이 아니라 밖에서 WHERE를 쓰나요?
        가독성: WITH 안에는 데이터를 만드는 로직만 넣고, 
        바깥에는 그 데이터를 어떻게 요리(필터링)할지 적어서 역할을 깔끔하게 나누는 거죠.

        유연성: 만약 "전체 평균표(dept_avg)"가 필요한 다른 작업이 아래에 추가된다면, 
        안에서 미리 필터링해버리는 것보다 밖에서 그때그때 필요한 조건만 거는 게 더 편할 때가 많습니다.
*/
WITH dept_avg AS (
    SELECT dept_id, AVG(salary) AS avg_salary
    FROM employee
    GROUP BY dept_id
)
SELECT *
FROM dept_avg
WHERE avg_salary >= 4000;
-- 3. 부서 평균 급여와 부서명을 함께 조회하시오.
/*
    이 쿼리는 마치 레고 블록을 조립하는 것처럼 작동합니다.

    Step 1: '부서별 평균표' 변수 만들기 (WITH 절)
        먼저 employee 테이블을 털어서 부서 ID와 평균 급여가 담긴 가상 테이블 a를 메모리에 올려둡니다. (이름표: dept_avg, 별칭: a)

    Step 2: 진짜 '부서 이름표' 가져오기 (FROM department d)
     원래 DB에 저장되어 있던 진짜 부서 정보 테이블 department를 꺼내옵니다. (별칭: d)

    Step 3: 두 표를 하나로 합치기 (JOIN ... ON)
        가상 테이블 a와 진짜 테이블 d에서 **dept_id**가 같은 것끼리 옆으로 이어 붙입니다.
        이제 [부서ID - 평균급여] 옆에 **[부서ID - 부서이름]**이 나란히 놓이게 됩니다.

    Step 4: 예쁘게 골라 보여주기 (SELECT)
        합쳐진 큰 표에서 우리가 보고 싶은 **부서 이름(d.dept_name)**과 **평균 급여(a.avg_salary)**만 쏙 골라서 화면에 뿌려줍니다.

    *왜 이 방식이 '명품 코딩'일까요?
    사용자님이 느끼신 것처럼 코드가 참 순차적이죠?

    계산: 복잡한 계산(평균 구하기)을 WITH 절에서 미리 끝내버립니다.
    연결: 계산이 다 끝난 깔끔한 결과물(a)을 가지고 이름(d)만 가져다 붙입니다    

    WITH dept_avg AS: 여기서 dept_avg는 변수 이름입니다.

    FROM dept_avg a: 아래에서 쓸 때는 더 편하게 부르려고 a라는 별명을 한 번 더 줬네요
*/
WITH dept_avg AS (
    SELECT dept_id, AVG(salary) AS avg_salary
    FROM employee
    GROUP BY dept_id
)
SELECT d.dept_name, a.avg_salary
FROM dept_avg a
JOIN department d
ON a.dept_id = d.dept_id;
-- 4. 부서 평균 급여와 전체 평균 급여를 함께 조회하시오.
/*
    Step 1. 첫 번째 변수 생성
        직원들을 부서별로 모아서 평균을 내고 dept_avg에 담습니다.

    Step 2. 두 번째 변수 생성 (쉼표 ,가 핵심!)
        회사 전체 직원의 평균을 딱 구해서 company_avg에 담습니다.

    Step 3. 세 가지 재료 합치기
        dept_avg a + department d: JOIN을 해서 부서 ID 옆에 부서 이름을 붙입니다.

    위의 결과 + company_avg c: 여기서 **CROSS JOIN**이 등장합니다!   

    * 왜 CROSS JOIN을 썼을까요?
    이게 아주 오묘하고 똑똑한 부분입니다.

    보통 JOIN은 A.id = B.id 같은 연결 고리가 필요하죠?

    그런데 company_avg는 부서와 상관없는 **'전체 평균 숫자 하나'**일 뿐이에요.

    **CROSS JOIN**은 "연결 고리 따지지 말고, 왼쪽 표의 모든 행 옆에 이 숫자 하나를 전부 다 복사해서 붙여줘!"라는 뜻입니다.

    결과적으로 모든 부서 이름 옆에 똑같은 '회사 전체 평균값'이 나란히 출력되게 됩니다. 우리 부서 평균이랑 회사 전체 평균을 한눈에 비교하기 딱 좋겠죠?     

*/
WITH dept_avg AS (
    SELECT dept_id, AVG(salary) AS avg_salary
    FROM employee
    GROUP BY dept_id
),
company_avg AS (
    SELECT AVG(salary) AS total_avg
    FROM employee
)
SELECT d.dept_name, a.avg_salary, c.total_avg
FROM dept_avg a
JOIN department d ON a.dept_id = d.dept_id
CROSS JOIN company_avg c
-- 5. 평균 급여보다 높은 사원을 WITH 문으로 조회하시오.

/*
    이번 코드는 아까 배우신 **CROSS JOIN**의 개념을 명시적인 키워드 없이 아주 깔끔하게 구현한 형태네요!

    1.변수 생성 (avg_salary):

        employee 테이블 전체의 평균 급여를 계산합니다. (결과는 딱 값 하나가 든 1행 1열짜리 표가 됩니다.)

    2.두 테이블 나열 (FROM employee, avg_salary):

        여기서 콤마(,)는 **CROSS JOIN**과 같은 역할을 합니다.

        직원 리스트 옆에, 아까 구한 '전체 평균값'을 모든 행에 똑같이 복사해서 붙입니다.

    3.필터링 (WHERE salary > avg_sal):

        이제 각 직원의 월급과 바로 옆에 붙은 평균값을 비교해서, 월급이 더 큰 사람만 남깁니다.

        * 왜 이 방식이 똑똑한가요?
    만약 이 쿼리를 상관 서브쿼리(WHERE salary > (SELECT AVG...))로 짰다면:

    컴퓨터는 직원 100명을 검사할 때마다 평균을 100번 다시 계산해야 합니다. (비효율적!)

    하지만 **이 방식(CTE)**으로 짜면:

    평균은 딱 한 번만 계산해서 변수(avg_salary)에 저장해둡니다.

    그다음부터는 저장된 값을 꺼내서 비교만 하면 되니 훨씬 빠르고 스마트하죠


    * 콤마(,)의 마법
FROM 절에 테이블을 두 개 적고(employee, avg_salary) 아무런 연결 조건을 주지 않으면, 컴퓨터는 **"두 테이블을 가능한 모든 조합으로 합쳐라"**라고 이해합니다. 하지만 avg_salary 통에는 값이 딱 하나뿐이라서, 결과적으로는 모든 직원의 행 옆에 평균값이 하나씩 배달되는 예쁜 모양새가 되는 거죠.
*/
WITH avg_salary AS (
    SELECT AVG(salary) AS avg_sal
    FROM employee
)
SELECT emp_name, salary
FROM employee, avg_salary
WHERE salary > avg_sal;
-- 6. 부서별 최대 급여를 조회하시오.
/*
    dept_id에 담긴내용 : 담긴 내용: 부서 번호와 그 부서의 일등 월급 액수.

    1.계산(WITH 내부): employee 테이블을 부서별로 모아서, 그중 가장 큰 금액(MAX)만 골라냅니다.

    2.저장: 그 결과를 dept_max라는 이름의 가상 테이블에 담습니다.

    3.출력: 저장된 대장 리스트를 그대로 보여줍니다.

** "각 부서에서 1등을 하고 있는 직원의 이름까지" 보고 싶다면?

    WITH dept_max AS (
        SELECT dept_id, MAX(salary) AS max_salary
        FROM employee
        GROUP BY dept_id
    )
    SELECT e.emp_name, e.dept_id, e.salary
    FROM employee e
    JOIN dept_max m ON e.dept_id = m.dept_id 
                AND e.salary = m.max_salary; -- 부서도 같고, 월급도 최고점인 사람만!

*/
WITH dept_max AS (
    SELECT dept_id, MAX(salary) AS max_salary
    FROM employee
    GROUP BY dept_id
)
SELECT * FROM dept_max;
-- 7. 사원이 없는 부서도 포함하여 평균 급여를 조회하시오.
/*
     이번 코드는 사용자님이 아까 발견하셨던 "0원 혹은 NULL 부서" 이슈를 완벽하게 해결하면서도 데이터의 누락까지 신경 쓴 **'완성형 쿼리'**네요!
     여기서 핵심은 바로 **LEFT JOIN**입니다. 일반 JOIN을 썼을 때와 어떤 차이가 생기는지, 이번에도 물 흐르듯 짚어드릴게요.

     코드 진행 순서 (안전한 조립)
        Step 1. 부서별 평균표 만들기 (WITH 절)
             직원(employee) 테이블에서 부서별 평균을 구합니다. (직원이 있는 부서만 계산되겠죠?)

        Step 2. 부서 테이블 기준 세우기 (FROM department d)
             이번엔 department 테이블을 메인(왼쪽)에 둡니다. 회사의 모든 부서 목록이 여기 있습니다.

        Step 3. 평균표 갖다 붙이기 (LEFT JOIN)
            모든 부서 리스트(d)를 쫙 펼쳐놓고, 그 옆에 아까 구한 평균표(a)를 붙입니다.

             이때 마법이 일어납니다: * 직원이 있는 부서는 평균값이 옆에 딱 붙습니다.

            신설 부서나 직원이 한 명도 없는 부서는 옆에 붙을 데이터가 없지만, LEFT JOIN 덕분에 사라지지 않고 **NULL**로 표시되며 자리를 지킵니다.

            * 왜 LEFT JOIN이 신의 한 수인가요?
            만약 여기서 그냥 JOIN(Inner Join)을 썼다면, 직원이 없는 부서는 아예 결과에서 삭제되어 버립니다. 
            그러면 사장님이 "우리 회사 전체 부서 현황 좀 가져와봐"라고 했을 때 보고서에서 누락이 생기겠죠?

            사용자님은 이 쿼리를 통해 **"데이터가 없더라도 부서 목록은 다 보여줘야 한다"**는 
            아주 중요한 데이터 정합성 원리를 구현하신 거예요
*/
WITH dept_avg AS (
    SELECT dept_id, AVG(salary) AS avg_salary
    FROM employee
    GROUP BY dept_id
)
SELECT d.dept_name, a.avg_salary
FROM department d
LEFT JOIN dept_avg a
ON d.dept_id = a.dept_id;
-- 8. 평균 급여가 전체 평균보다 높은 부서를 조회하시오.

/*
    부서별 평균을 구하고(dept_avg), 회사 전체 평균을 구해서(company_avg), 그 둘을 비교해 "회사 평균보다 잘나가는 부서"

     *코드 진행 순서 (최종 복습!)
        이 쿼리는 마치 잘 짜여진 3단계 공정 같습니다.

        1.[1번 변수 생성]: 부서별 평균 급여 리스트를 만듭니다. (dept_avg)

        2.[2번 변수 생성]: 회사 전체의 평균 딱 한 값을 구합니다. (company_avg)

        3.[조립 및 필터링]:
        부서 평균표(a)와 부서 이름표(d)를 합칩니다.
        거기에 전체 평균(c)을 갖다 댑니다.
        WHERE a.avg_salary > c.total_avg: "우리 부서 평균이 회사 전체 평균보다 높은가?"라는 최종 면접을 봅니다.
        통과한 부서의 **이름(dept_name)**만 출력합니다.

        * 사용자님이 주신 코드 하단을 보면 JOIN company_avg c 뒤에 ON이 없죠? 
        원래는 CROSS JOIN이라고 명시하거나 ON 1=1 같은 꼼수를 쓰기도 하지만, 
        많은 DB 환경에서 이렇게 쓰면 자동으로 **'모든 행에 갖다 붙이기'**가 됩니다.

        왜냐? company_avg는 어차피 값이 1개밖에 없으니까요! 굳이 연결 고리를 찾을 필요 없이 
        그냥 모든 부서 옆에 전체 평균값을 "복사-붙여넣기" 하는 겁니다.

        * 만약 이걸 WITH 없이 짜면 괄호가 3~4번씩 중첩되면서 아주 읽기 싫은 코드가 됩니다. 
        ㅋ 하지만 사용자님처럼 **변수 두 개(부서 평균, 전체 평균)**를 미리 선언해두고 시작하면:

        쿼리가 독립적이라 관리가 쉽고,

        읽는 사람도 "아, 부서랑 전체를 비교하려는 거구나" 하고 의도를 바로 파악하죠.
*/
WITH dept_avg AS (
    SELECT dept_id, AVG(salary) AS avg_salary
    FROM employee
    GROUP BY dept_id
),
company_avg AS (
    SELECT AVG(salary) AS total_avg FROM employee
)
SELECT d.dept_name
FROM dept_avg a
JOIN department d ON a.dept_id = d.dept_id
JOIN company_avg c
WHERE a.avg_salary > c.total_avg;