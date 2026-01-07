package ch12.sec03.exam02;

import java.util.HashSet;
/**
 * Set은 동등 객체를 중복 저장하지 않는다.
 * 예)Hashset
 * hashcode()와 equals() 메서드를 이용해서 동등 객체인지 판단한다.
 */

public class HashSetExample {
	public static void main(String[] args) {
		HashSet hashSet = new HashSet();

		Student s1 = new Student(1, "홍길동");
		hashSet.add(s1);
		System.out.println("저장된 객체 수: " + hashSet.size());

		Student s2 = new Student(1, "홍길동");
		hashSet.add(s2);
		System.out.println("저장된 객체 수: " + hashSet.size());

		Student s3 = new Student(2, "홍길동");
		hashSet.add(s3);
		System.out.println("저장된 객체 수: " + hashSet.size());
	}
}