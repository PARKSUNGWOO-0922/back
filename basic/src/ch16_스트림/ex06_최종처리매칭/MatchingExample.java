package ch16_스트림.ex06_최종처리매칭;

import java.util.Arrays;
/**
 * 요소 조건 만족 여부(매칭)
 *  - 매칭은 요소들이 특정 조건에 만족하는지 여부를 조사하는 최종 처리 기능이다.
 *  
 *  	1. boolean allMatch(): 모든 요소가 만족하는지 여부
 *  	2. boolean anyMatch(): 최소한 하나의 요소가 만족하는지 여부
 *  	3. boolean noneMatch(): 모든 요소가 만족하지 않는지 여부
 *  
 */
public class MatchingExample {
	public static void main(String[] args) {
		int[] intArr = { 2,3,4,5,6 };
		//Arrays 클래스에 있는
		//stream이라는 메서드를 사용해서
		//intArr 배열을 스트림으로 바꾼다
		//result는 중간 결과 ❌,전체 판단의 최종 결론만 담음
		boolean result = Arrays.stream(intArr)
				.peek(a -> System.out.println(a))// 궁금해서 임의추가한것임.
			.allMatch(a -> a%2==0);//“그 스트림에 들어 있는 모든 값이 이 조건을 만족하는지 검사해서
									//true 또는 false를 달라”
									//조건이 false가 되는 순간 즉시 종료
		System.out.println("모두 2의 배수인가? " + result);
		
		result = Arrays.stream(intArr)
			.anyMatch(a -> a%3==0);
		System.out.println("하나라도 3의 배수가 있는가? " + result);
		
		result = Arrays.stream(intArr)
			.noneMatch(a -> a%3==0);
		System.out.println("3의 배수가 없는가?  " + result);
	}
}
