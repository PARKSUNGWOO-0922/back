
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
/*
    SELECT: 데이터를 조회하라는 명령어입니다.
    @@: MySQL이나 MariaDB에서 시스템 변수를 참조할 때 사용하는 기호입니다. (사용자 정의 변수는 @ 하나를 씁니다.)
    autocommit: 트랜잭션을 수동으로 관리할지, 아니면 명령어를 칠 때마다 자동으로 저장할지를 결정하는 변수입니다.

    조회했을 때 나오는 숫자에 따라 현재 상태가 달라집니다.
    1 (ON): 자동 커밋 모드. INSERT, UPDATE, DELETE를 실행하자마자 즉시 DB에 영구 반영됩니다. (실수하면 ROLLBACK이 안 됩니다!)
    0 (OFF): 수동 커밋 모드. 사용자가 직접 COMMIT을 입력하기 전까지는 메모리에만 임시 저장되며, 언제든 ROLLBACK으로 취소할 수 있습니다.

    안전한 작업 팁: 중요한 작업을 하기 전에는 항상 SELECT @@autocommit;으로 상태를 확인하고, 
    SET autocommit = 0;으로 만든 뒤 작업을 진행하세요. 
    결과가 확인되면 그때 COMMIT을 날리는 것이 고수의 비결입니다.
*/
SELECT @@autocommit;

-- 7. 자동 커밋을 비활성화하시오.
-- SET AUTOCOMMIT: 자동 커밋 제어
SET autocommit = 0;

-- 8. 자동 커밋을 다시 활성화하시오.
SET autocommit = 1;


SELECT * FROM account;
