package ch12_제네릭.ex02_제네릭타입;

public class GenericExample {
	public static void main(String[] args) {
		Box box1 = new Box();
		box1.content = "100";//문자열

		Box box2 = new Box();
		box2.content = "100";//문자열
		
		Box box3 = new Box();
		box3.content = 100;//숫자
		
		//Box의 내용 비교
		//->String에서 재정의된 equals() 사용
		boolean result1 = box1.compare(box2);
		System.out.println("result1: " + result1);

		boolean result2 = box1.compare(box3);
		System.out.println("result2: " + result2);
	}
}