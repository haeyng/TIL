package days03;

import java.util.Scanner;

public class Ex03 {

	public static void main(String[] args) {
		
		//[입력형식] 이름 나이 국어 영어 수학 입력 ? 
		//[출력형식] "홍길동" 20살 10 20 30 60 20.00
		
		String name;
		int age, kor, eng, mat; //int로 
		double avg;
		short total;
		
		Scanner sc = new Scanner(System.in);
                       
		System.out.print("이름 나이 국어 영어 수학 입력 ?");
		
		name = sc.next();
		age = sc.nextInt(); // sc.nextInt();로 간단하게 작성
		kor = sc.nextInt();
		eng = sc.nextInt();
		mat = sc.nextInt(); 
		
		total = (short) (kor+eng+mat);
		avg = (double)total/3;
		
		System.out.printf("\"%s\" %d살 %d %d %d %.2f\n", name, age, kor, eng, mat,avg);
		
		sc.close();
		
	}//main

}//class
