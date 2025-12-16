package ch05_;

public class Ex03_문자열 {

	public static void main(String[] args) {
		//----------------Equals------------------------
		//리터럴
		//String 변수 = "값";
		String strVar1 = "홍길동";
		String strVar2 = "홍길동";
		//번지(주소) 비교
		if(strVar1 == strVar2) {
			System.out.println("strVar1과 strVar2는 참조가 같음");
		} else {
			System.out.println("strVar1과 strVar2는 참조가 다름");
		}
		//값 비교
		if(strVar1.equals(strVar2)) {
			System.out.println("strVar1과 strVar2는 문자열이 같음");
		}
		//new 생성자
		//String 변수 = new 변수("문자열")
		String strVar3 = new String("홍길동");
		String strVar4 = new String("홍길동");

		if(strVar3 == strVar4) {
			System.out.println("strVar3과 strVar4는 참조가 같음");
		} else {
			System.out.println("strVar3과 strVar4는 참조가 다름");
		}

		if(strVar3.equals(strVar4)) {
			System.out.println("strVar3과 strVar4는 문자열이 같음");
		}
		//-----------EmptyString----------------------------
		//빈문자열도 string 객체로 생성이 된다.
		String hobby = "";
		if(hobby.equals("")) {
			System.out.println("hobby 변수가 참조하는 String 객체는 빈 문자열");
		}

	}

}
