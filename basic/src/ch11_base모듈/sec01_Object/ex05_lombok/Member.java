package ch11_base모듈.sec01_Object.ex05_lombok;

import lombok.Value;

/**
 * 
 * @NoArgsConstructor -> 기본 생성자
 * @AllArgsConstructor -> 모든 필드 생성자
 * @RequiredArgsConstructor -> 필수 필드(final, @NonNull) 생성자
 * @ToString
 * @EqualsAndHashCode 
 * @Getter 
 * @Setter
 * @Data -> @RequiredArgsConstructor, @ToString, @EqualsAndHashCode, @Getter, @Setter
 * @Value -> @RequiredArgsConstructor, @ToString, @EqualsAndHashCode, @Getter
 * @Value는 모든 필드를 private final로 선언
 *
 */

@Value
public class Member {
	String id;
	String name;
	int age;
}