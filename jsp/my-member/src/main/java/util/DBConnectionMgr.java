package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/*
 * DBConnectionMgr
 * -------------------------------------------------------
 * 역할:
 *  - MySQL 데이터베이스와 연결(Connection)을 생성해주는 유틸 클래스
 *  - 실무에서 말하는 "Connection Factory" 역할
 *
 * 특징:
 *  - static 메서드 사용 → 객체 생성 없이 바로 사용 가능
 *  - DB 연결 정보는 상수(static final)로 관리
 */
public class DBConnectionMgr {

    // DB 접속 URL
    // jdbc:mysql://호스트:포트/DB이름
    // serverTimezone, useSSL 등은 MySQL 8 이상에서 권장 설정
    private static final String URL =
        "jdbc:mysql://localhost:3306/testdb?serverTimezone=Asia/Seoul&useSSL=false";

    // DB 접속 계정
    private static final String USER = "subway";

    // DB 접속 비밀번호
    private static final String PASSWORD = "1234";


    /*
     * getConnection()
     * -------------------------------------------------------
     * 역할:
     *  - DB와의 연결 객체(Connection)를 생성해서 반환
     *
     * 왜 static인가?
     *  - DBConnectionMgr.getConnection() 처럼
     *    객체 생성 없이 바로 호출하기 위해서
     *
     * 실무에서는?
     *  - 나중에는 DataSource(커넥션 풀) 방식으로 발전함
     */
    public static Connection getConnection() {

        try {
            /*
             * 1️⃣ 드라이버 로딩
             * ---------------------------------------------------
             * Class.forName()은 MySQL 드라이버 클래스를
             * JVM 메모리에 로딩하는 역할을 함.
             *
             * 이 코드가 실행되면:
             *  - MySQL 드라이버가 DriverManager에 등록됨
             *  - "jdbc:mysql:" URL을 처리할 수 있게 됨
             *
             * 만약 이 줄이 없으면:
             *  → No suitable driver found 에러 발생 가능
             */
            Class.forName("com.mysql.cj.jdbc.Driver");


            /*
             * 2️⃣ 실제 DB 연결 시도
             * ---------------------------------------------------
             * DriverManager는 등록된 드라이버 중에서
             * URL을 처리할 수 있는 드라이버를 찾아 연결함.
             *
             * 성공하면 Connection 객체 반환
             * 실패하면 SQLException 발생
             */
            return DriverManager.getConnection(URL, USER, PASSWORD);

        } catch (SQLException | ClassNotFoundException e) {

            /*
             * SQLException:
             *  - DB 연결 실패 (비밀번호 오류, DB 없음, 포트 문제 등)
             *
             * ClassNotFoundException:
             *  - mysql-connector.jar가 없거나
             *    드라이버 클래스를 못 찾는 경우
             *
             * 현재는 학습 단계이므로
             * 에러 내용을 콘솔에 출력
             */
            e.printStackTrace();

            /*
             * 연결 실패 시 null 반환
             * → 사용하는 쪽에서 null 체크 필요
             *
             * 실무에서는 보통 RuntimeException으로 감싸서 던지거나
             * 로그 처리 후 예외를 다시 throw하는 방식 사용
             */
            return null;
        }
    }
}