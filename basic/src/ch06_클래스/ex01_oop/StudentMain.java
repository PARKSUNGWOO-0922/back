package ch06_클래스.ex01_oop;
/**
 * 클래스
 * 	-필드
 * 	-생성자
 * 	-메서드
 * 		(1)인스턴스 메서드:static가 없다.
 * 			-객체 생성후 객체를 통해서 사용!
 * 		(2)정적(static,클래스) 메서드:static가 있다.
 * 			-객체 생성 없이 클래스 이름을 메서드 사용!
 */
public class StudentMain {
	//main() 메서드
	public static void main(String[] args) {
		//객체 생성
		Student s1 = new Student();
		Student s2 = new Student();
		
		//출력
		System.out.println("s1변수가 Student 객체를 참조합니다.");
		System.out.println("s2변수가 Student 객체를 참조합니다.");

	}

}
