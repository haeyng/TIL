package days11;

import java.util.Arrays;

public class Ex05 {

	public static void main(String[] args) {
		
		//버블정렬
		int [] m = {3,5,2,4,1};
		//bubbleSort(m);
				
		//선택정렬
		//selectionSort(m);
		selectionSort2(m);
		
		//삽입정렬
		//병합정렬

		//a>b 오름차순정렬(ascending) 12345	
		//b>a 내림차순정렬(decending) 54321
//		for (int i = 1; i <=4; i++) {
//			for (int j = 0; j <=4-i; j++) {
//				System.out.printf("%d-%d  ",j,j+1);
//				if (m[j]>m[j+1]) {  //<부등호 바꾸면 내림차순 , = 안붙이는게 좋은 코딩
//					System.out.print(" *** "); //
//					int temp = m[j];
//					m[j]=m[j+1];
//					m[j+1]=temp;
//				} //if
//				System.out.println(Arrays.toString(m));
//			} // for
//			System.out.println();
//		} // for
		
	}//main

	private static void selectionSort2(int[] m) { //----------시험
		//         minIndex
		//0  1  2  3  4   index
		//3  5  2  4  1   element 요소
		
		//i=0[선택]
		// 0>1  [0>2]  0>3  [0>4]
		//i=0 0-1 0-2 0-3 0-4  비교해서 앞이 크면 자리바꿈 [1] 5 3 4 2 1회전
		//i=1 1-2 1-3 1-4                                        [1] [2] 5 4 3	 2회전		
		//i=2 2-3 2-4                                      		   [1] [2] [3] 5 4  3회전
		//i=3 3-4                                                    [1][2][3][4] 5 4회전
		for (int i = 0; i < m.length-1; i++) { // 선택위치
			int minIndex = i;
			for (int j = i+1; j < m.length; j++) {
				 if(m[minIndex] > m[j]) minIndex = j;
			} // for
			
			int temp = m[i];
			m[i] = m[minIndex];
			m[minIndex] =temp;
			
			System.out.println( Arrays.toString(m));
			
		} // for
	}

	private static void selectionSort(int[] m) {
		//0  1  2  3  4   index
		//3  5  2  4  1   element 요소
		//1  5  2  4  3   element 요소
		//1  2  5  4  3   element 요소
		//1  2  3  4  5   element 요소
		//i=0 선택
		//			[선택]
		//i=0 0>1 [0>2] 0>3 [0>4]  비교해서 앞이 크면 자리바꿈 [1] 5   3  4  2   1회전
		//i=1 1-2 1-3 1-4                                       		      [1] [2] 5  4  3	 2회전		
		//i=2 2-3 2-4                                      				  [1] [2][3] 5 4    3회전
		//i=3 3-4                                                  			  [1][2][3][4] 5   4회전
		for (int i = 0; i <m.length-1; i++) {//선택위치
			int minIndex=i;
			for (int j = i+1; j <m.length; j++) {
				if(m[minIndex]>m[j]) minIndex = j;
			} // for
			
			int temp = m[i];
			m[i]=m[minIndex];
			m[minIndex]=temp;
			System.out.println(Arrays.toString(m));
		} // for
		
		
		
		/*
		for (int i = 0; i <m.length-1; i++) {
			for (int j = i+1; j <m.length; j++) {
				System.out.printf("%d-%d  ",i, j);
				if(m[i]>m[i]) {
					System.out.print( " *** ");
					int temp = m[i];
					m[i] =m[j];
					m[j]=temp;
				}
				System.out.println( Arrays.toString(m));
			} // for
		System.out.println();
		} // for
		*/
	}	
		
		
 static void bubbleSort(int[]m) {
		// i-i+1
		// 0-1 1-2 2-3 3-4                 1회전
		// 0-1 1-2 2-3                  	   2회전
		// 0-1 1-2                      	   3회전
		// 0-1                          	 	  4회전


		// 0  1  2  3                  		1회전
		// 0  1  2                     		2회전
		// 0  1                         		3회전
		// 0                                	4회전

		// **** 1   3
		// ***  2   2
		// **   3   1
		// *    4   0
		for (int i = 1; i <=4; i++) {
			for (int j = 0; j <=4-i; j++) {
				System.out.printf("%d-%d  ",j,j+1);
				if (m[j]>m[j+1]) { 
					System.out.print(" *** ");
					int temp = m[j];
					m[j]=m[j+1];
					m[j+1]=temp;
				} //if
				System.out.println(Arrays.toString(m));
			} // for
			System.out.println();
		} // for
		
	}

	
	
}//class
