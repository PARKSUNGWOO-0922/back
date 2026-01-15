package ch14_컬렉션.ex11_Comparator;

import java.util.Comparator;
//Comparable을 구현하고 있지 않은 Fruit 객체를 TreeSet에 저장
//TreeSet을 생성할 때 비교자가 필요
//-> FruitComparator를 비교자로 사용해서 가격 기준으로 Fruit 객체 정렬
public class FruitComparator implements Comparator<Fruit> {
	@Override
	public int compare(Fruit o1, Fruit o2) {
		if(o1.price < o2.price) return -1;
		else if(o1.price == o2.price) return 0;
		else return 1;
	}
}