-- SQL 표준 주석
# MySQL 주석
-- ctrl+enter : 커서가 있는 위치에 문장하나 실행 또는 블록설정하여 두개이상 문장실행
-- 문장 끝은 세미콜론;

-- 스키마(DB)생성
-- CREATE {DATABASE| SCHEMAS}[IF NOT EXISTS] db name;
CREATE SCHEMA `mydb` DEFAULT CHARACTER SET utf8mb4 ;
 USE mydb;
 -- 스키마 삭제
 DROP SCHEMA  basic;
/*
	DB  구축: DDL
		1. 사용자 정의 : root, park
			-아이디,패스워드,권한설정(DBA)
		2.스키마 생성 -DB
        3.테이블 생성
			-CREATE
			-열(속성 정의)
                        
            CREATE TABLE 테이블명 (
				컬럼 데이터타입[제약조건] [기타속성],
				컬럼 데이터타입
                ...
                [FOREIGN KEY 현재테이블(컬럼) REFERENCES 참조할테이블(컬럼);]
			);
            테이블/컬럼 이름 규칙
				1.영문자,숫자, _(언더바)
                2.첫 글자는 숫자x
                3.최대 길이는 64자
                4.예약어x (단,백틱(`)을 사용시가능 권장하지않음 예)`예약어`)
                5.윈도우 시스템에서는 대소문자 구분x , Linux에서는 구분o
                6.테이블명은 복수로, 필드명은 단수로(관례)
                7.소문자,스네이크 표기법(관례)
			데이터 타입
				1.숫자 INT 정수
                      BIGINT 큰정수
                      DECIMAL(p,s) 예)금액,정확한 소수 ->p:전체자리수,s:소숫점이하 자리수
				2.문자
					  CHAR(n) 고정길이 예)주민번호
                      VARCHAR(n) 가변길이 예)이름
				3.날짜/시간
					  DATE:날짜만	
					  DATETIME 날짜와시간()로컬 시간
					  TIMESTAMP UTC기준
				4.불리언
					  BOOLEAN  -> TINYINT(1)  Tinyint(1) 은 그값이 1이상인 경우 True를 반환하며 0인 경우 False를 반환한다.
				5.이진 데이터 이미지,동영상 등
					  TINYBLOB 255B
                      BLOB 64KB - 작은 아이콘,설정 파일
					  MEDIUMBLOB 16MB - 일반 이미지	
                      LONGBLOB 4GB - 고화질 이미지, 동영상
			제약 조건
				1. NOT NULL: 빈 값(NULL)을 허용하지 않음 -> 필수 입력
                2. UNIQUE: 중복 값을 허용x -> 유일성(UQ), 단 NULL은 허용!
                3. PRIMARY KEY: 기본키(PK) -> 행 구별, 중복x(유일성)
                4. FOREIGN KEY: 외래키(FK)
                5. CHECK: 입력되는 값이 특정 조건(예, price>0)을 만족하는지 검사
                6. DEFAULT: 값을 입력하지 않았을 때 자동으로 들어갈 값
			기타 속성
					  1.AUTO_INCREMENT: 자동으로 1씩 증가(1,2,3,...) -> 기본키를 지정한 컬럼에 설정한다.
                      
*/
-- 1. 회원 정보(회원 아이디,이름,나이,성별,가입일자)를 저장하는 member 테이블을 생성하시오.
-- 윈도우 시스템에서 MYSQL 은 대소문자를 구별하지 않는다
-- 명령어는 대문자로 (관례)

-- 테이블 생성
-- 테이블/컬럼 이름에 백틱(`)은 생략 가능
CREATE TABLE `member` (
	`member_id` INT PRIMARY KEY AUTO_INCREMENT, 
    `name` VARCHAR(50), 
    `age` INT, 
    `gender` CHAR(1), 
    `regdate` DATE
);

-- 2. 이름(product_name)은 필수 입력인 product 테이블을 생성하시오.
/*
	MySQL의 전용 속성
		1.AUTO_INCREMENT
			->자동으로 1씩 증가(1,2,3,...) 
            -> 기본키를 지정한 컬럼에 설정한다.
        2.UNSIGNED
			- 숫자 타입에서 음수를 제외하고 양수범위남 사용
            ->공간 효율 증가
        3.ZERO FILL
			-설정한 자릿수만큼 빈 공간을 0으로 채움
        4.BINARY
			-데이터를 이진 문자열로 저장하여 대소문자를 구분하게 함
        5.GENERATED
			-(price * quntity)처럼 특정 식에 의해 값이 자동 생성됨.
			
*/
CREATE TABLE product(
	product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    price INT
);
-- 3. 조회수(view_cnt) 기본값이 0인 board 테이블을 생성하시오.
CREATE TABLE board (
	board_no INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200),
    view_cnt INT DEFAULT 0
);
-- 4. 이메일(email)이 중복되지 않는 user 테이블을 생성하시오.
CREATE TABLE user (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100) UNIQUE,
    password VARCHAR(100)
);
-- 5. 주문 테이블(orders)을 생성하고 회원(member) 테이블을 참조하도록 설정하시오.
CREATE TABLE orders (
	order_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT,
    order_date DATE,
    -- 외래키는 현재 테이블의  member_id 컬럼은 member 테이블의 member_id 컬럼을 참조한다.
    FOREIGN KEY (member_id) REFERENCES member(member_id)
);
/*
	DDL : CREATE, ALTER, DROP
	테이블 수정
		1.컬럼 추가
		ALTER TABLE 테이블명 ADD 컬럼명 데이터타입 [제약조건];
        
        2.테이터 타입[과 제약 조건] 변경(modify)
        ALTER TABLE 테이블명 MODIFY 컬럼명 변경데이터타입 [변경제약조건]
        
        3.컬럼의 이름과 타입 변경(컬럼명1 -> 컬럼명2 데이터타입 으로 변경)
        ALTER TABLE 테이블명 CHANGE 컬럼명1 컬럼명2 데이터타입 [제약조건]
        
		4.컬럼의 이름만 변경
        ALTER TABLE 테이블명 RENAME COLUMN 컬럼명1 TO 컬럼명2;
        
		5.컬럼 삭제
        ALTER TABLE 테이블명 DROP [COLUMN] 컬럼명;
*/
-- 6. member 테이블에 phone 컬럼을 추가하시오.
ALTER TABLE member Add phone VARCHAR(20);
-- 7. member 테이블의 name 컬럼 길이를 100으로 변경하시오.
ALTER TABLE member MODIFY name VARCHAR(100);
-- 8. member 테이블의 phone 컬럼명을 mobile로 변경하시오.
-- ALTER TABLE member CHANGE phone mobile VARCHAR(20);
ALTER TABLE member RENAME COLUMN phone TO mobile;
-- 9. member 테이블에서 age 컬럼을 삭제하시오.
ALTER TABLE member DROP COLUMN age;
-- 10. member 테이블의 email 컬럼에 UNIQUE 제약조건을 추가하시오.
ALTER TABLE member ADD email VARCHAR(100) UNIQUE;
-- 11. member 테이블의 email UNIQUE 제약조건을 삭제하시오.
-- MySQL에서 컬럼에 UNIQUE 제약 조건을 설정하면,
-- 시스템은 중복값을 빨르게 체크하기 위해 내부적으로
-- 해당 컬럼에 인덱스(index)를 자동으로 생성한다.
-- 따라서 UNIQUE 제약 조건을 삭제하려면 생성된 인덱스를 삭제한다.
ALTER TABLE member DROP INDEX email;
/*
	테이블 이름 변경
		ALTER TABLE 기존테이블명 RENAME TO 새테이블명;(표준SQL)
        또는 
        RENAME TABLE 기존테이블명 TO 새테이블명;(MySQL)
*/
-- 12. member 테이블 이름을 customer로 변경하시오.
ALTER TABLE member RENAME TO customer;

RENAME TABLE member TO customer;

/*구분			ALTER TABLE ... RENAME TO			RENAME TABLE
주요 목적			테이블 구조 변경의 일환	        		테이블 이름 변경 전용
다중 변경			한 번에 한 테이블만 가능	        		한 번에 여러 테이블 변경 가능
데이터베이스 		이동	불가능 (이름만 변경)					다른 DB로 테이블 이동 가능
트랜잭션/잠금		테이블 전체에 잠금이 발생할 수 있음			매우 빠르고 원자적(Atomic)으로 작동
*/

/*
	테이블 삭제
	DROP TABLE 테이블명;
    
    member 테이블과 orders 테이블은 관계 설정되어 있고
    member 테이블 member_id 가 기본키로,
    orders 테이블으 member_id가 외래키로 설정되어 있으면
    
    member테이블이 삭제되지 않는다.
    현재 삭제하려는 member테이블이 orders 테이블과 종속 관계에 있으며,
    member 테이블은 상위 테이블 이믈 삭제할수 없음
    
    종속관계에서 상위 테비을을 삭제하고 싶으면
    하위테이블과의 종속관계를 제저하고..(예.02_select 윗부분참조)
*/
-- 13. product 테이블을 삭제하시오.
DROP TABLE product;
/*
	DML
		1. 데이터 조회 : SELECT
        2. 테이터 삽입 : INSERT
        3. 데이터 변경 : UPDATE
        4. 데이터 삭제 : DELETE
	테이블 삭제 -> 구조 삭제
		DROP TABLE 테이블명;
	데이터 삭제 -> 데이터만 삭제
		DELETE FROM  테이블명; ->롤백o, AI초기화x
        TRUNCATE TABLE 테이블명; ->롤백x,AI초기화o
        
        구분						DELETE								TRUNCATE	
명령어 종류			DML (Data Manipulation Language)		DDL (Data Definition Language)	
삭제 단위				행(Row) 단위로 한 줄씩 삭제					테이블 전체를 한 번에 삭제 (절제 후 재생성)	
WHERE 절	사용 		가능 (특정 조건만 삭제 가능)					사용 불가 (전체 삭제만 가능)	
속도					느림 (데이터가 많을수록 오래 걸림)				매우 빠름	
복구 (Rollback)		가능 (트랜잭션 로그를 남김)					불가능 (로그를 최소화함)	
Auto_Increment		초기화 안 됨 (기존 번호 다음부터 시작)			초기화됨 (1번부터 다시 시작)	
*/
/* 테이블명 클릭해서 직접 데이타입력후 apply 버튼클릭후 결과 캡쳐
 INSERT INTO [`스키마명`.]`테이블명` (`컬럼명1`, `컬럼명2`, `컬럼명3`) VALUES ('값1', '값2', '값3');
 INSERT INTO `mydb`.`board` (`board_no`, `title`, `view_cnt`) VALUES ('1', '점심', '10000');*/
-- 14. board 테이블의 모든 데이터를 삭제하시오.
/*
	DELETE FROM board WHERE board_no > 0; 안정성때문에 where생략시  없다고 에러발생함.
    TRUNCATE TABLE board; 이대로 사용가능
*/
DELETE FROM board WHERE board_no > 0;
TRUNCATE TABLE board;
/*
	테이블 복사
	CREATE TABLE 새테이블명 AS SELECT * FROM 기존테이블명;
*/
/*
	트랜젝션(Transacion)
*/
-- 1.테이블 생성
CREATE TABLE test (
id INT PRIMARY KEY,
name VARCHAR(30)
) ENGINE=InnoDB;
-- 2.데이터 삽입 , 여러개 블록선택후 실행시: ctrl+shift+enter
INSERT INTO test  VALUES (1,'A');
INSERT INTO test  VALUES (2,'B');
INSERT INTO test  VALUES (3,'C');
-- 세이프 모드 해제 DELETE FROM ..->WHERE 안쓰고 실행가능하게
SET SQL_SAFE_UPDATES = 0;
-- 3.트랜젝션 시작
START TRANSACTION;  
-- 4.데이터 삭제
DELETE FROM  test;
TRUNCATE TABLE test;
-- 5. 데이터 확인(조회)
SELECT * FROM test;
-- 6. 트랜젝션 종료: COMMIT 또는 ROLLBACK
COMMIT; -- 전부 성공, 확정
ROLLBACK; -- 전부 취소, 원래 상태로
-- 15. member 테이블 구조와 데이터를 복사하여 member_backup 테이블을 생성하시오.
CREATE TABLE member_backup AS SELECT * FROM member;



 


