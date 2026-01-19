package ch17_입출력.ex02_바이트입력스트림;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
/**
 * 파일 복사
 *  - FileInputStream에서 읽은 바이트를 FileOutputStream으로 출력하는 것이다. 
 */
// 임의의 그림 파일을 하나 준비해 파일 이름을 test.png로 변경한 다음 C:/Temp 폴더에 저장한다.
public class 파일복사 {
	public static void main(String[] args) throws Exception {
		String originalFileName = "C:/sungwoo/git/back/basic/src/ch17_입출력/Temp/test.png";
		String targetFileName = "C:/sungwoo/git/back/basic/src/ch17_입출력/Temp/test2.png";
		
		InputStream is = new FileInputStream(originalFileName);
		OutputStream os = new FileOutputStream(targetFileName);
		//“전체 크기”가 아니라 “한 번에 옮기는 양”이다
		byte[] data = new byte[1024];
		while(true) {
			int num = is.read(data);//-1 => 파일 끝 (EOF) 리턴
			if(num == -1) break;
			//os.write(byte[] b, int off, int len); b:쓸 데이터가 들어있는 배열,off:시작 위치(인덱스),len:쓸갯수
			os.write(data, 0, num);
		}
		//자바9이후 입력스트림.transferTo(출력스트림)
		//is.transferTo(os);
		os.flush();
		os.close();
		is.close();
		
		System.out.println("복사가 잘 되었습니다.");
	}
}