
/* 
    트랜젝션이란?
    - 하나의 작업 단위를 의미
    - 트랜잭션의 특징
        1. 원자성(Atomicity)
            - 트랜잭션의 작업들은 모두 완료되거나 모두 취소되어야 함
        2. 일관성(Consistency)
            - 트랜잭션이 성공적으로 완료되면 데이터베이스는 일관된 상태를 유지
        3. 고립성(Isolation)
            - 동시에 실행되는 트랜잭션은 서로 간섭하지 않음
        4. 지속성(Durability)
            - 트랜잭션이 완료되면 그 결과는 영구적으로 저장
    
    - 트랜잭션 제어 명령어
        1. START TRANSACTION : 트랜잭션 시작
        2. COMMIT : 트랜잭션 확정(저장)
        3. ROLLBACK : 트랜잭션 취소(되돌리기)
        4. SAVEPOINT : 트랜잭션 내에서 저장점 설정
        5. ROLLBACK TO SAVEPOINT : 저장점 이후 작업 취소
        6. SET autocommit = 0/1 : 자동 커밋 설정(0: 비활성화, 1: 활성화)
 */

CREATE TABLE account (
    acc_no INT PRIMARY KEY,
    owner VARCHAR(30),
    balance INT
) ENGINE=InnoDB;

INSERT INTO account VALUES
(1, '홍길동', 10000),
(2, '이순신', 5000);

-- 1. 트랜잭션을 시작하시오.
-- START TRANSACTION: 트랜잭션 시작
START TRANSACTION;

-- 2. 1번 계좌에서 2000원을 차감하고 트랜잭션을 확정하시오.
UPDATE `account` 
SET balance = balance - 2000
WHERE acc_no = 1;

-- COMMIT: 작업 확정
COMMIT;

-- 3. 2번 계좌에서 3000원을 차감한 후 작업을 취소하시오.
START TRANSACTION;
UPDATE `account` 
SET balance = balance - 3000
WHERE acc_no = 2;

-- ROLLBACK: 작업 취소
ROLLBACK;

-- 4. 트랜잭션 도중 save1 저장점을 생성하시오.
START TRANSACTION;

UPDATE `account` 
SET balance = balance + 3000
WHERE acc_no = 2;

-- SAVEPOINT: 중간 저장점 설정
SAVEPOINT save1;

-- 5. save1 이후 작업만 취소하시오.
UPDATE `account` 
SET balance = balance + 3000
WHERE acc_no = 1;

-- ROLLBACK TO:	저장점까지 복구
ROLLBACK TO save1;

-- 6. 현재 자동 커밋 상태를 확인하시오.
SELECT @@autocommit;

-- 7. 자동 커밋을 비활성화하시오.
-- SET AUTOCOMMIT: 자동 커밋 제어
SET autocommit = 0;

-- 8. 자동 커밋을 다시 활성화하시오.
SET autocommit = 1;


SELECT * FROM account;
