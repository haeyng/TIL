package days04;
/**
 *@author 송해영
 *@date 2023. 7. 22.-오후 6:27:01
 *@subject    배열 초기화
 *@content
 */
public class EX11 {
	public static void main(String[] args) {
		//1. 배열 정의 : 동일한 자료형을 메모리 상에 연속적으로 놓이게 한 것
		//2. 배열 선언 형식 : 자료형 배열명 = new 자료형 [크기];
		//3. 배열 크기     배열명.length    m.length == 5
		//4. 배열 초기화     배열에다가 값을 할당하겠다
		
		//int [] m = new int [5];
		// 배열은 초기화를 하지 않아도 그 자료형의 기본값으로 초기화가 되어져 있음
		// 확인하는 법 System.out.println(m[]); []에 0~4까지 넣어서 출력해보면 0만 나옴
		
// 		m[0] = 5;
//		m[1] = 3;
//		m[2] = 6;
//		m[3] = 2;
//		m[4] = 4;
		
		int [] m = {5,3,6,2,4}; //배열 초기화
		for (int i = 0; i < m.length; i++) {//m.length 배열 크기 5
			//System.out.println(i);    // 0 1 2 3 4
			//System.out.printf("m[%d]=%d\n", i , m[i]);
		} //for
		
		/*
		System.out.println( m[0]);
		System.out.println( m[1]);
		System.out.println( m[2]);
		System.out.println( m[3]);
		System.out.println( m[4]);
		*/
		
	}//main
}//class
