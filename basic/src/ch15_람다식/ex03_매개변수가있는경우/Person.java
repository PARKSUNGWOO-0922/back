package ch15_람다식.ex03_매개변수가있는경우;

public class Person {
	public void action1(Workable workable) {
		workable.work("홍길동", "프로그래밍");
	}

	public void action2(Speakable speakable) {
		speakable.speak("안녕하세요");
	}
}