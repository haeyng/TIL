package days06;

import java.util.Arrays;
import java.util.Random;

/**
 *@author 송해영
 *@date 2023. 7. 23.-오후 12:40:09
 *@subject            Ex01_02 코딩 한 눈에 보이게 정리한 것
 *@content
 */
public class Ex01_021 {

	public static void main(String[] args) {
		int [] m = new int [10];
		for (int i = 0; i < m.length; i++) {
			m[i]= (int)(Math.random()*11)+5; 		
		} //for

		Random rnd = new Random(); 
		System.out.println(Arrays.toString(m));
		int max, min;
		max = min = m[0];
		for (int i = 1; i < m.length; i++) {
			if (max <m[i]) {
				max = m[i];
			} else if (min>m[i]){
				min = m[i];
			} //if
		} //for
		System.out.printf(max+"/" + min);	

		//출력값 
		//[6, 7, 5, 8, 14, 9, 13, 11, 7, 5]
		//		14/5

	}//main
}//class