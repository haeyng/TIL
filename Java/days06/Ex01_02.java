package days06;

import java.util.Arrays;
import java.util.Random;

/**
 *@author 송해영
 *@date 2023. 7. 23.-오후 12:06:26
 *@subject
 *@content
 */
public class Ex01_02 {
	public static void main(String[] args) {
		
		// [문제] 10개 정수를 임의의 값(5~15)으로 저장하고 가장 큰 값을 찾기
		// [문제] 10개 정수를 임의의 값(0~10)+5으로 저장하고 가장 큰 값을 찾기
		
		/*배열을 사용하기		
		int [] m = new int [10];
		for (int i = 0; i < m.length; i++) {
			// 5 <= (int)(Math.random()*11)+5 < 16
			m[i]= (int)(Math.random()*11)+5; //10말고 11을 해야 함! 오른쪽은 < 연산이니까			
		} //for
		*/
		
		
		//자바에서 임의의 정수를 찾는 방법 두가지?
		//1. math클래스의 random
		//2. random 클래스
		
		
		//------------------------------------------------------------
		Random rnd = new Random(); 
		//자료형이 random이라고 하는 클래스, 랜덤한 값을 만들어주는 물건
		//seed는 디폴트값이 현재 시스템 날짜 시간 정보를 가지고 있음
		
		//rnd.nextInt(int bound) int bound에 자동적으로 입력한 값으로 범위가 정해짐, 위에 for문이랑 같은 코딩
		//0<=rnd.nextInt(100)<100
		//------------------------------------------------------------
		 	
		int [] m = new int [10];
		System.out.println(Arrays.toString(m));
		//m배열을 집어 넣으면 m배열의 각 요소가 출력된다. 확인하는 용도로 출력함
		// Arrays 배열을 다루기 쉽도록 기능이 구현된 클래스
		//배열을 문자열로 반환한다
		
		//int max =m [0];
		//int min = m [0];
		
		int max, min;
		max = min = m[0];
		for (int i = 1; i < m.length; i++) { //i = 1인 이유 0번째 공간은 max에 저장되어 있어서 1번부터 함
			if (max <m[i]) { //max(0번째 공간에 있는 값)보다 i가 1일때 가져온 값이 크다면 
				max = m[i];   //max는 새로운 m[i]로 대입되어 저장되어 바뀜
			} else if (min>m[i]){
				min = m[i];
			} //if
		} //for
		System.out.printf(max+"/" + min);	
		
	}//main
}//class
