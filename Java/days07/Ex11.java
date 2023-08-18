package days07;

public class Ex11 {

	public static void main(String[] args) {

		int x = 10;
		int y = 20;
		
		System.out.printf("> x=%d, y=%d\n", x, y);
		
		//두 기억 공간의 값을 바꾸기 ->
		swap(x,y);
		
		/*
		int temp = x;
		x = y;
		y = temp;
		*/		
		
	}//main

	private static void swap(int x, int y) {
		int temp = x;
		x = y;
		y = temp;
		System.out.printf("> x=%d, y=%d\n", x, y);	
	}
}//class
