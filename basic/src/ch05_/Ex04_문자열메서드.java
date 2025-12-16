package ch05_;
/**
 * 문자열 메서드
 * 	1.charAt(인덱스)0~
 * 		- 문자열에서 인덱스번째 문자하나 추출
 * 		- 인덱스번호는 0 부터 글자수 미만 까지
 * 		- 범위를 초과하면 StringIndex OutOfBounds Exception 
 * 	2.length()
 * 		- 문자열의 길이(문자수)
 * 	3.replace(변경대상문자열,변경할문자열)
 * 		- 기존  텍스트는 변동없이 변경되 새로운 텍스트 생성
 * 	4.substring(시작인덱스,끝인덱스)
 * 		- 시작인덱스부터 끝인덱스 전까지
 * 		- 끝인덱스를 생략하면 시작인덱스 부터 문자열 끝까지 반환
 * 	5.indexOf("부분문자열")
 * 		-문자열에서 부분문자열의 index 번호를 반환
 * 	6.contains("부분문자열")
 * 		-문자열에서 부분문자열을 포함하면 true, 아니면 false
 * 	7.split(구분자)
 */
public class Ex04_문자열메서드 {

	public static void main(String[] args) {
		//----------------char ------------
		String ssn = "9506241230123";
		char sex = ssn.charAt(6);
		switch (sex) {
			case '1':
			case '3':
				System.out.println("남자입니다.");
				break;
			case '2':
			case '4':
				System.out.println("여자입니다.");
				break;
		}
		//----------------length------------
		//String ssn = "9506241230123"; 변수중복선언 주석처리
		int length = ssn.length();//문자열은 메소드 cf)배열은 속성 () 없음.밑에 배열반복문참조
		if(length == 13) {
			System.out.println("주민등록번호 자릿수가 맞습니다.");
		} else {
			System.out.println("주민등록번호 자릿수가 틀립니다.");
		}
		
		//----------------repalce------------
		String oldStr = "자바 문자열은 불변입니다. 자바 문자열은 String입니다.";
		String newStr = oldStr.replace("자바", "JAVA");

		System.out.println(oldStr);
		System.out.println(newStr);
		//----------------substring------------
		//String ssn = "880815-1234567";
		
		String firstNum = ssn.substring(0, 6);//0부터 6번전까지
		System.out.println(firstNum);

		String secondNum = ssn.substring(6);
		System.out.println(secondNum);
		//----------------indexOf------------
		String subject = "자바 프로그래밍";

		int location = subject.indexOf("프로그래밍");
		System.out.println(location);
		String substring = subject.substring(location);
		System.out.println(substring);

		location = subject.indexOf("자바");
		if(location != -1) {
			System.out.println("자바와 관련된 책이군요.");
		} else {
			System.out.println("자바와 관련 없는 책이군요.");
		}

		//----------------contains------------
		boolean result = subject.contains("자바");
		if(result) {
			System.out.println("자바와 관련된 책이군요.");
		} else {
			System.out.println("자바와 관련 없는 책이군요.");
		}
		//----------------split------------
		//,,, 처럼 공란은 빈칸처리하며 한행을 차지한다.
		String board = "1,자바 학습,참조 타입 String을 학습합니다.,홍길동";

		//문자열 분리
		String[] tokens = board.split(",");

		//인덱스별로 읽기
		System.out.println("번호: " + tokens[0]);
		System.out.println("제목: " + tokens[1]);
		System.out.println("내용: " + tokens[2]);
		System.out.println("성명: " + tokens[3]);
		System.out.println();
			
		//for 문을 이용한 읽기
		for(int i=0; i<tokens.length; i++) {
			System.out.println(tokens[i]);
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
