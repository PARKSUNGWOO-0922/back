package ch09_중첩선언과익명객체.ex04_외부클래스멤버접근;
/**
 * 외부 클래스: class A
 * 내부 클래스: class B
 * 
 * 내부 클래스 안에서 외부클래스의 객체는 어떻게 접근하나?
 * 	 외부클래스명.this
 */


public class A2 {
	//A 인스턴스 필드
		String field = "A-field";
		
		//A 인스턴스 메소드
		void method() {
			System.out.println("A-method");
		}
		
		//인스턴스 멤버 클래스
		class B {
			//B 인스턴스 필드
			String field = "B-field";
		
			//B 인스턴스 메소드
			void method() {
				System.out.println("B-method");
			}
		
			//B 인스턴스 메소드
			void print() {
				//B 객체의 필드와 메소드 사용
				System.out.println(this.field);
				this.method();
		
				//A 객체의 필드와 메소드 사용
				System.out.println(A2.this.field);
				A2.this.method();
		}
	}	
		//A의 인스턴스 메소드
		void useB() {
			B b = new B();
			b.print();
		}
}