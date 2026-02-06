package com.dodram.notice.dto;

/**
 * @author 박성우
 * 공지사항 데이터를 담는 바구니 (Notice Data Transfer Object)
 */
public class NoticeDTO {
    private int id;          // 번호
    private String title;    // 제목
    private String writer;   // 작성자
    private String date;     // 날짜
    private int checkNum;    // 조회수
    private String addr;     // 이동할 상세페이지 주소

    // 기본 생성자 (비어있는 바구니)
    public NoticeDTO() {}

    // 데이터를 꽉 채워서 담는 생성자
    public NoticeDTO(int id, String title, String writer, String date, int checkNum, String addr) {
        this.id = id;
        this.title = title;
        this.writer = writer;
        this.date = date;
        this.checkNum = checkNum;
        this.addr = addr;
    }

    // 데이터를 꺼내기 위한 Getter 메소드들
    public int getId() { return id; }
    public String getTitle() { return title; }
    public String getWriter() { return writer; }
    public String getDate() { return date; }
    public int getCheckNum() { return checkNum; }
    public String getAddr() { return addr; }
}