package ch03_연산자;



/**
 *  산술연산자
 */
public class Ex01_산술연산자 {

	public static void main(String[] args) {
		//부호 연산
		System.out.println("부호연산 -----------------------");
		int x = -100;
		x = -x;
		
		byte b = 100;
		//byte y = -b; 연산시 int로 바뀌어서 byte에 대입이 안된다.
		int y = -b;
		
		System.out.println("x: " + x);
		System.out.println("y: " + y);
		
		//재할당 가능/재선언 안됨
		System.out.println("");
		System.out.println("증감연산 -----------------------");
		 x = 10;
		int y3 = 10;
		int z;
		
		x++;// 11
		++x;//12
		System.out.println("x=" + x);//12		

		System.out.println("-----------------------");	
		
		y3--;//9
		--y3;//8
		System.out.println("y3=" + y3);	//8	

		System.out.println("-----------------------");		
		z = x++;//12
		System.out.println("z=" + z);//12
		System.out.println("x=" + x);//13
		
		System.out.println("-----------------------");		
		z = ++x;//
		System.out.println("z=" + z);//14
		System.out.println("x=" + x);//14
		
		System.out.println("-----------------------");				
		z = ++x + y3++;
		System.out.println("z=" + z);//23
		System.out.println("x=" + x);//15
		System.out.println("y3=" + y3);//9
		
		System.out.println("");	
		System.out.println("산술연산-----------------------");	
		byte v1 = 10;
		byte v2 = 4;
		int v3 = 5;
		long v4 = 10L;
		
		int result1 = v1 + v2;			//모든 피연산자는 int 타입으로 자동 변환 후 연산
		System.out.println("result1: " + result1);//14
		
		long result2 = v1 + v2 - v4; 	//모든 피연산자는 long 타입으로 자동 변환 후 연산
		System.out.println("result2: " + result2);//4
		
		double result3 = (double) v1 / v2;	//double 타입으로 강제 변환 후 연산
		System.out.println("result3: " + result3);//2.5
		
		int result4 = v1 % v2;
		System.out.println("result4: " + result4);//2
		
		System.out.println("");	
		System.out.println("오버플로우/언더플로우-----------------------");
		//오버플로우
		byte var1 = 125;//byte : -128~127
		for(int i=0; i<5; i++) { //{ }를 5번 반복 실행
			var1++; //++ 연산은 var1의 값을 1 증가시킨다.
			System.out.println("var1: " + var1);
		}
		//언더플로우
		System.out.println("-----------------------");
		byte var2 = -125;
		for(int i=0; i<5; i++) { //{ }를 5번 반복 실행
			var2--; //-- 연산은 var2의 값을 1 감소시킨다.
			System.out.println("var2: " + var2);
			}
		//오버플로우
		int a = 1000000;
		int b2 = 1000000;
		int c =  a * b2;
		System.out.println(c);//-727379968
		
		//long 타입
		long a1 = 1000000;
		long b3 = 1000000;
		long c2 = a1 * b3;
		System.out.println(c2);//1000000000000
		
		System.out.println("");	
		System.out.println("정확한 계산을 위해 -> 정수 타입을 사용--------");	
		int apple = 1;
		double pieceUnit = 0.1;
		int number = 7;
		
		double result = apple - number*pieceUnit;
		//부동 소수점 바익을 사용하는 실수 타입에서는 결과값이 정확히 0.3이 되지 않는다.
		System.out.println("사과 1개에서 남은 양: " + result);//0.29999999999999993
		
		System.out.println("");	
		System.out.println("정확한 계산을 위해 -> 정수 타입을 사용2--------");	
		//int apple = 1;
		int totalPieces = apple * 10;
		//int number = 7;
		
		int result5 = totalPieces - number; 
		System.out.println("10조각에서 남은 조각: " + result5);
		System.out.println("사과 1개에서 남은 양: " + result5/10.0);
		
		System.out.println("");	
		System.out.println("InfinityAndNaN--------");
		int o = 5;
		double p = 0.0;
		double q = o / p;//Infinity
		//double q = o % p;//Nan
		
		//double z = x % y;
		
		//잘못된 코드
		System.out.println(q + 2);//Nan	
		
		//알맞은 코드
		//Double.isInfinite()
		//Infinite이면true Infinite아니면false
		//double.isNaN()
		//NaN이면true NaN아니면false
		if(Double.isInfinite(q) || Double.isNaN(q)) { 
			System.out.println("값 산출 불가"); 
		} else { 
			System.out.println(q + 2); 
		}
		
		
				
				
				
				
				
				
				
				
				
				

	}

}
