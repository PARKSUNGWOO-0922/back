package ch09_중첩선언과익명객체.ex06_중첩인터페이스;
/**
 * 중첩인터페이스
 * 	- 클래스의 멤버로 선언된 인터페이스
 * 	- 중첩인터페이스는 암시적으로 static이므로
 * 	  static를 생략해도 객체 생성 없이 사용할 수 있다.
 */
public class Button {	
	//정적 멤버 인터페이스
	//public [static] interface ClickListener {
		public static interface ClickListener {
		//추상 메소드
		void onClick();
	}
	
	//필드선언(인터페이스 타입으로)
	private ClickListener clickListener;
		
	//메소드(인터페이스 타입 매개변수 사용)
	public void setClickListener(ClickListener clickListener) {
		this.clickListener = clickListener;
	}
	
	public void click() {
		this.clickListener.onClick();
	}
}