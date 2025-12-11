package ch02_데이터와변수;

/**
 * Java 13버전 이후
 * 텍스트 블록 문법
 * 		큰 따옴표 3개로 감싸면 작성된 그대로 문자열로 저장된다.
 * 		형식:
 * 			Sting str = """내용""";
 * Java 14버전 이후
 * 		줄 바꿈을 하지 않ㄱ 다음 줄에 이어서 작성하고 싶다면?
 * 		끝에 \를 붙인다.
 */
public class Ex09_텍스트블록문법 {

	public static void main(String[] args) {
		String str1 = ""+"{\n" + "\t\"id\":\"winter\",\n" + "\t\"name\":\"눈송이\"\n"+"}";
		//""" 행바꾸어 { 지금모양 그대로 해야 에러발생안함.
		
		String str2 = """
				{
				"id":"winter",
				"name":"눈송이"
				}
	             """;
		
		System.out.println(str1);
		System.out.println("-------------------------");	
		System.out.println(str2);
		System.out.println("-------------------------");

		// 이어 작성하기 (\)
		String str3 = """
				나는 자바를 \
				학습합니다.
				나는 자바 고수가 될 것입니다.
				""";
		System.out.println(str3);


		}
		
	}
	   


