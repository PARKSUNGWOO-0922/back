package ch14_컬렉션.ex01_ArrayList;

import java.util.ArrayList;
import java.util.List;
/**
 * 컬렉션 프레임워크
 * 1. List 인터페이스
 *  	- 순서 유지, 중복 저장 가능
 *  	- 구현 클래스: ArrayList, Vector, LinkedList
 * 2. Set 인터페이스
 * 		- 순서x, 중복x
 *  	- 구현 클래스: HashSet, TreeSet
 * 3. Map 인터페이스
 * 		- 키와 값으로 구성된 엔트리 저장
 *  	- 키는 중복x
 *  	- 구현 클래스: HashMap, Hashtable, TreeMap, Properties
 * 
 * List 컬렉션
 * 객체 추가
 * 	1. boolean add(E e): 주어진 객체를 맨 끝에 추가
 *  2. void add(int index, E element): 주어진 인덱스에 객체를 추가
 *  3. set(int index, E element): 주어진 인덱스의 객체를 새로운 객체로 바꿈
 *  
 * 객체 검색
 *  1. boolean contains(Object o): 주어진 객체가 저장되어 있는지 여부
 *  2. E get(int index): 주어진 인덱스에 저장된 객체를 리턴
 *  3. isEmpty(): 컬렉션이 비어 있는지 조사
 *  4. int size(): 저장되어 있는 전체 객체 수를 리턴
 *  
 * 객체 삭제
 *  1. void clear(): 저장된 모든 객체를 삭제
 *  2. E remove(int index): 주어진 인덱스에 저장된 객체를 삭제
 *  3. boolean remove(Object o): 주어진 겍체를 삭제
 *  
 * ArrayList
 * 	- 일반 배열과 차이점은 제한 없이 객체를 추가할 수 있다. -> 동적 크기 조절
 *  - 객체 생성
 *  
 *  	List<E> 변수 = new ArrayList<E>(); -> E에 지정된 타입의 객체만 저장
 *		List<E> 변수 = new ArrayList<>();
 *		List 변수 = new ArrayList(); -> 모든 종류의 객체 저장
 *  
 *  - 객체 삭제
 *  	- 특정 인덱스의 객체를 제거하면 바로 뒤 인덱스부터 마지막 인덱스까지 모두 앞으로 1씩 당겨진다.
 *  - 객체 삽입
 *  	- 특정 인덱스에 객체를 삽입하면 해당 인덱스부터 마지막 인덱스까지 모두 1씩 밀려난다.
 *  -> 빈번한 객체 삭제와 삽입이 일어나는 곳에서는 ArrayList를 사용하는 것은 바람직하지 않다.
 * 
 */	
public class ArrayListExample {
	public static void main(String[] args) {
		//ArrayList 컬렉션 생성
		List<Board> list = new ArrayList< >();
		
//		  List<Board>: "나는 Board 객체들만 담는 명단(List)을 만들 거야!"라는 뜻입니다. (이걸 제네릭이라고 불러요.)
//		   new ArrayList<>(): "실제 물건은 유연하게 크기가 늘어나는 배열(ArrayList) 형태로 준비해 줘!"라는 명령입니다.
		 
		//객체 추가
		
//		  new Board(...)를 통해 게시글 객체를 하나 만들자마자 list라는 명단에 착착 쌓습니다. 
//		  현재 총 5개가 들어갔으니 인덱스는 0번부터 4번까지 생성됩니다.
		 
		list.add(new Board("제목1", "내용1", "글쓴이1"));
		list.add(new Board("제목2", "내용2", "글쓴이2"));
		list.add(new Board("제목3", "내용3", "글쓴이3"));
		list.add(new Board("제목4", "내용4", "글쓴이4"));
		list.add(new Board("제목5", "내용5", "글쓴이5"));

		//저장된 총 객체 수 얻기
		int size = list.size();
		System.out.println("총 객체 수: " + size);
		System.out.println();
				
		//특정 인덱스의 객체 가져오기
		Board board = list.get(2);
		System.out.println(board);//ch14_컬렉션.ex01_ArrayList.Board@72ea2f77
		/**
		 * 객체가 메모리 어디에 있는지 알려주는 집 주소 같은 거예요. 객체 자체를 찍으면 자바는 기본적으로 주소를 알려줍니다.
		 */
		System.out.println(board.getSubject() + "\t" + board.getContent() +
								"\t" + board.getWriter());
		System.out.println();
			
		//모든 객체를 하나씩 가져오기
		for(int i=0; i<list.size(); i++) {
			Board b = list.get(i);
			System.out.println(b.getSubject() + "\t" + b.getContent() +
								"\t" + b.getWriter());
		}
		System.out.println();
			
		//객체 삭제
		/**
		 *  list.remove(2); // (A)
			list.remove(2); // (B)
		 * 주의! 리스트는 중간에 누가 빠지면 뒤에 있는 애들이 앞으로 한 칸씩 당겨집니다.
			(A)를 실행하면 인덱스 2번(제목3)이 삭제되고, 3번(제목4)이 2번 자리가 됩니다.
			(B)를 실행하면 **새롭게 2번 자리가 된 '제목4'**가 삭제됩니다.
			결국 리스트에는 '제목1, 제목2, 제목5'만 남게 됩니다.
		 * 
		 */
		list.remove(2);
		list.remove(2);
			
		//향상된 for문으로 모든 객체를 하나씩 가져오기
		/**
		 * "리스트에 있는 거 처음부터 끝까지 다 꺼내서 b에 넣어줘!"라는 뜻입니다.
		 *  i를 써서 숫자를 셀 필요가 없어 훨씬 간결하고 세련된 방식이죠. 
		 *  JS의 for...of와 비슷하다고 보시면 됩니다
		 */
		for(Board b : list) {
			System.out.println(b.getSubject() + "\t" + b.getContent() +
								"\t" + b.getWriter());
		}
		/**
		 * 최종정리
		 * **ArrayList**는 순서가 중요한 줄 세우기 명단이다!
			**add()**로 넣고, **get()**으로 꺼내고, **remove()**로 지운다.
			중간이 비면 자동으로 당겨진다. (이게 배열과의 가장 큰 차이!)
		 */
	}
}