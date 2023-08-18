package days12;

/**
 *@author 송해영
 *@date 2023. 7. 30.-오전 9:33:48
 *@subject
 *@content
 * 값은 그대로 주되 공간을 찾거나, 공간은 그대로 두고 값을 맞춰서 집어넣는 방법 두가지
 */
public class Ex04 {

	public static void main(String[] args) {

		int [][] m = new int [5][5];
		
		//fillM(m);
		//fillM02(m);
		//fillM03(m);
		fillM04(m);
		
		magicSquare(m);
		
		dispM(m);
		
		
	}//main
	
	
	//마방진
	private static void magicSquare(int[][] m) {
		//1) 첫 번째 행의 가운데 열 = 1 설정
		//2-1) 출력값이 5의 배수라면 행만 증가
		//2-2) 5의 배수 아니면 행 감소, 열 증가 반복적으로 처리 
		//3)         ㄴ 행 -1 되면 가장 큰 행값으로 처리
		//4)         ㄴ 열  5 되면 가장 작은 열값으로 처리
	
		int n = 1;
		int row = 0, col = 2; //행, 열 인덱스값 저장할 변수. 2는 원래 5/2
		
		while (n<=25) {       
			//1~25까지 찍고 while문 나감 5행 5열   
			//조건을 (m.length*m[0].length)로 해도 되지만 돌때마다 연산이 되니까 이렇게 하려면 while문 밖으로 빼는게 나음 
			m[row][col] = n;
			dispM(m);

			try {
				Thread.sleep(500);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}// 0.5초 동안 쉬고 다음꺼 진행

			if (n%5==0) {
				row ++; 
			} else {
				row --; col ++;
				if (row==-1) row=4; //행이 5*5 범위를 벗어나면
				else if(col==5) col=0; //열이 5*5 범위를 벗어나면
			}//if
			n++;
		}//while

	}








	private static void fillM04(int[][] m) {
//				0 [01][02][03][04][05]
//				1 [10][09][08][07][06] 
//				2 [11][12][13][14][15]
//				3 [20][19][18][17][16]
//				4 [21][22][23][24][25]
			
		
			//두번째 방법
//			for (int i = 0; i < m.length; i++) {
//				for (int j = 0; j < m[i].length; j++) {
//					//if (i%2==0) m[i][j] = 5*i+j+1;
//					//else m[i][4-j] = 5*i+j+1;
//					m[i][i%2==0 ? j : 4-j] = 5*i+j+1;
//				} //for
//			} //for
			
		
			//첫번째 방법
//			for (int i = 0; i < m.length; i++) {
//				for (int j = 0; j < m[i].length; j++) {
//					//if (i%2==0) {m[i][j] = 5*i+j+1;
//					//}else m[i][j] = 5*(i+1)-j;
//					m[i][j]=i%2==0 ? 5*i+j+1 : 5*(i+1)-j;
//				} //for
//			} //for
		
	}

	private static void fillM03(int[][] m) {
//				[05][10][15][20][25]
//				[04][09][14][19][24]
//				[03][08][13][18][23]
//				[02][07][12][17][22]
//				[01][06][11][16][21]
//				i j
// 				00 40
//				01 30
//				02 20
// 				03 10
// 				04 00
// 				10 41
// 				11 31 
// 				12 21
//  			:
			//첫번째 방법
//			for (int i = 0; i < m.length; i++) {
//				for (int j = 0; j < m[i].length; j++) {
//					m[i][j]=5-i+5*j;
//				} //for
//			} //for
			
			//두번째 방법
//			for (int i = 0; i < m.length; i++) {
//				for (int j = 0; j < m[i].length; j++) {
//					m[4-j][i] =  5*i+j+1 ;
//				} // for
//			} // for
			
	}

	private static void fillM02(int[][] m) {
//				[25][24][23][22][21]
//				[20][19][18][17][16]
//				[15][14][13][12][11]
//				[10][09][08][07][06]
//				[05][04][03][02][01] 
		
			//첫번째 방법
		
		// 00    44
		// 01    43
		// 02    42
		// 03    41
		// 04    40
		// 10    34	
		// 4-i   4-j
		
//			for (int i = 0; i < m.length; i++) {
//				for (int j = 0; j < m[i].length; j++) {
//					 m[4-i][4-j]=5*i+j+1;
//				} //for
//			} //for
			//두번째 방법 n=25 선언
//			for (int i = 0, n =25; i < m.length; i++) {
//				for (int j = 0; j < m[i].length; j++) {
//					 m[i][j]=n--;
//				} //for
//			} //for
	}

	private static void fillM(int[][] m) {
//				[01][02][03][04][05]
//				[06][07][08][09][10]
//				[11][12][13][14][15]
//				[16][17][18][19][20]
//				[21][22][23][24][25]
//		for (int i = 0; i < m.length; i++) {
//			for (int j = 0; j < m[i].length; j++) {
//				m[i][j]= 5*i+j+1; //열크기*행(i)+열(j)+1
//			} //for
//		} //for 
		
	}

	private static void dispM(int[][] m) {
		System.out.println("\n\n\n\n");
		for (int i = 0; i < m.length; i++) {
			for (int j = 0; j < m[i].length; j++) {
				System.out.printf("[%02d]",m[i][j]);
			} //for
			System.out.println();
		} //for 
	}
}//class
