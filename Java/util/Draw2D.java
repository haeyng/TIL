package util;

//2D 그리기 작업을 할 수 있는 모든 기능들을 구현한 클래스
public class Draw2D {
	
	//[함수를 선언] 3가지
	//1) 기능 : 선 긋기 drawLine
	//2) 매개변수 : X
	//3) 리턴값(리턴자료형) : X    void
	public static void drawLine()
	{
		//구분선(100줄)
		System.out.println("--------------");
	}

	//Duplicate method drawLine() in type Ex08_02
	public static void drawLine(int n) //매개변수의 타입이 다르면 다른 함수로 인식함
	{
		//구분선(100줄)
		for (int i = 2; i < n; i++) {
			System.out.print("-");
		} // for
		System.out.println();
	}

	public static void drawLine(int n, char style) //매개변수의 타입이 다르면 다른 함수로 인식함
	{
		//구분선(100줄)
		for (int i = 2; i < n; i++) {
			System.out.print(style);
		} // for
		System.out.println();
	}

}
