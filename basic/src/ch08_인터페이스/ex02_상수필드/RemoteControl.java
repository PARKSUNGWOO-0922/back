package ch08_인터페이스.ex02_상수필드;
/**
 * 상수 필드
 * 	- [public static final] 타입 상수명 = 값;
 * 	- [public static final] 생략가능, 인터페이스 변수는 무조건 상수	
 * 	- 모두 대문자 + 스네이크표기법(관례)
 */
public interface RemoteControl {
	int MAX_VOLUME = 10;
	int MIN_VOLUME = 0;
}