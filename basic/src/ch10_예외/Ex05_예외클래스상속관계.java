package ch10_예외;

/**
 * 처리해야할 예외 클래스들의 상속 관계에 있을때
 * 상위 예외는 항상 하위 예외 뒤에 배치해야 함
 */
public class Ex05_예외클래스상속관계 {
	public static void main(String[] args) {
		String[] array = {"100", "1oo"};

		for(int i=0; i<=array.length; i++) {
			try {
				int value = Integer.parseInt(array[i]);
				System.out.println("array[" + i + "]: " + value);
			} catch(ArrayIndexOutOfBoundsException e) {
				System.out.println("배열 인덱스가 초과됨: " + e.getMessage());
			} catch(Exception e) {
				System.out.println("실행에 문제가 있습니다.");
			}
		}
	}
}

