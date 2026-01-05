package ch09_중첩선언과익명객체.ex05_외부클래스객체접근;


public class Button {
	//정적 멤버 인터페이스
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
