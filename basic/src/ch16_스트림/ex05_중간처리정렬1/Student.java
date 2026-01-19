package ch16_스트림.ex05_중간처리정렬1;
/**
 *  - 스트림의 요소가 객체일 경우 객체가 Comparable을 구현하고 있어야만 
 *    sorted() 메서드를 사용하여 정렬할 수 있다.
 *    그렇지 않으면 ClassCastException이 발생한다.
 *     
 */
public class Student implements Comparable<Student> {
	private String name;
	private int score;

	public Student(String name, int score) {
		this.name = name;
		this.score = score;
	}

	public String getName() { return name; }
	public int getScore() { return score; }

	@Override
	public int compareTo(Student o) {
		return Integer.compare(score, o.score);
	}
}