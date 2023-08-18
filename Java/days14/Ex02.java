package days14;

import days13.Point;

public class Ex02 {

	public static void main(String[] args) {
		
		//days13.Ex10.java
		//The constructor Point(int, int) is undefined : 생성자 선언이 안되어 있다.
		Point p1 = new Point (1,2); //객체 생성할때 필드 초기화, 따로 필드에 초기화하지 않고
		
		Point p2 = p1.plusPoint(p1);
		p2.dispXY();
		
		p2 = p1.plusPoint();
		p2.dispXY();
		
	}//main

}//class
