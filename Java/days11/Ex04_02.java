package days11;

import java.util.Arrays;
import java.util.Random;

public class Ex04_02 {

	public static void main(String[] args) {

		//문제) int [] m =  new int [30]      0~9임의의 정수 
		// 0 -3개
		// 1 -0개
		// :
		// 9 -4개
		
		
		int [] m = new int [30];
		int n ;
		//counts[0] = 0의 갯수
		//counts[1] = 1의 갯수
		//:
		//counts[9] = 9의 갯수
		int [] counts = new int[10]; // 0 초기화
		for (int i = 0; i < m.length; i++) {
			//m[i] = (int)(Math.random()*10);
			n = getRandomInt(0,9); //5
			m[i] = n;
			counts[n]++;
		} // for
		
	}//main
	
	//3~14
	//0~11     +3(min)
	
	
	public static int getRandomInt(int min, int max) {//원하는 두정수 사이의
		return (int)(Math.random()*(max-min+1)) +min;
	}

}//class
