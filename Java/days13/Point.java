package days13;

public class Point { 

	//필드
	//인스턴스 변수
	public int x = 0;
	public int y = 0;

	public Point(int i, int j) { //매개변수 2개짜리 생성자 추가
		x = i;
		y = j;
	}

	public Point() {} //디폴트 생성자 추가 , 아무일을 하지 않아도 추가

	//메서드
	public void dispXY(){
		System.out.printf(">x=%d, y=%d\n",x,y);
	}


	//메서드 추가
	//리턴 자료형이 Point 클래스의 참조타입.
	public Point plusPoint(Point P) {

		//새로운 좌표객체를 생성해서 반환
		//The constructor Point() is undefined : 생성자가 없다
		Point p2 = new Point ();
		p2.x = P.x +10;
		p2.y = P.y +20;

		return p2;
	}
	//중복함수
	//오버로딩(overloading)
	//p1.plusPoint()   호출하는 객체p1
	public Point plusPoint() {
		// x, y 필드 누구꺼? p1  plusPoint() 메서드를 호출한 객체
		System.out.printf("> x=%d, y=%d\n", x,y);
		Point p2 = new Point();
		p2.x = x + 10;
		p2.y = y + 20;

		return p2;
	}


}//class
