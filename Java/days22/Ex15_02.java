package days22;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Scanner;

/**
 * @author 송해영
 * @date 2023. 8. 11. - 오후 4:43:32
 * @subject 게임횟수를 입력받아 로또 번호를 출력
 * @content
 */

public class Ex15_02 {

	public static void main(String[] args) {

		/*게임횟수를 입력받아 로또 번호를 출력하는 코딩을 하세요 . 
           게임 횟수 입력 ? 3

      	출력형식
     	1게임 : [17][9][4][15][16][38]   LinkedHashSet lotto 
     	2게임 : [17][9][4][15][16][38]   LinkedHashSet lotto 
     	3게임 : [17][9][4][15][16][38]   LinkedHashSet lotto 
		 */
		
		int gameNumber = 1;
		Scanner scanner = new Scanner(System.in);
		System.out.print("> 게임 횟수를 입력하세요. ");
		gameNumber = scanner.nextInt(); //3번
		
		ArrayList lottos = new ArrayList();
		
		LinkedHashSet lotto = null; //for문 돌때마다 객체 생성되지 않도록 for문 밖으로
		for (int i = 0; i < gameNumber; i++) {
			lotto = new LinkedHashSet();
			Ex15.fillLotto(lotto);
			lottos.add(lotto);
		} //for
		
		
		//출력
		
		/* 게임 횟수도 같이 출력
		for (int i = 0; i < gameNumber; i++) {
			lotto = (LinkedHashSet) lottos.get(i);
			System.out.printf("%d게임 : ", i+1);
			Ex15.dispLotto(lotto);
		}//for
		 */
		
		//번호만 출력
		dispLottos(lottos);

	}//main

	private static void dispLottos(ArrayList lottos) {
		Iterator ir = lottos.iterator();
		while (ir.hasNext()) {
			LinkedHashSet lotto = (LinkedHashSet) ir.next();
			Ex15.dispLotto(lotto);
		}//while
	}
}//class
