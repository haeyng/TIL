package days08;
/**
 * @author 송해영
 * @date 2023. 7. 24.-오전 11:10:49
 * @subject 지역변수 개념
 * @content
 * 함수 호출할때 매개변수를 가지고
 * 1) call by name 함수 이름만 가지고 호출 하겠다는 뜻  drawLine(); 처럼 매개변수없이 
 * 2) call by value     
 * 3) call by Reference
 * 4) call by point - c언어에서 사용
 */
public class Ex04 {

	public static void main(String[] args) {
		
		//main 함수 지역변수 x,y임
		int x = 10, y = 20;
		System.out.printf("> x=%d, y=%d\n", x, y);

		/*
		int temp = x;
		x = y;
		y = temp;
		*/
		
		swap(x, y); // 함수 호출부분 swap(10,20) 변수 안의 값을 가지고 호출됨 -> call by value라고 함 swap(10,20)와 같은 의미
		//지역변수 x,y 값을 받아옴 10 20
		
		System.out.printf("> x=%d, y=%d\n", x, y);
		
	}//main
	// swap 함수 선언부분

	public static void swap(int x, int y) { //swap 안에서만 사용되는 지역변수 x,y //위 main 함수의 x,y와 기억공간이 다름!
										// int x =10은 위에서 받아옴 
		//swap 함수 x,y를 main 함수
		
		System.out.printf("> swap before x=%d, y=%d\n", x, y);
		int temp = x;
		x = y;
		y = temp;
		System.out.printf("> swap after x=%d, y=%d\n", x, y);
		
	}//main
}//class
