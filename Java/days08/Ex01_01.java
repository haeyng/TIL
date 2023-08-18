package days08;

import java.util.Scanner;
/**
 *@author 송해영
 *@date 2023. 7. 24.-오후 9:30:24
 *@subject 1) 0~100 사이의 점수를 키보드로 부터 입력 받아서 유효성 검사를 한 점수를 반환하는 함수 선언? 이어서~
 *@content
 */
public class Ex01_01 {

	public static void main(String[] args) {

		//try~catch문을 getScore함수가 아닌 main함수에 적용시켜서 
		//메인함수가 하나의 프로그램(스캐너)이 실행되면 메인함수가 종료될때까지 사용할수있게 해야함.
		//프로세스 종료할때까지 똑같은 스캐너를 사용할 수 있도록(공유할 수 있도록) 해준다.
		//프로세스 하나당 스캐너는 하나만 생성해서 공유하는게 맞음 
		//어딘가에서 system.in 닫아버리면 다른 스캐너를 생성해놓는다고 해도 같은 system.in이기 때문에 벌써 닫혀져 있기 때문에 읽기 작업이 안됨.
		
		try (Scanner scanner = new Scanner(System.in)){ //아래 try~catch문 스캐너 지우고 새로 작성해서 넣어줌
			
			int kor = getScore(scanner, "국어"); 
			int eng = getScore(scanner, "영어");
			int mat = getScore(scanner, "수학");
			// 스캐너를 매개변수로 받을 수 있도록 선언 ()에 scanner 넣어줌  
			//입력할때마다 어떤 정수를 입력하는지 잘 모르겠기 때문에 매개변수에 두번째 인자값 과목명을 붙여줌   , "영어" 과목명을 넣어줌
			
			System.out.printf("> 국어 : %d, 영어 : %d, 수학 : %d\n", kor, eng, mat);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
				
	}//main

	public static int getScore(Scanner scanner, String subject) { 
		// 스캐너를 매개변수로 받을 수 있도록 선언. (Scanner scanner)
		// 스캐너 넘겨주고 과목명 넘겨주고
		//String subject 추가. 위에 int kor = getScore(scanner, "국어"); 에서 각 과목명을 적었기 때문에
		
		int score = 0;
		boolean flag = false;
		String inputData; 
		String regex = "100|[1-9]?\\d";
		
		//여기에 있던 try catch문 삭제
				do { 
					if (flag) {
						System.out.println("점수 입력이 잘못 되었습니다. (0~100점 사이로 입력하세요.)");		
					} //if
					
					System.out.printf("%s 점수를 입력하세요 > ", subject);  //%s ,subject 추가
					inputData = scanner.next();
		
					flag = true;
				} while (! inputData.matches(regex));
			
				score = Integer.parseInt(inputData);
				System.out.println(score);
				
		return score;
	}
}//class