package days11;

import java.util.Arrays;
import java.util.Random;

public class Ex04 {

	public static void main(String[] args) {

		//문제) int [] m =  new int [30]      0~9임의의 정수 
		// 0 -3개
		// 1 -0개
		// :
		// 9 -4개
		
		//int [] m = new Random().ints(30,0,10).toArray(); //0부터 10보다 작은
		int [] m = {0, 3, 8, 5, 1, 7, 3, 8, 5, 6, 4, 1, 6, 3, 7, 5, 9, 1, 6, 0, 2, 2, 3, 3, 9, 0, 9, 5, 8, 7};
		System.out.println(Arrays.toString(m));
		
		// max=92   maxCount=3
		
		//i=0 j=0,1,2,3,4~ <m.length
		//i=1 j=0,1,2,3,4~ <m.length
		//i=2 j=0,1,2,3,4~ <m.length
		//:
		//i=9 j=0,1,2,3,4~ <m.length
		for (int i = 0; i <9; i++) {
			int count = 0;
			for (int j = 0; j < m.length; j++) {
				if (m[j]==i) count++;
			} // for
			System.out.printf("%d-%d개\n",i,count);
		} // for
		
		
		
		/*
		int count0 = 0;
		for (int i = 0; i < m.length; i++) {
			if( m[i] == 0 ) count0++;
		} // for
		System.out.printf("0 - %d\n", count0);
		
		int count1 = 0;
		for (int i = 0; i < m.length; i++) {
			if( m[i] == 1 ) count1++;
		} // for
		System.out.printf("1 - %d\n", count1);
		
		//:
		int count9 = 0;
		for (int i = 0; i < m.length; i++) {
			if( m[i] == 1 ) count9++;
		} // for
		System.out.printf("9 - %d\n", count9);	
		*/
		
		
		
	}//main

}//class
