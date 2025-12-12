package ch03_연산자;

/**
 *  비교 연산자의 종류
 *  
 *  1.비교 연산의 결과는 boolean 타입(true,false)이다.
 *  2.주로 제어문에 실행흐름을 제어할때 사용된다.
 */
public class Ex02_비교연산자 {

	public static void main(String[] args) {
		int num1 = 10;
		int num2 = 10;
		boolean result1 = (num1 == num2);
		boolean result2 = (num1 != num2);
		boolean result3 = (num1 <= num2);
		System.out.println("result1: " + result1);//true
		System.out.println("result2: " + result2);//false
		System.out.println("result3: " + result3);//true
			
		char char1 = 'A';
		char char2 = 'B';
		boolean result4 = (char1 < char2); //65 < 66
		System.out.println("result4: " + result4);//true
			
		int num3 = 1;
		double num4 = 1.0;
		//double 타입으로 변환후 비교
		boolean result5 = (num3 == num4);
		System.out.println("result5: " + result5);//true

		float num5 = 0.1f;
		double num6 = 0.1;
		boolean result6 = (num5 == num6);//false
		System.out.println();
		boolean result7 = (num5 == (float)num6);//true
		boolean result10 = ((double)num5 == num6);//false
		System.out.println("result6: " + result6);//false(float와double정밀도차이)
		System.out.println("result7: " + result7);//true
		System.out.println("result10: " + result10);//true

		String str1 = "자바";
		String str2 = "Java";
		
		//==은 str1에 할당된 주소를 비교
		//문자열1.equals(문자열2)는 변수에 할당된 주소를 찾아가서 실제 저장된 값을 비교
		//문자열 비교는.equals사용
		boolean result8 = (str1.equals(str2));
		boolean result9 = (! str1.equals(str2));
		System.out.println("result8: " + result8);//false
		System.out.println("result9: " + result9);//true
		
		String str3 = new String("Java");
		System.out.println(str2 == str3);//false 주소비교
		boolean result15 = (str2.equals(str3));
		System.out.println(result15);//true 실제저장된값비교
		
		
		

	}

}
