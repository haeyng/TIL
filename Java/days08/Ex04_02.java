package days08;

import java.lang.ref.Reference;

/**
 * @author 송해영
 * @date 2023. 7. 24.-오전 11:10:49
 * @subject 지역변수 개념
 * @content
 * 함수 호출할때 매개변수를 가지고
 * 1) call by name 함수 이름만 가지고 호출 하겠다는 뜻  drawLine(); 처럼 매개변수없이 
 * 2) call by value     참조타입의 매개변수를 가지고 호출하겠다는 뜻     sum(1,2)
 * 3) call by Reference
 * 4) call by point - c언어에서 사용
 */
public class Ex04_02 {

	public static void main(String[] args) {
		
		//main 함수 지역변수 x,y임
		//int x = 10, y = 20; 대신에 
		int [] m = {10,20};//이걸로 수정 //m[0] =10, m[1]=20
		
		//System.out.printf("> x=%d, y=%d\n", x, y);아래로 수정
		System.out.printf("> x=%d, y=%d\n", m[0], m[1]);

		/*
		int temp = x;
		x = y;
		y = temp;
		*/
		
		//swap(x,y)에서 swap (m)로 변경해줌
		swap(m); // 함수 호출부분 swap(10,20) 변수 안의 값을 가지고 호출됨 -> call by value라고 함 swap(10,20)와 같은 의미
		//지역변수 x,y 값을 받아옴 10 20
		//call by value 값을 넘기면 안되고 
		//call by Reference  .main 함수의 x,y를 참조할수있도록 변경해야됨
		//매개변수를 참조타입을 사용하겠다는 뜻 - 참조형에는 배열,클래스,인터페이스가 있다.
		
		//swap(m); 0x100 배열 시작주소를 넘긴다!
		
		System.out.printf("> x=%d, y=%d\n", m[0], m[1]);
		
	}//main
	// swap 함수 선언부분
								 //지역변수 int [] m = 0x00
	public static void swap(int [] m) { //swap 안에서만 사용되는 지역변수 x,y //위 x,y와 기억공간이 다름
										// int x =10는 위에서 받아옴 
		//swap 함수 x,y를 main 함수
		
		int temp = m[0];
		m[0] = m[1];
		m[1] = temp;
	
		
	}//main
}//class

