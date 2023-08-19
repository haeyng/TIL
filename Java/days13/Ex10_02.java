package days13;

public class Ex10_02 {

	public static void main(String[] args) {

		// 메서드의 리턴자료형이 참조형

		/*
		// 객체명.메서드명()		
		Ex10_02 ex = new Ex10_02();
		int hap = ex.sum(10, 20);
		System.out.println(hap);
		// 객체명.필드명;
		ex.num = 100;
		System.out.println( ex.num );
		 */

		Ex10_02 ex = new Ex10_02();
		Tv tv1 =  ex.moveTv();


	} // main

	public Tv moveTv() {
		return new Tv();
	}

	int num;

	// 메서드 선언( 리턴자료형이 기본형 int )
	public int sum(int a, int b) {
		int result = a + b;
		return result;
	}

}//class
