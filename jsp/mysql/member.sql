-- DB 생성
CREATE SCHEMA `testdb` DEFAULT CHARACTER SET utf8mb4 ;

-- DB 사용
USE testdb;

-- ex01. 테이블 생성
CREATE TABLE users (
	userid VARCHAR(20) PRIMARY KEY,
    userpw VARCHAR(20) NOT NULL 
);

-- 데이터 삽입
INSERT INTO `testdb`.`users` (`userid`, `userpw`) 
VALUES ('hong', '1234');

INSERT INTO users (userid, userpw) VALUES
('sublover01', 'Subway123!'),
('freshbite22', 'EatFresh22'),
('italianBMT', 'BMT2024!'),
('veggie_delight', 'Veggie99'),
('turkeyclub5', 'Club5500');

-- 조회
SELECT * FROM users;

-- 삭제
DELETE FROM `testdb`.`users` WHERE (`userid` = 'hong');

DROP TABLE IF EXISTS member;

-- ex02 회원가입 테이블 생성
CREATE TABLE `member` (
	  `phone` varchar(30) ,
	  `name` varchar(20),
	  `gender` char(1),
	  `id` varchar(20) PRIMARY KEY,
	  `pwd` varchar(20) NOT NULL,
	  `email` varchar(30) ,
	  `zipcode` char(7) ,
	  `address1` varchar(60) ,
	  `address2` varchar(60) ,
	  `hobby` char(5) ,
	  `job` varchar(30)
);
INSERT INTO `member` (id, pwd, name, gender, phone, email, zipcode, address1, address2, hobby, job) VALUES 
('green_leaf', 'pass111', '김지혜', 'F', '010-1111-2222', 'leaf@example.com', '06150', '서울 강남구 삼성로', '101호', '운동', '연구전문직'),
('meat_lover', 'pass222', '이강철', 'M', '010-2222-3333', 'meat@example.com', '04524', '서울 중구 세종대로', '2층', '여행', '일반자영업'),
('fast_eat', 'pass333', '박민수', 'M', '010-3333-4444', 'fast@example.com', '03154', '서울 종로구 종로1길', 'A빌딩', '게임', '회사원'),
('olivelover', 'pass444', '최윤아', 'F', '010-4444-5555', 'olive@example.com', '08217', '서울 구로구 경인로', '305호', '영화', '교수학생'),
('spicy_king', 'pass555', '정태수', 'M', '010-5555-6666', 'spicy@example.com', '48058', '부산 해운대구 해운대해변로', '10층', '인터넷', '공무원'),
('cheese_man', 'pass666', '한승호', 'M', '010-6666-7777', 'cheese@example.com', '13487', '경기 성남시 분당구', 'B아파트', '운동', '의료인'),
('morning_sub', 'pass777', '조현주', 'F', '010-7777-8888', 'morning@example.com', '03925', '서울 마포구 월드컵북로', '4층', '여행', '종료/언론/예술인'),
('pickles_no', 'pass888', '윤지민', 'F', '010-8888-9999', 'pickles@example.com', '21558', '인천 남동구 정각로', '202호', '영화', '주부'),
('healthy_way', 'pass999', '강대한', 'M', '010-9999-0000', 'healthy@example.com', '35242', '대전 서구 둔산로', '501호', '운동', '법조인'),
('sandwich_fan', 'pass000', '임사랑', 'F', '010-1234-5678', 'fan@example.com', '41911', '대구 중구 공평로', '6층', '인터넷', '기타');

-- 게시판 테이블
CREATE TABLE board (
    num         INT AUTO_INCREMENT PRIMARY KEY, -- 게시글 고유 번호 (자동 증가)
    userid      VARCHAR(50) NOT NULL,           -- 작성자 아이디 (members 테이블의 id와 연결)
    subject     VARCHAR(200) NOT NULL,          -- 게시글 제목
    content     TEXT NOT NULL,                  -- 게시글 내용 (긴 문장 대응)
    regdate     DATE DEFAULT (current_date()), -- 작성일 (현재 시간 기본값, YYYY-MM-DD)
    readcount   INT DEFAULT 0,                  -- 조회수 (기본값 0)
    
    -- 회원 테이블(members)의 id를 참조하는 외래키 설정 (회원만 글쓰기 가능할 경우)
    CONSTRAINT fk_board_writer FOREIGN KEY (userid) 
    REFERENCES member(id) ON DELETE CASCADE
);

-- 데이터 삽입
INSERT INTO board (userid, subject, content) VALUES 
('green_leaf', '로스트 치킨 식단 공유', '단백질 보충하기에 이만한 게 없네요.'),
('meat_lover', '베이컨 추가는 진리입니다', '짭조름한 맛이 고기 풍미를 살려줘요.'),
('fast_eat', '점심시간 대기 너무 기네요', '12시 전에 가야 겨우 앉습니다.'),
('olivelover', '올리브 많이 달라고 하면?', '진짜 산더미처럼 쌓아주셔서 행복해요.'),
('spicy_king', '핫칠리 소스 주의보', '생각보다 훨씬 매우니 조심하세요!'),
('cheese_man', '슈레드 vs 아메리칸', '개인적으로는 슈레드가 더 고소한 듯.'),
('morning_sub', '출근길 모닝 세트', '해쉬브라운이랑 같이 먹으면 꿀맛.'),
('pickles_no', '피클 빼달라는 거 깜빡함', '결국 하나하나 다 골라냈네요 ㅜㅜ'),
('healthy_way', '다이어트 소스 추천', '올리브오일이랑 후추만 뿌려보세요.'),
('sandwich_fan', '이탈리안 비엠티 칼로리', '맛있는 건 0칼로리 맞죠?'),
('green_leaf', '샐러드로 변경 비용', '1,700원 추가하면 샐러드로 바꿔줍니다.'),
('meat_lover', '스테이크 앤 치즈 후기', '고기가 생각보다 연하고 맛있어요.'),
('fast_eat', '앱으로 미리 주문하기', '도착하자마자 바로 픽업하니 편하네요.'),
('olivelover', '서브웨이 알바 후기 궁금', '알바하면 메뉴 다 외우기 힘든가요?'),
('spicy_king', '매운맛 끝판왕 조합', '할라피뇨에 핫칠리 세 번 뿌렸습니다.'),
('cheese_man', '치즈 녹여달라고 하세요', '빵 구울 때 같이 녹여야 제맛입니다.'),
('morning_sub', '커피 맛 의외로 괜찮음', '가성비 카페보다 나은 것 같아요.'),
('pickles_no', '할라피뇨는 많이 넣어주세요', '피클은 싫지만 할라피뇨는 극호!'),
('healthy_way', '위트 빵 속 파서 먹기', '탄수화물 조금이라도 줄여보려고요.'),
('sandwich_fan', '최애 쿠키 투표합시다', '저는 라즈베리 치즈케익에 한 표!'),
('green_leaf', '오늘의 샌드위치 행사', '무슨 요일 메뉴가 제일 혜자인가요?'),
('meat_lover', '풀드 포크 바비큐 리뷰', '결대로 찢어진 고기가 아주 부드러워요.'),
('fast_eat', '혼밥하기 좋은 매장 추천', '강남역 부근에 혼밥석 많은 곳 있나요?'),
('olivelover', '블랙 올리브의 매력', '특유의 향이 샌드위치랑 잘 어울려요.'),
('spicy_king', '사우스웨스트 소스 맛', '이국적인 맛 좋아하시면 강추합니다.'),
('cheese_man', '모차렐라 치즈 추가!', '쭉쭉 늘어나는 식감이 일품입니다.'),
('morning_sub', '웨스턴 에그 치즈 후기', '아침 대용으로 부담 없고 딱 좋아요.'),
('pickles_no', '주문 울렁증 극복하는 법', '키오스크 있는 매장으로 가세요ㅋㅋ'),
('healthy_way', '야채 다 넣어주세요의 최후', '샌드위치가 안 닫혀서 샐러드처럼 먹음.'),
('sandwich_fan', '단체 주문 꿀팁', '회사 행사 때 시켰는데 반응 좋네요.'),
('green_leaf', '아보카도 추가 필수!', '부드러운 풍미가 완전히 달라집니다.'),
('meat_lover', 'K-바비큐 드셔보신 분?', '마늘 향이 은은하게 나서 한국인 입맛 저격.'),
('fast_eat', '음료 리필 가능한가요?', '매장마다 다른데 요즘은 안 되는 곳이 많네요.'),
('olivelover', '민트초코 쿠키 재입고', '드디어 저희 동네 매장에 들어왔어요!'),
('spicy_king', '스파이시 이탈리안 맵기', '생각보다 꽤 맵싸해서 콜라 필수입니다.'),
('cheese_man', '치즈 폭탄 레시피 공유', '치즈 3번 추가하고 렌치 뿌리면 끝.'),
('morning_sub', '오전 11시 전에는 모닝', '시간 지나면 못 먹으니 서두르세요.'),
('pickles_no', '오이도 빼주시는 분?', '저는 오이 향도 싫어서 꼭 뺍니다.'),
('healthy_way', '운동 끝나고 서브웨이', '이게 바로 진정한 오운완 식단.'),
('sandwich_fan', '플랫브레드 쫀득함 최고', '이 빵만 먹게 되는 마법이 있네요.'),
('green_leaf', '허니 머스터드 조합', '달달한 게 당길 때는 무조건 이거죠.'),
('meat_lover', '로티세리 치킨 추천 소스', '스위트 칠리가 제일 잘 어울리는 듯.'),
('fast_eat', '서브웨이 포인트 적립', '앱 가입하고 포인트 꼭 챙기세요.'),
('olivelover', '올리브 절임 사고 싶다', '집에서 샌드위치 해먹을 때 넣고 싶어요.'),
('spicy_king', '스트레스 풀리는 매운맛', '오늘 하루 너무 힘들어서 핫칠리 폭격함.'),
('cheese_man', '치즈는 역시 슈레드죠', '풍미가 깊어서 다른 건 못 먹겠음.'),
('morning_sub', '주말 아침 브런치 느낌', '여유롭게 먹는 샌드위치가 최고입니다.'),
('pickles_no', '서브웨이 빵 파기 금지?', '요즘 매장은 안 파주는 곳도 많더라고요.'),
('healthy_way', '탄산음료 대신 생수', '건강 생각해서 물로 마시고 있습니다.'),
('sandwich_fan', '신메뉴 안창비프 먹어봄', '스테이크보다 훨씬 고기가 부드러워요.'),
('green_leaf', '토마토 많이 넣어주세요', '신선한 야채가 아삭아삭 씹혀서 좋아요.'),
('meat_lover', '베이컨 에그 치즈 조합', '아침 메뉴지만 저녁에 먹어도 맛있음.'),
('fast_eat', '포장해오면 빵 눅눅해짐', '최대한 빨리 먹는 게 정답입니다.'),
('olivelover', '서브웨이 굿즈 갖고 싶다', '예전에 나온 슬리퍼 진짜 귀여웠는데.'),
('spicy_king', '할라피뇨 빼고 핫칠리만', '깔끔하게 매운맛 즐기는 방법입니다.'),
('cheese_man', '리코타 치즈 샐러드 후기', '생각보다 치즈 양이 많아서 만족해요.'),
('morning_sub', '직원 추천 조합 실패 없음', '결정장애 올 땐 "추천대로 해주세요".'),
('pickles_no', '서브웨이 마요네즈 맛있음', '시판 마요네즈랑 맛이 좀 다른 느낌?'),
('healthy_way', '소스 없이 먹기 도전', '야채 본연의 맛이 느껴져서 의외로 굿.'),
('sandwich_fan', '빵 종류가 6가지나 되네요', '매번 하티만 먹다가 이번에 위트 도전!'),
('green_leaf', '서브웨이 칼로리 계산기', '사이트 가시면 영양성분 다 나옵니다.'),
('meat_lover', '고기 패티 추가되나요?', '햄만 추가되는지 패티도 되는지 궁금.'),
('fast_eat', '빨리 나오는 매장 특징', '직원분들 손이 보이지 않을 정도로 빠름.'),
('olivelover', '올리브는 역시 블랙 올리브', '샌드위치 색감도 살려주고 맛도 있고.'),
('spicy_king', '칠리 소스 섞어 먹기', '스위트 칠리랑 핫칠리 반반 섞어보세요.'),
('cheese_man', '체다 치즈 도입 시급', '슬라이스 체다 치즈도 있으면 좋겠어요.'),
('morning_sub', '모닝 세트 쿠키 변경', '쿠키 대신 칩으로 변경 가능한가요?'),
('pickles_no', '피클 대신 피망 많이', '피망의 아삭함이 느끼함을 잡아줌.'),
('healthy_way', '서브웨이 샐러드 볼 추천', '양이 생각보다 많아서 한 끼 든든함.'),
('sandwich_fan', '서브웨이 파티 플래터', '집들이 음식으로 냈더니 다들 좋아함.'),
('green_leaf', '로스트 비프 돌아와라', '단종된 메뉴 중 제 최애였는데 ㅠㅠ'),
('meat_lover', '단백질 폭탄 조합 공유', '치킨 데리야끼에 베이컨 두 번 추가.'),
('fast_eat', '키오스크 주문 편해요', '눈치 안 보고 소스 고를 수 있어서 좋음.'),
('olivelover', '서브웨이 마일리지 혜택', '자주 가니까 실버 등급 됐네요.'),
('spicy_king', '불닭 소스도 나오면 좋겠다', '서브웨이랑 은근 잘 어울릴 듯요.');

