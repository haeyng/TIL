package days13;

public class Ex01 {

	public static void main(String[] args) {
		
		
//				[01][02][03][04][10]
//				[05][06][07][08][26]
//				[09][10][11][12][42]
//				[13][14][15][16][58]
//				[28][32][36][40][136] 
		
		int [][] m = new int [5][5];
		fillM(m);
		dispM(m);

	}

	private static void dispM(int[][] m) {
		for (int i = 0; i < m.length; i++) { //행갯수
			for (int j = 0; j < m[i].length; j++) {//열갯수
				System.out.printf("[%02d]",m[i][j]);
			} // for
			System.out.println();
		} // for
		
	}

	private static void fillM(int[][] m) {
		for (int i = 0, n=1; i < m.length-1; i++) { //행갯수
			for (int j = 0; j < m[i].length-1; j++) {//열갯수
				m[i][j] = n++;
				m[i][4] += m[i][j];
				m[4][j] += m[i][j];
				m[4][4] += m[i][j];
			} // for
			System.out.println();
		} // for
		
	}

}
