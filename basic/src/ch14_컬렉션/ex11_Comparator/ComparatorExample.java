package ch14_컬렉션.ex11_Comparator;

import java.util.TreeSet;
/**
 * java.util.Comparator 인터페이스
 *  - 비교 기능이 없는 Comparable 비구현 객체 저장
 * 
 *  	TreeSet<E> treeSet = new TreeSet<E>( new ComparatorImpl() );
 *  	TreeMap<K,V> treeMap = new TreeMap<K,V>( new ComparatorImpl() );
 *  
 *  	int compare(T o1, T o2)
 *  		: o1과 o2가 동등하다면 0, o1이 o2보다 앞에 오게 하려면 음수, 뒤에 오게 하려면 양수 리턴
 *  
 */

public class ComparatorExample {
	public static void main(String[] args) {
		//비교자를 제공한 TreeSet 컬렉션 생성
		TreeSet<Fruit> treeSet = new TreeSet<Fruit>(new FruitComparator());
			
		//객체 저장
		treeSet.add(new Fruit("포도", 3000));
		treeSet.add(new Fruit("수박", 10000));
		treeSet.add(new Fruit("딸기", 6000));
		
		//객체를 하나씩 가져오기
		for(Fruit fruit : treeSet) {
			System.out.println(fruit.name + ":" + fruit.price);
		}
	}
}