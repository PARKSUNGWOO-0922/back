package ch15_람다식.ex01_람다식이란;

// 함수형 인터페이스
//	- 추상 메서드 하나로 구성된 인터페이스
@FunctionalInterface
public interface Calculable {
	//추상 메소드
	void calculate(int x, int y);
}