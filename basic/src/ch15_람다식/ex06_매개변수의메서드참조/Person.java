package ch15_람다식.ex06_매개변수의메서드참조;

public class Person {
	public void ordering(Comparable comparable) {
		String a = "홍길동";
		String b = "김길동";

		int result = comparable.compare(a, b);//"홍길동".compareToIgnoreCase("김길동")
		System.out.println( result );//자바 내부에서는 문자를 유니코드 값으로 비교해.

									//'홍' → 유니코드 값 54861
									
									//'김' → 유니코드 값 44338
		if(result < 0) {
			System.out.println(a + "은 " + b + "보다 앞에 옵니다.");
		} else if(result == 0) {
			System.out.println(a + "은 " + b + "과 같습니다.");
		} else {
			System.out.println(a + "은 " + b + "보다 뒤에 옵니다.");
		}
	}
}