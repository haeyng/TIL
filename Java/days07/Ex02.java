package days07;

import java.util.Iterator;
import java.util.Scanner;

/**
 *@author 송해영
 *@date 2023. 7. 23.-오후 10:55:41
 *@subject 복습문제 풀이 2번
 *@content
 */
public class Ex02 {
	public static void main(String[] args) {
		
		//		2. 이등변 삼각형 출력
		//		   행의 갯수를 입력받아서 이등변 삼각형 출력.
		//		[입력형식]
		//			> 행의 갯수를 입력하세요 ? 5
		//		[출력형식]
		//			1 : ____*____       1행5열                         합6
		//			2 : ___***___       2행4,5,6열                   6,7,8
		//			3 : __*****__       3행3,4,5,6,7열             6,7,8,9,10
		//			4 : _*******_       4행2,3,4,5,6,7,8열        6,7,8,9,10,11,12
		//			5 : *********       5행1,2,3,4,5,6,7,8,9열   6,7,8,9,10,11,12,13,14
			
			try (Scanner scanner = new Scanner(System.in)) {
				System.out.print("이등변 삼각형 행의 갯수를 입력하세요 >");
				
				int row = scanner.nextInt();
//				행 열
//				1  1
//				2  3
//				3  5
//				4  7
//				5  9
//				2*행 -1 =열
				int col =row*2-1;
				for (int i = 1; i <= row; i++) {
					for (int j = 1; j <=col; j++) { //j<=row*2-1은 따로 빼서 변수로 저장 후 변수로 입력하는게 좋음
						if ( i+j>= row+1 && j-i <= row-1 ) {
							System.out.print("*");
						} else {
							System.out.print("_");
						} //if
					} //for
					System.out.println();
				} //for
				System.out.println(" end ");
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
			
//			*
//			**
//			***
//			****
			
			// String.repeat() 함수가 "" 문자열을 횟수만큼 반복한다.
			/*
			System.out.println( "*".repeat(1)  );
			System.out.println( "*".repeat(2)  );
			System.out.println( "*".repeat(3)  );
			System.out.println( "*".repeat(4)  );
			*/
			
			//위와 같은 코딩인데 for문을 돌려서 적용
			/*
			for (int i = 1; i <=4 ; i++) {
				System.out.println( "*".repeat(i)  );
			} // for
			*/
		
			
	}//main
}//class
