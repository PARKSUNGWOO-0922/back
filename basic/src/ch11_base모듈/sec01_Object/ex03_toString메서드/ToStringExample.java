package ch11_base모듈.sec01_Object.ex03_toString메서드;

public class ToStringExample {
	public static void main(String[] args) {
		SmartPhone myPhone = new SmartPhone("삼성전자", "안드로이드");

		String strObj = myPhone.toString();
		//"전체클래스명@16진수해시코드"로 구성된 문자열을리턴한다.
		//java.lang.Object@372f7a8d
		System.out.println(strObj);
		//system.out.println()메서드는
		//매개값이 기본타입(byte,short,int,long,float,double,boolean)이거나 문자열일 경우 해당 값을 그대로 출력한다.
		//그러나 매개값이 객체이면 객체의 toString()메서드를호출한다
		//따라서 매개값이 객체이면 toString()메서드는 생략 가능
		//toString()메서드는 생략 가능
		System.out.println(myPhone);
	}
}