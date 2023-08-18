package days22;

import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Random;

/**
 * @author 송해영
 * @date 2023. 8. 11. - 오후 4:30:48
 * @subject 로또 게임
 * @content days08.Ex09_03.java
 */
public class Ex15 {

	public static void main(String[] args) {

		//HashSet lotto = new HashSet();
		LinkedHashSet lotto = new LinkedHashSet(); //순서 유지하고 중복체크하는 set 계열
		
		fillLotto(lotto);
		dispLotto(lotto);

	}//main

	public static void dispLotto(HashSet lotto) {
		Iterator ir= lotto.iterator();
		while (ir.hasNext()) {
			int n = (int) ir.next();
			System.out.printf("[%d]",n);
		}//while
		System.out.println();
	}

	public static void fillLotto(HashSet lotto) {
		Random rnd = new Random();
		while (lotto.size()<6) {
			int n = rnd.nextInt(45) + 1;
			lotto.add(n);
		}
	}

}//class
