package ch11_base모듈.sec02_System;
/**
 * 운영체제는 실행 중인 프로그램을 프로세스(process)로 관리한다.
 * 자바 프로그램을 시작하면 JVM 프로세스가 생성되고,
 * 이 프로세스가 main() 메서드를 호출한다.
 * 
 * System.exit()
 * 	- 프로세스 강제 종료
 *  - int 매개값은 종료 상태값으로 어떤 값을 주더라도 프로세스는 종료된다.
 *  - 상태값은 정상 종료일 경우 0, 비정상 종료는 1 또는 -1로 주는 것이 관례이다.
 * 
 * 		System.exit(int status)
 *  
 */
public class Ex03_exit메서드 {
	public static void main(String[] args) {
		for(int i=0; i<10; i++) {
			//i값 출력
			System.out.println(i);
			if(i == 5) {
				//JVM 프로세스 종료
				System.out.println("프로세스 강제 종료");
				System.exit(0);
			}
		}
	}
}