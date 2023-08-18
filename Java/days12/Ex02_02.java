package days12;

import java.util.Iterator;
import java.util.Scanner;
/**
 *@author 송해영
 *@date 2023. 7. 30.-오전 5:43:16
 *@subject 다차원 배열은 배열의 배열이다.
 *@content
 */
public class Ex02_02 {

	public static void main(String[] args) {
		try (Scanner scanner = new Scanner(System.in)) {
			int [][] lottos;
			System.out.printf("로또 게임 횟수 입력하세요 > ");
			int gameNumber = scanner.nextInt();
			lottos = new int [gameNumber][6];

			for (int i = 0; i < lottos.length; i++) { //행갯수만큼 돌릴것임
				fillLotto(lottos[i]);
			} //for
			
			for (int i = 0; i < lottos.length; i++) {
				System.out.printf("[%d번째 게임]", i+1);
				dispLotto(lottos[i]);
			} //for
		} catch (Exception e) {
			e.printStackTrace();
		}

	}//main

	private static void dispLotto(int[] lotto) {
		for (int i = 0; i < lotto.length; i++) {
			System.out.printf("[%02d]", lotto[i]);
		} //for
		System.out.println();
	}

	private static void fillLotto(int[] lotto) {
		int index = 0;
		int lottoNumber = (int)(Math.random()*45)+1;
		lotto[index++] = lottoNumber;
		boolean flag = false;//로또 번호가 중복이 되면 true 할당
		
		while (index<=5) {
			flag = false;
			lottoNumber = (int)(Math.random()*45)+1;
			
			for (int i = 0; i < lotto.length; i++) {
				if (lotto[i]==lottoNumber) {
					flag = true;
					break;
				} //if
			} //for
			if(!flag) lotto[index++]=lottoNumber;
		}//while
		
	}


}//class
