package ch11_base모듈.sec02_System;
/**
 * System Property?
 * 	- 자바 프로그램이 시작될 때 자동 설정되는 시스템의 속성을 말한다.
 *  - 예) 운영체제의 종류 및 사용자 정보, 자바 버전 등의 기본 사용 정보가 해당된다.
 *  
 * System.getProperty()
 *  - JVM의 시스템 프로퍼티(System Property)를 조회
 * System.getProperties()
 *  - JVM의 모든 시스템 프로퍼티(System Properties)를 한 번에 반환
 */
import java.util.Properties;
import java.util.Set;

public class Ex05_GetProperties메서드 {
	public static void main(String[] args) {
		//운영체제와 사용자 정보 출력
		String osName = System.getProperty("os.name");//운영체제 이름
		String userName = System.getProperty("user.name");//사용자 계정
		String userHome = System.getProperty("user.home");//사용자 홈 디렉토리
		System.out.println(osName);
		System.out.println(userName);
		System.out.println(userHome);

		//전체 키와 값을 출력
		System.out.println("---------------------------------");
		System.out.println(" key: value");
		System.out.println("---------------------------------");
		Properties props = System.getProperties();//JVM의 모든 시스템 프로퍼티(System Properties)를 한 번에 반환하는 메서드
		Set keys = props.keySet();
		//keys 에 들어있는 요소를 하나씩 꺼내서 objKey에 넣는다
		for(Object objKey : keys) { 
			String key = (String) objKey;
			String value = System.getProperty(key);
			System.out.printf("%-40s: %s\n", key, value);
		}
	}
}