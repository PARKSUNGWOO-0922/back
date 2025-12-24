package ch07_상속.ex05_protected.pack2;

//A와C는 다른 패키지에 있으며, A클래스를 상속받지 않았다.
public class C {
	//메소드 선언
	public void method() {
		//A a = new A();		//사용불가능
		//a.field = "value"; 	//사용불가능
		//a.method(); 			//사용불가능
	}
}