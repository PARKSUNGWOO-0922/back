package ch14_컬렉션.ex04_HashSet;

import java.util.*;
/**
 * Set 컬렉션
 *  - 인덱스x -> 순서x, 중복x
 *  - HashSet, LinkedHashSet(순서o), TreeSet
 *  
 * 객체 추가
 * 	- boolean add(E e): 주어진 객체를 성공적으로 저장하면 true, 중복 객체면 false 반환
 * 객체 검색
 *  - boolean contains(Object o): 주어진 객체가 저장되어 있는지 여부
 *  - isEmpty(): 컬렉션이 비어 있는지 조사
 *  - Iterator<E> iterator(): 저장된 객체를 한 번씩 가져오는 반복자 리턴
 *  - int size(): 저장되어 있는 전체 객체 수 리턴
 * 객체 삭제
 *  - void clear(): 저장된 모든 객체 삭제
 *  - boolean remove(Object o): 주어진 객체 삭제
 * 
 * HeshSet
 *  - 동일 객체는 중복 저장하지 않는다.
 *  - 동일 객체란? 동등 객체를 말한다.
 *  -> 다른 객체라도 hashCode() 메서드의 리턴값이 같고, equals() 메서드가 true를 리턴하면
 *     동일한 객체라고 판단하고 중복 저장하지 않는다.
 *     
 * 객체 생성
 * 		Set<E> set = new HashSet<E>(); // E에 지정된 타입의 객체만 저장
 * 		Set<E> set = new HashSet<>();
 * 		Set set = new HashSet(); // 모든 타입의 객체 저장
 * 
 * 
 */
// 문자열을 HashSet에 저장할 경우, 같은 문자열을 갖는 String 객체는 동등한 객체로 간주한다.
// 같은 문자열이면 hashCode()의 리턴값이 같고, equals()의 리턴값이 true가 나오기 때문이다
public class HashSetExample1 {
	public static void main(String[] args) {
		//HashSet 컬렉션 생성
		Set<String> set = new HashSet<String>();
		
		//객체 저장
		set.add("Java");
		set.add("JDBC");
		set.add("Servlet/JSP");
		set.add("Java");			//<-- 중복 객체이므로 저장하지 않음
		set.add("iBATIS");
		
		//저장된 객체 수 출력
		int size = set.size();
		System.out.println("총 객체 수: " + size);
	}
}