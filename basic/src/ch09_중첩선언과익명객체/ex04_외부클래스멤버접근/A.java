package ch09_중첩선언과익명객체.ex04_외부클래스멤버접근;
/**
 * 외부클래스:class A
 * 내부클래스:class B
 * 
 * 내부클래스에서 외부클래스 멤버를 어떻게 접근하나?
 * 	- 내부클래스가 인스턴스 멤버클래스일경우
 *     ->외부 클래스 멤버를 모두 접근가능
 *  - 내부클래스가 정적멤버 클래스 일경우
 *     ->외부 클래스의 정적 멤버만 접근 가능!
 */
public class A {
	//A의 인스턴스 필드와 메소드
	int field1;
	void method1() { }

	//A의 정적 필드와 메소드
	static int field2;
	static void method2() { }

	//인스턴스 멤버 클래스
	class B {
		void method() {
			//A의 인스턴스 필드와 메소드 사용
			field1 = 10;			//(o)
			method1();			  //(o)		
			//A의 정적 필드와 메소드 사용
			field2 = 10;			//(o)
			method2();			  //(o)
		}
	}

	//정적 멤버 클래스
	static class C {
		void method() {
			//A의 인스턴스 필드와 메소드 사용
			//field1 = 10;		//(x)
			//method1();			//(x)
			//A의 정적 필드와 메소드 사용
			field2 = 10;			//(o)
			method2();			  //(o)
		}
	}	
}