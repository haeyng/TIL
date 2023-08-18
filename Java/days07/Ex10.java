package days07;

/**
 * @author 송해영
 * @date 2023. 7. 21.-오후 4:14:34
 * @sbject
 * @content
 */
public class Ex10 {

	public static void main(String[] args) {
		int a = 10;
		int b = 20;
		int c = 30;
		
		
		//두 정수의 합을 구해서 반환하는 
		// 1. sum() 함수 선언
		// 2. sum() 함수 호출
		//int c = a+b;
		
		// String br.readLine();
		// int  System.in.read();
		// double Math.random();
		
		int result = sum(a, b);
		
		System.out.printf("%d+%d=%d\n",a,b,c);
		
	}//main
	
	public static int sum(int a, int b) {
	return a + b; // return 뒤에는 수식;
	}
	
}//class
