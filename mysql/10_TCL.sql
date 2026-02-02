-- START TRANSACTION	트랜잭션 시작
-- COMMIT	작업 확정
-- ROLLBACK	작업 취소
-- SAVEPOINT	중간 저장점 설정
-- ROLLBACK TO	저장점까지 복구
-- SET AUTOCOMMIT	자동 커밋 제어

CREATE TABLE account (
    acc_no INT PRIMARY KEY,
    owner VARCHAR(30),
    balance INT
) ENGINE=InnoDB;

INSERT INTO account VALUES
(1, '홍길동', 10000),
(2, '이순신', 5000);


-- START TRANSACTION
-- 1. 트랜잭션을 시작하시오.
START TRANSACTION;
-- COMMIT	작업 확정
-- 2. 1번 계좌에서 2000원을 차감하고 트랜잭션을 확정하시오.
UPDATE account SET balance = balance - 2000
WHERE acc_no = 1;

-- ROLLBACK	작업 취소
-- 3. 2번 계좌에서 3000원을 차감한 후 작업을 취소하시오.
START TRANSACTION; -- 항상먼저해야 rollback 할수 있음.
UPDATE account SET balance = balance - 3000
WHERE acc_no = 2;

ROLLBACK;

-- SAVEPOINT	중간 저장점 설정
-- 4. 트랜잭션 도중 save1 저장점을 생성하시오.
START TRANSACTION;

UPDATE account SET balance = balance + 3000
WHERE acc_no = 1;

SAVEPOINT save1;

-- ROLLBACK TO	저장점까지 복구
-- 5. save1 이후 작업만 취소하시오.
UPDATE account SET balance = balance + 3000
WHERE acc_no = 1;

ROLLBACK TO save1;

-- 6. 현재 자동 커밋 상태를 확인하시오.
SELECT @@autocommit;

-- SET AUTOCOMMIT	자동 커밋 제어
-- 7. 자동 커밋을 비활성화하시오.
SET AUTOCOMMIT	= 0;

-- 8. 자동 커밋을 다시 활성화하시오.

SELECT * FROM account;