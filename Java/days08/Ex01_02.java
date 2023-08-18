package days08;

import java.util.Scanner;

public class Ex01_02 {

	public static void main(String[] args) {
		
		//2) 점수를 매개변수로 받아서 수우미양가 문자를 반환하는 함수 선언
		//Ex01에 추가로 등급출력 2번 문제 답
		//국어 점수,등급을 출력하려고 함
		
		try (Scanner scanner = new Scanner(System.in)){
			
			int kor = getScore(scanner, "국어");  //()에 scanner 넣어줌 
			//국어 점수 등급을 출력하려고 함
			char grade = getGrade(kor); // 점수를 줘야되서 (kor)를 매개변수로     - 유효한지 체크할 필요없음 수우미양가만 찍으면됨
			System.out.printf("> kor =%d, grade = %c\n", kor, grade );
			
//			int eng =getScore(scanner, "영어");  // , "영어" 과목명을 넣어줌 
//			int mat =getScore(scanner, "수학");
			//System.out.printf("> kor = %d, eng = %d, mat = %d\n", kor, eng, mat);
			//프로세스 종료할때까지 같은 스캐너를 공유하도록 try문에 스캐너 해서 영역 안에 넣어줌
			
		} catch (Exception e) {
			e.printStackTrace();
		}//catch
		

	}//main
	
	
	private static char getGrade(int score) { //int kor를 score로 변경  //원하는대로 변경 가능 식별자이기 때문에
		char grade = '가';
		
		switch (score/10) {
		case 10: case 9:    grade = '수'; break;
		case 8:    grade = '우'; break;
		case 7:   grade = '미'; break;
		case 6:   grade = '양'; break;

		}//switch
		
		return grade; //grade를 리턴
	}

	
	
	
	
	public static int getScore(Scanner scanner,String subject) { //스캐너 넘겨주고 과목명 넘겨주고
		//매개변수 Scanner scanner 스캐너로 적용해줘야됨
		//String subject 추가. 위에 int kor = getScore(scanner, "국어"); 에서 각 과목명을 적었기 때문에
		
		int score = 0;
		boolean flag = false; //다시 점수를 입력해야하는 경우 체크
		String inputData;
		String regex = "100|[1-9]?\\d"; //1-9 한번 와도 되고 안와도 되고
		
		
		//여기에 있던 try~ scanner는 지워줌
			do {
				if (flag) { 
					System.out.println("점수 입력 잘못 되었습니다 (0~100점 사이로 입력)");
					
				}
				System.out.printf("> %s 점수를 입력하세요? ", subject); //여기서 유효성검사
				//score = scanner.nextInt();
				inputData =scanner.next();
				flag = true;
			} while (! inputData.matches(regex));  //0~100 점수 입력 잘못되면 반복처리 // 일치되지 않으면 다시 반복작업 할것이라 ! 붙임
			
			score = Integer.parseInt(inputData);
			
			
		return score;
	}//main
}//class
