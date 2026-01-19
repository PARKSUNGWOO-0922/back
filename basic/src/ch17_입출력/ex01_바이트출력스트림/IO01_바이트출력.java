package ch17_입출력.ex01_바이트출력스트림;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
/**
 * 입출력 스트림
 *  - 데이터 입출력?
 *  	- 키보드를 통해 입력, 파일 또는 프로그램으로부터 입력
 *      - 모니터로 출력, 파일에 저장되거나 다른 프로그램으로 전송
 *  - 자바는 입력 스트림과 출력 스트림을 통해 데이터를 입출력한다.
 *  	- 프로그램을 기준으로 데이터가 들어오면 입력 스트림,
 *  	- 데이터가 나가면 출력 스트림이 된다.
 * 
 * 스트림(Stream)? 단방향으로 데이터가 흐르는 것
 * 	1. 바이트 스트림
 * 		- 그림, 멀티미디어, 문자 등 모든 종류의 데이터를 입출력할 때 사용
 * 		- InputStream, OutputStream
 * 		- XxxInputStream, XxxOutputStream
 *  2. 문자 스트림: 문자만 입출력할 때 사용
 *  	- Reader, Writer
 *  	- XxxReader, XxxWriter
 * 
 * 바이트 출력 스트림
 * 	- java.io.OutputStream
 * 		- FileOutputStream
 * 		- PrintStream
 * 		- BufferedOutputStream
 * 		- DataOutputStream
 * 
 *  - FileOutputStream 생성자는 주어진 파일을 생성할 수 없으면 IOException을 발생시킨다.
 *  - write(), flush(), close() 메서드도 IOException이 발생할 수 있다.
 * 
 * 	1. void write(int b): 1byte 출력
 *  2. void write(byte[] b): 매개값으로 주어진 배열 b의 모든 바이트 출력
 *  3. void write(byte[] b, int off, int len)
 *  	: 매개값으로 주어진 배열 b[off]부터 len개의 바이트 출력
 *  4. void flush(): 출력 버퍼에 잔류하는 모든 바이트 출력
 *  5. void close(): 출력 스트림을 닫고 사용 메모리 해제
 * 
 */
// 10, 20, 30이 저장된 바이트를 파일 C:/Temp/test1.db로 출력해서 저장
// 실행 전에 C:/Temp 디렉토리가 있어야 한다.
public class IO01_바이트출력 {
	public static void main(String[] args) {
		try {
			OutputStream os = new FileOutputStream("C:/sungwoo/git/back/basic/src/ch17_입출력/Temp/test1.db");
				
			byte a = 10;
			byte b = 20;
			byte c = 30;
			byte d = 40;
			//데이터 쓰기
			//	-저장된 파일(test1.txt)에 1바이트씩 차례로 출력
			//	-이때 저장되는 값은 문자가 아니라 숫자(Binary) 데이터이다
			os.write(a);
			os.write(b);
			os.write(c);
			os.write(d);
			//버퍼 비우기
			//	-출력 버퍼에 남아있을수 있는 잔류 데이터를 
			//	 강제로 모두 파일로 내보낸다.
			os.flush();
			//스트림 닫기
			//	-사용자 시스템 자원을 반납
			// 	- 닫지않으면
			os.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}