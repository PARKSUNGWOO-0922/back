package ch05_;
/**
 * null?
 * 	-참조 타입 변수가 아직 번지를 저장하고 있지 않다는 뜻
 * 	-참조 타입은 null 값을 가질수 있다. -> 참조하는 주소 값이 없다.
 * 
 * 예외( Exception)
 * 	-프로그램 실행 도중에 발생하는 오류
 * 
 * NullPointerException?
 * 	-변수가 null인 상태엣 객체으 데이터나 메서드를 사용하려 할 때 발생
 * 
 * JVM(자바 가상머신)이 쓰레기(Garbage)를 자동으로 처리한다.
 */
public class Ex02_null {
	
	public static void main(String[] args) {
		//-------------NullPointerException-----------------------------
				int[] intArray = null;
				//intArray[0] = 10; //NullPointerException

				String str = null;
				//length() -> 문자열의 개수
				//System.out.println("총 문자 수: " + str.length() );//NullPointerException
				
		//----------GarbageObject---------------------------------------
				String hobby = "여행";
				hobby = null; // "여행"에 해당하는 String 객체를 쓰레기(Garbage)로 만듦

				String kind1 = "자동차";
				String kind2 = kind1; // kind1 변수에 저장되어 있는 번지를 kind2 변수에 대입
				kind1 = null; // "자동차"에 해당하는 String 객체는 쓰레기가 아님
				System.out.println("kind2: " + kind2);

	}
	}


