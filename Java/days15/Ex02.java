package days15;
/**
 * @author 송해영
 * @date 2023. 8. 2. - 오전 11:14:56
 * @subject 클래스들 간의 관계
 * @content 1) has - a 관계
 * 				   2) is  -  a 관계(상속)
 */
public class Ex02 {

	public static void main(String[] args) {

		/*
		 * [상속 (inheritance)]
		 * 1. 상속이란 ? 기존의 존재하는 클래스를 재사용하여 새로운 클래스로 작성하는 것.
		 * 2. 상속의 장점
		 *     - 코드를 재사용하기 때문에 생산성이 향상되고 유지보수가 용이함
		 * 3. 상속(=상속기능이 구현된 클래스) 선언 형식
		 *     [접근지정자] [기타제어자] class 새클래스명 extends super 클래스 (기존클래스){
		 *     }
		 *     
		 * 4. 기존클래스 == [부모클래스], 상위클래스, [Super클래스], 기초클래스
		 * 
		 *  	새로운클래스 == [자식클래스], 하위클래스, [Sub클래스], 파생클래스
		 * 
		 * 5. 예) Point 클래스 : 좌표를 관리(구현)하는 기능이 구현된 클래스
		 * 
		 * 		2차원 x,y 좌표
		 * 		3차원 x,y,z 좌표
		 * */
		
	}//main

}//class

class Point2D{// 3347  필드, 메서드
	int x;
	int y;
	Point2D(){}
	Point2D(int x, int y){
	this.x=x;
	this.y=y;
	}
}

class Point3D extends Point2D{
	//int x; Point2D 에서 물려받음
	//int y;
	int z;
	Point3D(){}
	Point3D(int x, int y, int z){
		//this.x=x;
		//this.y=y;
		
		super(x,y); 
		//부모의 주소값을 참조하는 참조변수 
		//부모의 생성자 Point2D(int x, int y)를 호출하겠다는 의미 
		//반드시 첫번째 라인에 있어야함
		
		this.z=z;
	}	
}
