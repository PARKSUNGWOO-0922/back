package ch07_상속.ex05_protected.pack1;
//A와B는 같은 패키지
public class B {
	//메소드 선언
	public void method() {
		A a = new A();		//사용가능
		a.field = "value"; 	//사용가능
		a.method(); 		//사용가능
	}
}