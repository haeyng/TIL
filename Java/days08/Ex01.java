package days08;

import java.util.Scanner;
/**
 *@author 송해영
 *@date 2023. 7. 24.-오후 8:25:17
 *@subject 복습문제 풀이 1)
 *@content
 */
public class Ex01 {
	public static void main(String[] args) {

		//1) 0~100 사이의 점수를 키보드로 부터 입력 받아서 유효성 검사를 한 점수를 반환하는 함수 선언?
	
		int kor = getScore(); // 키보드로 입력 받는 getScore 생성
		int eng = getScore();
		int mat = getScore();
		
		System.out.printf("> 국어 : %d, 영어 : %d, 수학 : %d\n", kor, eng, mat);
				
	}//main

	public static int getScore() { // 점수는 0~100을 반환하니까 int, 매개변수도 필요없음
		
		int score = 0;
		boolean flag = false;//다시 점수를 입력해야하는 경우 체크해야해서
		String inputData; //점수를 입력받을 변수
		String regex = "100|[1-9]?\\d";
		
		try (Scanner scanner = new Scanner(System.in)){
				do { //0~100점 입력이 잘못되면 반복되게
					
					if (flag) {
						System.out.println("점수 입력이 잘못 되었습니다. (0~100점 사이로 입력하세요.)");		
					} //if
					
					System.out.print("점수를 입력하세요 > "); //여기서 유효성 검사(잘못된 값을 입력하면 제대로 된 값을 입력할때까지 반복하게)
					inputData = scanner.next();
					
					//score = scanner.nextInt(); 
					//잘못된 값이 Int에 들어가지니까 문자 입력했다면 오류 발생 
					//0~100 사이 아니라면 들어가서 리턴되니까 유효성 검사를 해야함
					flag = true;
				} while (! inputData.matches(regex));//0~100 점수 입력 잘못되면 반복처리 // 일치되지 않으면 다시 반복작업 할것이라 ! 붙임
			
				score = Integer.parseInt(inputData);
				System.out.println(score);
				
		} catch (Exception e) {
			e.printStackTrace();
		}//catch
		
		
		return score;
	}
}//class



//1. 점수를 얻어올 함수를 만들어준다 int 과목이름 = getScore();
//2. getScore 함수 내 try catch문 생성후 입력 하라는 알림 메세지 작성
//3. score를 반환할거라 return score; 작성 하면 socre에 밑줄 생기는데 눌르면 자동으로 int score 초기화 =0 한다
//4. 유효성 검사 boolean형으로 flag변수 false를 잡음 
//5. do~while문 작성. 0~100점수 입력이 잘못되면 do while문을 반복처리 하도록 하려고
//6. do문에 점수를 입력받을 변수 inputData 초기화 후 scanner.next 입력받게 작성
//7. 입력 잘 됐는지 체크 할 String regex 정규표현식 선언 "100|[1-9]?\\d";
//8. 정규표현식과 inputData로 입력 받은 값이 매칭되는지 물어보고 일치하지 않는다면 !not을 붙여 반복작업할거니까
//    flag는 한번 입력받고 나면 true로 바꿔준다.
//9. if문
//10. flag라는 변수가 true라면 한번 입력받고 다시 왔다는 소리. 그때는 점수 잘못 입력되었다고 알려주는 작업
//11. do while문을 빠져나왔다는거는 입력을 제대로 했다는 말이니까 스캐너로 읽어 입력받은 값을 int로 변환하는 작업을 해줌, 출력.

//12. 결과 - 111을 입력하면 점수 입력이 잘못되었다는 메세지가 뜨고 다시 입력하라고 뜸
//13. 100을 입력하면 오류가 남 에러 잡아야 함 java.util.NoSuchElementException
//14. Ex01_01 확인
