package days12;
/**
 *@author 송해영
 *@date 2023. 7. 28.-오후 10:37:00
 *@subject 복습문제 4번 풀이
 *@content
 */
public class Ex01 {

	public static void main(String[] args) {
		
		/* - 선택정렬
		 int [] m = { 3,5,2,4,1 };
		 Arrays.sort(m);            // 오름차순 정렬 ASC
		 System.out.println( Arrays.toString( m ) );
		 */
		// sequentialSearch()		
		

			//4.아래 1차원 배열 m 의 값을 2차원 배열 n에 채워넣는 변환코딩을 하세요.
		
		  int [] m = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12  };
		  
		  dispM(m); //1차원 배열 출력하는 함수
		  
		  //     		행열    
		  //i=0		00     1
		  //i=1		01     2
  		  //i=2		10     3
		  //i=3		11     4
		  //i=4		20     5
		  //i=5		21     6
		  
		  //규칙 i/2 의 몫은 행값,  i%2 나머지는 열값  ------->  규칙 찾는 연습 중요
		  
		  //2차원 배열의 열갯수 : 2
		  
		  int [][] n = new int [6][2];
		  
		  for (int i = 0; i < m.length; i++) {
			  		n[i/2][i%2] = m[i];
		} //for
		 
		dispM(n);  //2차원 배열 출력하는 함수
		  
	}//main

	private static void dispM(int[][] n) {
		for (int i = 0; i < n.length; i++) {          // n.length 는 행갯수
			for (int j = 0; j < n[i].length; j++) {           //n[i].length 각 행마다의 열갯수
				System.out.printf("n[%d][%d]=%02d  ",i,j,n[i][j]);
			} //for
			System.out.println();
		} //for
		
	}

	private static void dispM(int[] m) {
		for (int i = 0; i < m.length; i++) {
			System.out.printf("m[%d]=%d\n", i , m[i]);
		} //for
		
	}
}//class
