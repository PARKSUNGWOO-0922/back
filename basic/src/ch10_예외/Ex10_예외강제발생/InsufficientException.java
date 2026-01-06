package ch10_예외.Ex10_예외강제발생;

// 사용자 정의 예외
/**
 * 사용자 정의 예외
 * 	- 일반 예외는 Exception의 자식 클래스로 선언하고,
 *  - 실행 예외는 RuntimeException의 자식 클래스로 선언한다.
 *  
 *  	public class XXXException extends [Exception | RuntimeException] {
 *  		public XXXException(){} // 기본 생성자
 *  		public XXXException(String message){ // 예외 메시지를 입력받는 생성자
 *  			super(message);
 *  		}  		
 *  	}
 *  
 */
public class InsufficientException extends Exception {
	public InsufficientException() {
	}

	public InsufficientException(String message) {
		super(message);
	}
}