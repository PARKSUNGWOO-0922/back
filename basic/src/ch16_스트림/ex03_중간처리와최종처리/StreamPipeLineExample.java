package ch16_스트림.ex03_중간처리와최종처리;

import java.util.Arrays;
import java.util.List;
/**
 * 중간 처리와 최종 처리
 *  - 스트림은 하나 이상 연결될 수 있다.
 *  -> 컬렉션의 오리지널 스트림 뒤에 필터링 중간 스트림이 연결될 수 있고,
 *    그 뒤에 매핑 중간 스트림이 연결될 수 있다.
 *  - 스트림 파이프라인(pipelines)? 스트림이 연결되어 있는 것
 *  - 오리지널 스트림과 집계 처리 사이의 중간 스트림들은 최종 처리를 위해
 *  	1. 요소를 걸러내거나(필터링)
 *  	2. 요소를 변환시키거나(매핑)
 *  	3. 정렬하는 작업을 수행한다.
 *  - 최종 처리는 중간 처리에서 정제된 요소들을 
 *  	1. 반복하거나,
 *  	2. 집계(카운팅, 총합, 평균) 작업을 수행한다.
 *  
 *  - 스트림 파이프라인으로 구성할 때 주의할 점은 
 *    파이프라인의 맨 끝에는 반드시 최종 처리 부분이 있어야 한다
 *    -> 최종 처리가 없으면 오리지널 및 중간 처리 스트림은 동작하지 않는다.
 *  
 */
public class StreamPipeLineExample {
	public static void main(String[] args) {
		//asList 배열처럼 쓴 값들을 → List 로 바꿔주는 도구
		/*
			Arrays.asList()는
			“빠르게 테스트용 List를 만들기 위한 도구” : 즉 추가/삭제 불가능
			“Stream 예제에서 단골 손님”

			안쓰면 
			List<Student> list = new ArrayList<>();
			list.add(new Student("홍길동", 10));
			list.add(new Student("신용권", 20));
			list.add(new Student("유미선", 30)); 이렇게 복잡하고 길어짐.
		*/
		List<Student> list = Arrays.asList(
				new Student("홍길동", 10),
				new Student("신용권", 20),
				new Student("유미선", 30)
				);

		//방법1
		/*
 		Stream<Student> studentStream = list.stream();
 		//중간 처리(학생 객체를 점수로 매핑)
 		IntStream scoreStream = studentStream.mapToInt(student -> student.getScore());
		//최종 처리(평균 점수)
 		double avg = scoreStream.average().getAsDouble();
		*/

		//방법2
		double avg = list.stream()
				.mapToInt(student -> student.getScore())
				.average()
				.getAsDouble();
		
		System.out.println("평균 점수: " + avg);
	}
}