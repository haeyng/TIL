package days10;

import java.util.Scanner;

public class Ex06 {

	public static void main(String[] args) {
		//한 반에 30명의 학생
		//성적처리 (이름, 국어, 영어, 수학, 총점, 평균, 등수)
		//1. 학생정보 입력 받기
		//2. 총점,평균 계산
		//3. 등수
		//4. 학생정보 출력
		//5. 파일 저장 또는 DB 저장
		
		String name;
		int kor, eng, mat;
		int tot;
		double avg;
		int rank;
		
		final int STUDENT_COUNT = 30; //총 학생수를 상수로 선언

		String [] names = new String [STUDENT_COUNT];
		int [] kors = new int [STUDENT_COUNT];
		int [] engs = new int [STUDENT_COUNT]; 
		int [] mats = new int [STUDENT_COUNT];
		int [] tots = new int [STUDENT_COUNT];
		double [] avgs = new double [STUDENT_COUNT];
		int [] ranks = new int [STUDENT_COUNT];
				
		/*
		//The local variable names may not have been initialized
		//java.lang.NullPointerException
		names[0] = "홍길동";
		System.out.println(names[0]);
		*/
		
		Scanner scanner = new Scanner(System.in);
		int count = 0; //입력받은 학생수를 저장할 변수
		char con = 'y';
		
		System.out.printf(">이름, 국어, 영어, 수학 입력?");
		name = scanner.next();
		kor = scanner.nextInt();
		eng = scanner.nextInt();
		mat = scanner.nextInt();
		tot = kor + eng + mat;
		avg = (double)tot/3;
		rank = 1; //입력 후에 등수 한번만 체크
		
		names[0] = name;
		kors[0] = kor;
		engs[0] = eng;
		mats[0] = mat;
		tots[0] = tot;
		avgs[0] = avg;
		ranks[0] = rank;
		count++;
		
		//입력 계속? y
		
		System.out.printf(">이름, 국어, 영어, 수학 입력?");
		name = scanner.next();
		kor = scanner.nextInt();
		eng = scanner.nextInt();
		mat = scanner.nextInt();
		tot = kor + eng + mat;
		avg = (double)tot/3;
		rank = 1; //입력 후에 등수 한번만 체크
		
		names[1] = name;
		kors[1] = kor;
		engs[1] = eng;
		mats[1] = mat;
		tots[1] = tot;
		avgs[1] = avg;
		ranks[1] = rank;
		count++;
		

	}//main
}//class
