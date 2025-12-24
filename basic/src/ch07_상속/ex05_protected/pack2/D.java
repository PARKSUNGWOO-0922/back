package ch07_상속.ex05_protected.pack2;
//ctrl+shift+o 자동import
import ch07_상속.ex05_protected.pack1.A;
//A cannot be resolved to a type

//A와D는 다른 패키지에 있다.
//그러나, D는 A를 상속받음!
/**
 * protected 접근 제한자
 * 	-A와D는 상속받았으나, 
 * 	-new 연산자를 사용해서 생성자를 호출할수 없다.
 * 	-그래서 자식생성자에서 super()로 부모 생성자를 호출할수 있다.
 */
public class D extends A {
	//생성자 선언
	public D() {
		//A() 생성자 호출
		super();				//o
	}
	
	//메소드 선언
	public void method1() {
		//A 필드값 변경
		this.field = "value"; 	//o
		//A 메소드 호출
		this.method(); 			//o
	}
	
	//메소드 선언
	public void method2() {
		//A a = new A();		//x
		//a.field = "value"; 	//x
		//a.method(); 			//x
	}	
}