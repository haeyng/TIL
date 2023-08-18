package days01;

import days13.Time;

public class Ex07_TimTest {

	public static void main(String[] args) {

		//days13.Time + days01.Ex07_TimeTest
		//패키지 외부, 내부X    :동일한 패키지가 아니다
		
		Time t = new Time();
		t.hour = 1; // public 패키지 외부, 내부 어디서든 접근 가능.
		//X    t.second // protected 패키지 내부 x 또는 상속관계 x
		//X    t.minut;   	default
		//X    t.milisecond
		
		
	}

}
