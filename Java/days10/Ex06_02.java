package days10;

import java.io.IOException;
import java.util.Scanner;
/**
 *@author 송해영
 *@date 2023. 7. 30.-오후 5:08:33
 *@subject-------------- 시험
 *@content
 */
public class Ex06_02 {

	public static void main(String[] args) throws IOException {
		
		String name;
		int kor, eng, mat;
		int tot;
		double avg;
		int rank;
		
		// 배열을 사용해서 선언
		final int STUDENT_COUNT = 30; 

		String [] names = new String[STUDENT_COUNT];
		int [] kors = new int[STUDENT_COUNT];
		int [] engs = new int[STUDENT_COUNT];
		int [] mats = new int[STUDENT_COUNT];
		int [] tots = new int[STUDENT_COUNT];
		double [] avgs = new double[STUDENT_COUNT];
		int [] ranks = new int[STUDENT_COUNT];

		Scanner scanner = new Scanner(System.in);
		int count = 0; //입력받은 학생수를 저장할 변수
		char con = 'y';
		
		do {
			System.out.printf(">이름, 국어, 영어, 수학 입력?");
			name = scanner.next();
			kor = scanner.nextInt();
			eng = scanner.nextInt();
			mat = scanner.nextInt();
			tot = kor + eng + mat;
			avg = (double)tot/3;
			
			rank = 1;
			
			names[0] = name;
			kors[0] = kor;
			engs[0] = eng;
			mats[0] = mat;
			tots[0] = tot;
			avgs[0] = avg;
			ranks[0] = rank;
			
			count++;
			
			//입력 계속? y
			
			System.out.print("> 학생 입력 계속?");
			con = (char)System.in.read();
			System.in.skip(System.in.available());
		} while (Character.toUpperCase(con)=='Y');
		
		// 등수처리
		procRank(tots, ranks, count);
		
		// 모든 학생 정보 출력.
		printStudentInfo(names, kors, engs, mats, tots, avgs, ranks, count);
		
	}//main

	private static void procRank(int[] tots, int[] ranks, int count) {
		for (int i = 0; i < count; i++) {
			ranks[i]=1;
			for (int j = 1; j < count; j++) {
				if (tots[i]<tots[j]) {
					ranks[i]++;
				} //if
			} //for
		} //for
	}

	private static void printStudentInfo(String[] names, int[] kors, int[] engs, int[] mats, int[] tots, double[] avgs,
			int[] ranks, int count) {
		// 1번 홍길동 89 93 38  ???  ??.?? 1등
		for (int i = 0; i < count; i++) {
			System.out.printf("%d번 %s %d %d %d %d %.2f %d등\n", i+1, names[i], kors[i], engs[i], mats[i], tots[i], avgs[i], ranks[i]);
		} //for
	}
}//class
