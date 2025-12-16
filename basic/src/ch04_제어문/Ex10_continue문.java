package ch04_제어문;
/**
 * break문
 * 	-제어문종료
 * continue(계속)문
 * 	-continue이후 문장은실행하지 않고
 * 	-for문은 증감식을 ,while 문의 경우 조건식을 이동하여
 * 	- 제어문을 계속 실행한다.
 */
public class Ex10_continue문 {

	public static void main(String[] args)throws Exception {
		for(int i=1; i<=10; i++) {
			if(i%2 != 0) {
				continue;
			}
			System.out.print(i + " ");
		}

	}

}
