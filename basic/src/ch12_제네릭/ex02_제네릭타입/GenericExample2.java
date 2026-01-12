package ch12_제네릭.ex02_제네릭타입;

public class GenericExample2 {
	public static void main(String[] args) {
		HomeAgency homeAgency = new HomeAgency();
		Home home = homeAgency.rent();
		home.turnOnLight();//전등을 켭니다.

		CarAgency carAgency = new CarAgency();
		Car2 car = carAgency.rent();
		car.run();//자동차가 달립니다.
	}
}