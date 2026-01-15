package ch15_람다식.ex02_1매개변수가없는경우;

public class Button {
	//정적 중첩 인터페이스
	@FunctionalInterface
	public static interface ClickListener {
		//추상 메소드
		void onClick();
	}
	
	//필드
	private ClickListener clickListener;
		
	//메소드
	public void setClickListener(ClickListener clickListener) {
		this.clickListener = clickListener;		
	}
	
	public void click() {
		this.clickListener.onClick();
	}
}