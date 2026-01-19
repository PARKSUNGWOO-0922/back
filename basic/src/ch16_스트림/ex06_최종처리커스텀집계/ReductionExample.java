package ch16_스트림.ex06_최종처리커스텀집계;

import java.util.Arrays;
import java.util.List;
/**
 * 요소 커스텀 집계
 * 	- 다양한 집계 결과물을 만들 수 있도록 reduce() 메서드 제공
 *  - reduce()는 스트림에 요소가 없을 경우 예외(NoSuchElementException)가 발생하지만,
 *    identity 매개값이 주어지면 이 값을 디폴트 값으로 리턴한다.
 *    
 *    int sum = stream
 *    	.reduce(0, (a, b) -> a+b);
 *     
 */
public class ReductionExample {
	public static void main(String[] args) {
		List<Student> studentList = Arrays.asList(
				new Student("홍길동", 92),
				new Student("신용권", 95),
				new Student("감자바", 88)
		);		
		//방법1
		int sum1 = studentList.stream()
				.mapToInt(Student :: getScore)
				.sum();		
		//방법2
		int sum2 = studentList.stream()
						.map(Student :: getScore)
						.reduce(0, (a, b) -> a+b);
		
		System.out.println("sum1: " + sum1);
		System.out.println("sum2: " + sum2);
	}
}