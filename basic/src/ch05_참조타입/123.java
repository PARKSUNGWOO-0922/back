package ch05_참조타입;

public class Ex07_기타배열 {

	// args(arguments, 인자들)
	public static void main(String[] args) {
		// 배열 참조 객체
		// strArray = {null, null, null}
		String[] strArray = new String[3];
		
		// strArray = {"Java", "Java", "Java"}
		strArray[0] = "Java";
		strArray[1] = "Java";
		strArray[2] = new String("Java");

		System.out.println( strArray[0] == strArray[1] );		//true: 같은 객체 참조
		System.out.println( strArray[0] == strArray[2] );    	//false: 다른 객체를 참조
		System.out.println( strArray[0].equals(strArray[2]) );	//true: 문자열이 동일

		
		/*
		 * 배열 복사
		 * 1. 반복문으로 배열 복사
		 * 2. System.arraycopy(Object src, int srcPos, Object dest, int destPos, int length)
		 * 	  System.arraycopy(이전배열, 이전배열시작인덱스, 새배열, 새배열시작인덱스, 길이)
		 * 
		 */
		
		// 1. 반복문으로 배열 복사
		//길이 3인 배열 
		int[] oldIntArray = { 1, 2, 3 };
		//길이 5인 배열을 새로 생성
		// newIntArray = {0, 0, 0, 0, 0}
		int[] newIntArray = new int[5];
		//배열 항목 복사
		// newIntArray = {1, 2, 3, 0, 0}
//		newIntArray[1] = oldIntArray[0];
//		newIntArray[2] = oldIntArray[1];
//		newIntArray[3] = oldIntArray[2];
		
		for(int i=0; i<oldIntArray.length; i++) {
			newIntArray[i] = oldIntArray[i];
		}
		//배열 항목 출력
		for(int i=0; i<newIntArray.length; i++) {
			System.out.print(newIntArray[i] + ", ");
		}
		
		System.out.println();
		
		// 2. System.arraycopy()로 복사
		// 길이 3인 배열
		String[] oldStrArray = { "java", "array", "copy" };
		// 길이 5인 배열을 새로 생성
		// newStrArray = {null,null,null,null,null}
		String[] newStrArray = new String[5];
		// 배열 항목 복사
		// newStrArray = {null,"array", "copy",null,null}
		//System.arraycopy( oldStrArray, 1, newStrArray, 1, 2);
		// newStrArray = {"java", "array", "copy", null, null}
		System.arraycopy( oldStrArray, 0, newStrArray, 0, oldStrArray.length);
		
		// 배열 항목 출력
		for(int i=0; i<newStrArray.length; i++) {
			System.out.print(newStrArray[i] + ", ");
		}
		
		
		System.out.println();
		
		//배열 변수 선언과 배열 생성
		int[] scores = { 95, 71, 84, 93, 87 };
		//배열 항목 전체 합 구하기
		int sum = 0; 
		
		// 향상된 for 문
		// 배열의 항목 개수 만큼 반복한다.
		// for (타입 변수 : 배열) { ... }
		for (int score : scores) {
			sum += score;
		}
		System.out.println("점수 총합 = " + sum);
		//배열 항목 전체 평균 구하기
		double avg = (double) sum / scores.length;
		System.out.println("점수 평균 = " + avg);
		
		
		// public static void main(String[] args) {
		// Run메뉴 > Run Configurations...
		// -> Project와 Main class 확인 후
		// -> Program Arguments에 값 입력 후 Run
		if(args.length != 2) {
			System.out.println("프로그램 입력값이 부족");
			System.exit(0);
		}

		// "1", "2"
		String strNum1 = args[0];
		String strNum2 = args[1];
			
		// 1, 2
		int num1 = Integer.parseInt(strNum1);
		int num2 = Integer.parseInt(strNum2);

		int result = num1 + num2;
		System.out.println(num1 + " + " + num2 + " = " + result);

	}

}