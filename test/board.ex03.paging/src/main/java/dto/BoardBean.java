package dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardBean {
	private int num;
	private String userid;
	private String subject;
	private String content;
	private String regdate;
	private int readcount;
}