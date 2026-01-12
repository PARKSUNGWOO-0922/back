package ch12_제네릭.ex02_제네릭타입;
//“나는 ‘무언가(P)’를 빌려주는 기능을 정의한다.
//그런데 뭘 빌려줄지는 아직 정하지 않겠다.”
public interface Rentable<P> {
	P rent();
}
//제네릭을 사용하지 않을 경우
interface Rentable2 {
	//gitㅂㄱ사해
}