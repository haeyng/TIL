package days23;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Scanner;

import days10.Ex06_04;

/**
 * @author 송해영
 * @date 2023. 8. 14. - 오전 11:05:20
 * @subject
 * @content
 */
public class Ex02 {

	public static void main(String[] args) throws IOException {
		
//		3. 3반 30명 학생의 이,국,영,수,총,평,등,전등를 처리하는 코딩을 하세요.
//		  ( 조건 : 컬렉션 클래스 선택 후 사용 )
		
		ArrayList<Student> class1List = new ArrayList<>();
		ArrayList<Student> class2List = new ArrayList<>();
		ArrayList<Student> class3List = new ArrayList<>();
		
		ArrayList<ArrayList<Student>> sistList = new ArrayList<ArrayList<Student>>();
		sistList.add(class1List);
		sistList.add(class2List);
		sistList.add(class3List);
		
		char con = 'y';
		
		//학생수는 .size()로 가져올수있음 
		
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
			ArrayList<Student> classList = sistList.get(ban-1);

			System.out.printf("> %d반의 [%d]번 학생의 이름, 국어, 영어, 수학 점수를 입력 하세요.", ban, classList.size() + 1);

			int no = classList.size() +1;
			name = Ex06_04.getName();
			kor =  Ex06_04.getScore();
			eng = Ex06_04.getScore();
			mat = Ex06_04.getScore();
			
			tot = kor + eng + mat;
			avg = (double)tot/3;
			wrank = rank = 1;
				
			//학생정보
			Student s = new Student(no, name, kor, eng, mat, tot, avg, rank, wrank);
			classList.add(s); // 학생정보 추가
			
			//입력 계속? 
			System.out.print(">입력을 계속 하겠습니까? ");
			con = (char)System.in.read();
			System.in.skip(System.in.available());
			
		} while (Character.toUpperCase(con)=='Y');
		
		
		//출력
		/*
		 int totalStudents=0;
	       Iterator<ArrayList<Student>> ir = sistList.iterator();
	        while (ir.hasNext()) {
	             ArrayList<Student> classList = ir.next();          
	             totalStudents += classList.size();
	         } //while
	       System.out.printf("\t\t학생 정보 출력( %d명 )\n", totalStudents);
		*/
		System.out.println("-".repeat(10));
		//sistList.stream().mapToInt(classList->class1List.size()).forEach(학생수->System.out.println(학생수)); //각반의 학생수를 가지고 있는 int 형태의 stream 객체로 만듦
		
		//										메서드참조
		//sistList.stream().mapToInt(ArrayList::size).forEach(System.out::println);
		
		//reduce()로 해보기
		
		System.out.println("-".repeat(10));
		//						새로운 stream으로 변환
		
		Iterator<ArrayList<Student>> ir = sistList.iterator();
		ban = 1;
		while (ir.hasNext()) {
			//ArrayList<days23.Student> classList = (ArrayList<days23.Student>) ir.next();
			//                 삭제										다운캐스팅
			ArrayList<Student>classList = ir.next();
			System.out.printf("[%d반  학생 : %d명]\n", ban++, classList.size());
			
			
			
			/*
			[1반 학생 : 3명 ]
			1   혞졲댥   11   79   20   110   36.67   3   6
			2   끌꽕쳮   55   63   36   154   51.33   2   5
			3   쥗겢벐   61   85   69   215   71.67   1   3
			[2반 학생 : 2명 ]
			1   쉫웶뿫   93   69   35   197   65.67   2   4
			2   끐햖뼱   95   67   85   247   82.33   1   1
			[3반 학생 : 1명 ]
			1   쫃쫾믬   90   40   90   220   73.33   1   2
			*/
			Iterator<Student> ir2 = classList.iterator();
			while (ir2.hasNext()) {
				Student s = ir2.next();
				System.out.println(s); //s.toString();
			}
			
		}//while
		
		
		
		
	}//main

}//class
