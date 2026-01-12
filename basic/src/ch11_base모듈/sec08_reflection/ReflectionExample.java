package ch11_base모듈.sec08_reflection;

import java.lang.reflect.*;
/**
 * java.lang.Class
 * 메서드는 Class 클래스의 멤버이며, 
 * 타입은 java.lang.reflect 패키지의 각 클래스에 해당한다.
 * 
 * 멤버 정보 얻기
 * 	- Constructor[] getDeclaredConstructors(): 생성자 정보 읽기
 *  - Field[] getDeclaredFields(): 필드 정보 읽기
 *  - Method[] getDeclaredMethods(): 메서드 정보 읽기
 *  
 * java.lang.reflect.Constructor
 *  - 클래스의 “생성자 자체”를 객체로 표현한 리플렉션 클래스
 *  - c.getName();// 클래스명
 *	- c.getParameterTypes();// 파라미터 타입
 * 
 * java.lang.reflect.Field
 *  - 클래스의 “필드(멤버 변수) 하나”를 객체로 표현한 리플렉션 클래스
 *  - f.getName();// 필드명
 *	- f.getType();// 타입
 *
 * java.lang.reflect.Method
 *  - 클래스의 “메서드 하나”를 객체로 표현한 리플렉션 클래스
 *  - m.getName();// 메서드명
 * 	- m.getParameterTypes();// 파라미터 타입
 *	
 */	
public class ReflectionExample {
	public static void main(String[] args) throws Exception {
		Class clazz = Car.class;
		
		System.out.println("[생성자 정보]");
		Constructor[] constructors = clazz.getDeclaredConstructors();
		for(Constructor constructor : constructors) {
			System.out.print(constructor.getName() + "(");
			Class[] parameters = constructor.getParameterTypes();
			printParameters(parameters);
			System.out.println(")");
		 	}
		System.out.println();
		
		System.out.println("[필드 정보]");
		Field[] fields = clazz.getDeclaredFields();
		for(Field field : fields) {
			System.out.println(field.getType().getName() + " " + field.getName());
		}
		System.out.println();
		
		System.out.println("[메소드 정보]");
		Method[] methods = clazz.getDeclaredMethods();
		for(Method method : methods) {
			System.out.print(method.getName() + "(");
			Class[] parameters = method.getParameterTypes();
			printParameters(parameters);
			System.out.println(")");
		}
	}
			
	private static void printParameters(Class[] parameters) {
		for(int i=0; i<parameters.length; i++) {
			System.out.print(parameters[i].getName());
			if(i<(parameters.length-1)) {
				System.out.print(",");
			}
		}
	}
}		