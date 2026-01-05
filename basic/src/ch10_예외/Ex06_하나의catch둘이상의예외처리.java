package ch10_예외;
/**
 * 두개 이상의 예외를 하나의 catch블록으로 동일하게 예외 처리
 * 	-catch 블록의 예외 클래스를 |로 연결한다.
 * 	
 */
public class Ex06_하나의catch둘이상의예외처리 {
	public static void main(String[] args) {
		String[] array = {"100", "1oo", null, "200"};
		System.out.println(array.length);
		for(int i=0; i<=array.length; i++) {
			try {
				int value = Integer.parseInt(array[i]);
				System.out.println("array[" + i + "]: " + value);
			} catch(ArrayIndexOutOfBoundsException e) {
				System.out.println("배열 인덱스가 초과됨: " + e.getMessage());
			} catch(NullPointerException | NumberFormatException e) {
				System.out.println("데이터에 문제가 있음: " + e.getMessage());
			}
		}
	}
}
