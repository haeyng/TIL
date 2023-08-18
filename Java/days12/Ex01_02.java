package days12;
/**
 *@author 송해영
 *@date 2023. 7. 28.-오후 10:55:37
 *@subject
 *@content
 */
public class Ex01_02 {

	public static void main(String[] args) {
		//3행 4열 2차원 배열 m 선언 1~12 배열 초기화
		// int [][] m = new int[][]{};
		
		int [][] m = {
				{1,2,3,4},
				{5,6,7,8},
				{9,10,11,12},
			};
		
		dispM(m);
		
		int [] n = new int [m.length * m[0].length]; //3*4 = 12
		
		//2차원 배열 값을 1차원 배열에 변환하기
		//00 -> 0
		//01 -> 1
		//02 -> 2
		//03 -> 3
		//10 -> 4
		//11 -> 5
		//12 -> 6
		//13 -> 7
		//20 -> 8
		//열갯수*행갯수+열갯수 = 1차원 배열의 인덱스 값
		//열갯수(4) * i + j = 인덱스 
		for (int i = 0; i < m.length; i++) {
			for (int j = 0; j < m[i].length; j++) {
				n[m[0].length*i+j]=m[i][j];
			} //for
		} //for
		
		dispM(n);
		
		
	}//main

	private static void dispM(int[] n) {
		for (int i = 0; i < n.length; i++) {
			System.out.printf("[%d]", n[i]);
		} //for
		System.out.println();
	}

	private static void dispM(int[][] m) {
		for (int i = 0; i < m.length; i++) {
			for (int j = 0; j < m[i].length; j++) {
				System.out.printf("[%02d]",m[i][j]);
			} //for
			System.out.println();
		} //for
		
	}
}//class
