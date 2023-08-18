package days12;
/**
 *@author 송해영
 *@date 2023. 7. 28.-오후 11:28:39
 *@subject
 *@content
 * 질문 - 2차원 배열 3*4에서 바로 2차원 배열 2*6도 가능한지
 */
public class Ex01_03 {

	public static void main(String[] args) {

		//순서대로 해보기
		//3*4 배열(m)을 -> 1차원(mone) -> 2*6 배열(n)로 변환 
		//int i = 4*행 + 열;
		//(4*행+열)/6  (4*행+열)%6

		int [][] m = {
				{1,2,3,4},
				{5,6,7,8},
				{9,10,11,12}
		};

		int [][] n = new int [2][6];

		int [] mone = new int [m.length*m[0].length];


		for (int i = 0; i < m.length; i++) {
			for (int j = 0; j < m[i].length; j++) {
				mone[i*m[0].length+j] = m[i][j];
			} //for
		} //for


		for (int i = 0; i < mone.length; i++) {
			n[i/6][i%6] = mone[i];
		} //for

		dispM(n);

		dispM(mone);


	}//main

	private static void dispM(int[] mone) {
		for (int i = 0; i < mone.length; i++) {
			System.out.printf("[%d]", mone[i]);
		} //for
		System.out.println();
	}


	private static void dispM(int[][] n) {
		for (int i = 0; i < n.length; i++) {
			for (int j = 0; j < n[0].length; j++) {
				System.out.printf("n[%d][%d]=%02d ",i,j,n[i][j]);
			} //for
			System.out.println();
		} //for
		
		
	}

}//class
