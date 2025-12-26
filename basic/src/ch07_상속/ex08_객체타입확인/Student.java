package ch07_상속.ex08_객체타입확인;

public class Student extends Person {
	//필드 선언
	public int studentNo;

	//생성자 선언
	public Student(String name, int studentNo) {
		//부모 생성자 호출
		super(name);
		this.studentNo = studentNo;
	}

	//메소드 선언
	public void study() {
		System.out.println("공부를 합니다.");
	}
}