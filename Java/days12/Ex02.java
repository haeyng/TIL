package days12;

import java.util.Random;
import java.util.Scanner;
/**
 *@author 송해영
 *@date 2023. 7. 29.-오후 9:52:48
 *@subject
 *@content
 */
public class Ex02 {

	public static void main(String[] args) {
		try (Scanner scanner = new Scanner(System.in);) {
			
			//int [] lotto = new int [6];  하나의 로또 번호를 저장하는 1차원 배열 
			
			int [][] lottos; 
			//게임 횟수만큼 행갯수가 만들어져야되니까 2차원 배열
			//배열을 생성하지 않고 선언만 왜? 몇개의 로또를 출력할건지 게임 횟수를 입력받아서 생성하려고.
			
			System.out.print("로또 게임 횟수 입력하세요 > ");
			int gameNumber =  scanner.nextInt(); //3게임 한다고 가정 하고 배열 생성
			
			//배열 생성
			lottos = new int[gameNumber][6]; // 3행6열
			
			fillLottos(lottos);         //로또 번호를 채우는 함수
			
			dispLottos(lottos);      //로또 번호를 출력하는 함수 // 출력하는것 먼저
					
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}//main

	private static void dispLottos(int[][] lottos) {
		for (int i = 0; i < lottos.length; i++) {   //2차원 배열의 행갯수
			System.out.printf("[%d번째 게임] : ", i+1);
			for (int j = 0; j < lottos[i].length; j++) {  //2차원 배열의 열갯수
				System.out.printf("[%02d]",lottos[i][j]);
			} //for
			System.out.println();
		} //for
	}

	private static void fillLottos(int[][] lottos) {
		int index, n; // n은 랜덤하게 발생한 로또 번호
		for (int i = 0; i < lottos.length; i++) {//행갯수(게임횟수)만큼 로또 번호를 채우기 반복할것임
			//i가 게임횟수. 행에 해당함. int i = 0 는 로또 한 게임
			
			index = 0; //i가 0일때(한 게임) 첫번째 공간부터 채우는 
			//while문을 다 돌고 한 게임의 번호를 다 채우면 다시 0번째부터 채워야 하기 때문에 0으로 초기화해줌.
			
			Random rnd = new Random();  //랜덤 클래스 객체
			while (index<=5) { //채우는 작업을 반복할것 index 5번째 공간까지. 다 채우면 다시 위로 올라가 0번째 공간부터 채움
				n = rnd.nextInt(45)+1;   //0<=n<45 .... +1....  1~45까지의 랜덤한 숫자
				if (!isDuplicateLotto(lottos,i,n,index)) { //i번째 행(게임)에서만의 번호를 중복 체크 할거니까 i추가해줌
					//중복이 되면 true값 
					//중복이 되지 않는다면 저장으로.. if      false에 !을 붙이니까 true되서 입력.
					lottos[i][index++]=n; //중복이 되지 않으면 다음 행으로 이동
				} //if			
			}//while			
		} //for
	}

	private static boolean isDuplicateLotto(int[][] lottos, int i, int n, int index) {
		for (int j = 0; j < index; j++) { //index     열만큼 돌릴것
			if (lottos[i][j]==n)  return true; //중복되면 true값 가지고 가고 //return되지 않으면(중복되지 않으면) false값 가지고 감 
		} //for
		return false;
	}
}//class
