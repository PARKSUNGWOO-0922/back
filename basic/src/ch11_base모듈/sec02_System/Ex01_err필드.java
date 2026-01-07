package ch11_base모듈.sec02_System;
/**
 * System 클래스의 err 필드
 * - 일반출력
 * 		System.out.println()
 * 		System.out.print()
 * 		System.out.printf()
 * - 콘솔(Console)에 에러출력
 * - 콘솔 종류에 딸 글자색이 빨간색을 출력된다.
 * 		System.err.println()
 */
public class Ex01_err필드 {

	public static void main(String[] args) {
		try {
			int value = Integer.parseInt("1oo");
		} catch(NumberFormatException e) {
			System.out.println("[에러 내용]");
			System.out.println(e.getMessage());
			System.err.println("[에러 내용]");
			System.err.println(e.getMessage());
		}
	}
}