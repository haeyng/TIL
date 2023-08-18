package days05;
/**
 *@author 송해영
 *@date 2023. 7. 23.-오전 9:09:32
 *@subject   while문과 do~while문의 차이점
 *@content
 */
public class Ex07_02 {

	public static void main(String[] args) {
		
		//while문과 do while문의 차이점?
		//while문은 경우에 따라서 한번도 실행하지 않을 수 있음
		//do while문은 무조건 최소한 한번은 실행을 하고 조건식에 따라서 실행을 할지 안할지 결정된다
		
		
		//while문----------------------------------------------
		int i = 10;
		while (i < 2 ) { //i가 10이어서 거짓 {}한번도 실행 안함
			// A
		} // while
		//-----------------------------------------------------
		
		
		
		//do while문------------------------------------------
		do {     
			System.out.println("B");     //B
		} while ( i < 2 );     //while () 조건식이 참,거짓 여부에 상관없이 최소한 한번은 실행하고 반복할건지 물어볼때 사용함
		

	} // main
}//class

