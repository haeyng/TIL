package days11;

/**
 * @author 송해영
 * @date 2023. 7. 27.-오후 3:11:20
 * @subject 다차원 배열
 * @content 1차원 배열, 2차원 배열, 3차원 배열
 * 					다차원배열은 배열의 배열이다.
 */
public class Ex06 {

	public static void main(String[] args) {
		
		//1) 1-3학년  1-10반   각 30명
		// 국어점수를 저장
		//3*10*30 =>900
		//int [] kor = new int [900]; //열
		//2학년 4반 15번 학생의 국어점수 입력 : 90
		//10*30 = 300     0~299 
		//10*30 = 300     300~599
		//10*30 = 300     
		
		//2학년 6반 국어 평균?
		
		//3차원 배열로 선언
		int [][][] kors = new int [3][10][30]; //면 행 열
		//2학년 4반 15번 학생의 국어점수 입력 : 90
		kors[1][3][14] = 90;
		//2학년 6반 국어 평균?
		// kors[1][5][0]~kors[1][5][29]
		
		
		
		
		
		
		
		
		
		
		
	}//main
}//class
