package days12;

import java.io.IOException;
import java.util.Scanner;
import java.util.stream.IntStream;
import days10.Ex06_04;

public class Ex05 {

	public static void main(String[] args) throws IOException {

		final int STUDENT_COUNT = 30;
		final int CLASS_COUNT = 3;  //반 수
		//행 = 반 , 열 = 번호
		
		String [][] names = new String [CLASS_COUNT][STUDENT_COUNT];
		
		//3차원 배열의 열 : 0열(국어) 1열(영어) 2열(수학) 3열(총점) 4열(반등수) 5열(전교등수)
		int [][][] infos = new int [CLASS_COUNT][STUDENT_COUNT][6];
		
		double [][] avgs = new double [CLASS_COUNT][STUDENT_COUNT];
		
		char con = 'y';
		
		//입력받은 학생 수를 저장하는 변수
		int count1 = 0; //1반학생   counts[0]
		int count2 = 0; //2반학생   counts[1]
		int count3 = 0; //3반학생	  counts[2]
		
		int [] counts = new int [CLASS_COUNT];
		
		String name;
		int kor,eng,mat,tot,rank,wrank;
		double avg;
		
		Scanner scanner = new Scanner(System.in);
		
		int ban;
		
		do {
			//1. 반 입력?
			System.out.printf("> 반을 입력하세요. ");
			ban = scanner.nextInt();
			
			//2. 그 반의 학생 정보 입력
			System.out.printf("> %d반의 [%d]번 학생의 이름, 국어, 영어, 수학 점수를 입력 하세요.", ban, counts[ban-1]+1);

			name = Ex06_04.getName();
			kor =  Ex06_04.getScore();
			eng = Ex06_04.getScore();
			mat = Ex06_04.getScore();
			
			tot = kor + eng + mat;
			avg = (double)tot/3;
			wrank = rank = 1;
				
			names[ban-1][counts[ban-1]] = name;
			infos[ban-1][counts[ban-1]][0] = kor;
			infos[ban-1][counts[ban-1]][1] = eng;
			infos[ban-1][counts[ban-1]][2] = mat;
			infos[ban-1][counts[ban-1]][3] = tot;
			infos[ban-1][counts[ban-1]][4] = rank;
			infos[ban-1][counts[ban-1]][5] = wrank;
			avgs[ban-1][counts[ban-1]] = avg;

			
			counts[ban-1]++;
			//입력 계속? 
			System.out.print(">입력을 계속 하겠습니까? ");
			con = (char)System.in.read();
			System.in.skip(System.in.available());
			
		} while (Character.toUpperCase(con)=='Y');
		
		//등수처리
		for (int i = 0; i < counts.length; i++) {
			for (int j = 0; j < counts[i]; j++) {
				//infos[i][j][3]//총점
				infos[i][j][4]=1;//반등수
				infos[i][j][5]=1;//전교등수

				for (int i2 = 0; i2 < counts.length; i2++) {
					for (int j2 = 0; j2 < counts[i2]; j2++) {
						if(infos[i][j][3]<infos[i2][j2][3]){
							infos[i][j][5]++;
							if (i==i2) {//같은반
								infos[i][j][4]++;
							} //if
						}//if
					}//forj2
				}//for i2

			} // for j
		} // for i
				

		//학생 정보 출력 (전교생이 7명)
		//[1반 학생 : 4명]
		//1 이름 국어 영어 수학 총점 평균 반등수 전교등수
		//2
		//3
		//4
		//[2반 학생 : 2명]
		//1
		//2
		//[3반 학생 : 1명]
		//1

		int 총학생수 = IntStream.of(counts).sum();
		/*
				for (int i = 0; i < counts.length; i++) {
					총학생수 += counts[i];
				} // for
		 */
		System.out.printf("\t\t학생 정보 출력 (전교생이 %d명)\n", 총학생수);
		for (int i = 0; i < counts.length; i++) {
			System.out.printf("[%d반  학생 : %d명]\n", i+1, counts[i]);

			for (int j = 0; j < counts[i]; j++) {

				System.out.printf("%d\t%s\t%d\t%d\t%d\t%d\t%.2f\t %d\t%d\n", 
						j+1,
						names[i][j],
						infos[i][j][0],
						infos[i][j][1],
						infos[i][j][2],
						infos[i][j][3],	
						avgs[i][j],
						infos[i][j][4],
						infos[i][j][5]);
			} // for	
		}// for





	}//main


}//class
