package ch11_base모듈.sec08_reflection;
/**
 * 리플랙션(Reflection)
 *  - 자바는 클래스와 인터페이스의 메타 정보를 Class 객체로 관리한다.
 *  - 메타 정보란? 패키지 정보, 타입 정보, 멤버(생성자, 필드, 메서드) 정보 등을 말한다.
 *  - 리플랙션? 메타 정보를 프로그램에서 읽고 수정하는 행위
 *
 * java.lang.Class
 *  - 프로그램에서 Class 객체 얻기
 * 	1. 클래스로부터 얻는 방법
 * 		Class clazz = 클래스이름.class;
 * 		Class clazz = Class.forName("패키지...클래스이름");
 * 	2. 객체로부터 얻는 방법
 * 		Class clazz = 객체참조변수.getClass();
 *
 * 	패키지와 타입 정보 얻기
 * 		- Package getPackage(): 패키지 정보 읽기
 * 		- String getSimpleName(): 패키지를 제외한 타입 이름
 *  	- String getName(): 패키지를 포함한 전체 타입 이름
 *
 */
public class GetClassExample {
	public static void main(String[] args) throws Exception {
		//how1
		Class clazz = Car.class;//“Car 클래스에 대한 정보를 담은 Class 객체를,
								//Car 타입 전용으로 다룰 수 있게 clazz가 참조한다.”
		
		//how2
		//Class clazz = Class.forName("ch12.sec11.exam01.Car");
		
		//how3
		//Car car = new Car();
		//Class clazz = car.getClass();
		
		System.out.println("패키지: " + clazz.getPackage().getName());
		System.out.println("클래스 간단 이름: " + clazz.getSimpleName());
		System.out.println("클래스 전체 이름: " + clazz.getName());
	}
}