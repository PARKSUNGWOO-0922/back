package ch07_상속.ex06_타입변환;

class A {
}

class B extends A {
}

class C extends A {
}

class D extends B {
}

class E extends C {
}
/**
 * 타입 변환?
 * 	- 타입을 다른 타입으로 변환하는 것
 * 1.자동 타입(형) 변환(up casting)
 * 2.강제 타입(형) 변환(down casting)
 * 클래스 타입 변환
 * 	-상속 관계에 있는 클래스사이에 발생한다.
 * 		//자동 타입 변환
 * 		부모클래스타입 변수 = 자식클래스타입 객체;
 * 		//
 * 		
 */
public class PromotionExample {
	public static void main(String[] args) {
		B b = new B();
		C c = new C();
		D d = new D();
		E e = new E();
		
		//부모클래스타입 변수 = 자식클래스타입 객체;
		A a1 = b;
		A a2 = c;
		A a3 = d;
		A a4 = e;
		
		B b1 = d;
		C c1 = e;
		//Type mismatch: cannot convert from E to B
		//E는 C를 상속 받고, D는 B를 상속 받음
		// B b3 = e;
		//Type mismatch: cannot convert from D to C
		//C c2 = d;
	}
}