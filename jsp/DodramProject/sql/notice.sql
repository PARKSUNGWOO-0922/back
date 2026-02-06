-- 1. 테이블 만들기 (장부 양식 만들기)
CREATE TABLE notice (
    id INT PRIMARY KEY,
    title VARCHAR(200),
    writer VARCHAR(50),
    reg_date DATE,
    check_num INT,
    addr VARCHAR(200)
);

-- 2. 진짜 데이터 집어넣기 (이게 진짜 기절 포인트!)
INSERT INTO notice VALUES (190, '♥ MySQL에서 가져온 첫 공지!', 'DB관리자', '2026-02-06', 777, '#');
INSERT INTO notice VALUES (189, '이제 자바 코드 수정 안해도 돼요!', '성우', '2026-02-05', 120, '#');
INSERT INTO notice VALUES (188, 'DB에 넣으면 화면에 짠!', '친구', '2026-02-01', 500, '#');