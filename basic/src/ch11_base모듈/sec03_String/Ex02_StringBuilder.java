package ch11_base모듈.sec03_String;
/**
 * StringBuilder 클래스
 *  - String은 내부 문자열을 수정할 수 없다.(immutable, 불변)
 *  - 내부 버퍼(데이터를 저장하는 메모리)에 문자열을 저장해두고
 *    그 안에서 추가, 수정, 삭제 작업을 하도록 설계되어 있다.
 *  - toString() 메서드를 제외한 다른 메서드는 메서드 체이닝 패턴을 사용할 수 있다.(편리)
 *    그래서 제일 끝에 작성한다. 
 *    StringBuilder append("문자열"): 문자열을 끝에 추가
 *    StringBuilder insert(시작인덱스, "문자열"): 시작인덱스 위치에 문자열을  추가
 *    StringBuilder delete(시작인덱스, 끝인덱스): 시작인덱스 부터 끝인덱스 “직전”까지의 문자를 삭제한다.
 *    StringBuilder replace(시작인덱스, 끝인덱스, "문자열"): start 인덱스부터 end “직전”까지의 문자열을 삭제하고, 그 자리에 새로운 문자열을 끼워 넣는다.
 *    String toString(): 완성된 문자열 리턴
 *    
 */
public class Ex02_StringBuilder {
	public static void main(String[] args) {
		//메서드 체이닝 패턴 방식
		String data = new StringBuilder()
				.append("DEF")
				.insert(0, "ABC")
				.delete(3, 4)
				.toString();
		System.out.println(data);
		
		//메서드 체이닝 X
		StringBuilder sb = new StringBuilder();
		sb.append("LMN");
		sb.insert(0,"OPQ");
		sb.delete(3,4);
		String data2 = sb.toString();
		System.out.println(data2);
		
	}
}