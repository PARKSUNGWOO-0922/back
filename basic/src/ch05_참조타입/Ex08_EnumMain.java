package ch05_참조타입;

//java.lang 패키지 -> 기본 패키지 -> import 없이 사용
//ctrl+shift+o:자동 임포
import java.util.Calendar;

public class Ex08_EnumMain {

	public static void main(String[] args) {
		//Week 열거 타입 변수 선언
		// 참조타입 변수 = null;
		Week today = null;
 
		//Calendar 얻기
		//클래스명   변수명   =   객체(참조)
		//추상 클래스 타입이고, getInstance()로 구현 객체를 받아옵니다.
		//추상 클래스이므로 직접 생성 불가 → getInstance() 사용
		//교재chapter10라이브러이와....
		Calendar cal = Calendar.getInstance();
		
		//오늘의 요일 얻기(1~7)
		int week = cal.get(Calendar.DAY_OF_WEEK);//요일,시간필드상수로 대문자로사용

		//숫자를 열거 상수로 변환해서 변수에 대입
		switch(week) {
			case 1: today = Week.SUNDAY ; break;
			case 2: today = Week.MONDAY ; break;
			case 3: today = Week.TUESDAY ; break;
			case 4: today = Week.WEDNESDAY ; break;
			case 5: today = Week.THURSDAY ; break;
			case 6: today = Week.FRIDAY ; break;
			case 7: today = Week.SATURDAY ; break;
		}
		
		//열거 타입 변수를 사용
		if(today == Week.SUNDAY) {
			System.out.println("일요일에는 축구를 합니다.");
		} else {
			System.out.println("열심히 자바를 공부합니다.");
		}

	}

}
