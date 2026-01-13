package ch08_인터페이스.ex04_디폴트메서드;
/**
 * 디폴트 메서드
 * 	- Java 8 이후에는 default 키워드를 써서 인터페이스 안에 구현을 넣을 수 있게 되었어요
 * 	- 실행부를 가진 메서드
 * 	- 실행부에는 상수 필드를 읽거나, 추상메서드를 호출하는 코드를 작성
 *  [public]default 리턴타입 메서드명([매개변수,...]{실행부}
 *  기본 기능 제공, 필요하면 재정의 가능
 */
public interface RemoteControl {
	//상수 필드
	int MAX_VOLUME = 10;
	int MIN_VOLUME = 0;

	//추상 메소드
	void turnOn();
	void turnOff();
	void setVolume(int volume);

	//디폴트 인스턴스 메소드
	default void setMute(boolean mute) {
		if(mute) {
			System.out.println("무음 처리합니다.");
			//추상 메소드 호출하면서 상수 필드 사용
			setVolume(MIN_VOLUME);
		} else {
			System.out.println("무음 해제합니다.");
		}
	}
}