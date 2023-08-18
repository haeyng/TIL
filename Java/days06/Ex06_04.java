package days06;

import java.util.Iterator;

public class Ex06_04 {

	public static void main(String[] args) {

		/*
		for (int i = 2; i <= 9; i++) {
			System.out.printf("  [%d]단\t",i);		
		} // for
		System.out.println();
		for (int i = 1; i <= 9; i++) {
			for (int dan = 2; dan <= 9; dan++) {
				System.out.printf("%d*%d=%02d\t ", dan , i , dan*i);				
			} // for
			System.out.println();		
	   }
	   */
		
		
		
		//------------------------------------------------------------------
		//[2][3][4][5]
		//[6][7][8][9]
		
		/*
		for (int i = 2; i <= 5; i++) {
			System.out.printf(" [%d]단\t", i);
		} // for
		System.out.println();
		for (int i = 1; i <= 9; i++) {
			for (int dan = 2; dan <= 5; dan++) {
				System.out.printf("%d*%d=%02d\t", dan,i,dan*i);
			} // for
			System.out.println();
		} // for
		
		System.out.println(); // 개행
		
		for (int i = 6; i <= 9; i++) {
			System.out.printf(" [%d]단\t", i);
		} // for
		System.out.println();
		for (int i = 1; i <= 9; i++) {
			for (int dan = 6; dan <= 9; dan++) {
				System.out.printf("%d*%d=%02d\t", dan,i,dan*i);
			} // for
			System.out.println();
		} // for
		*/
		
		
//		for (int k = 1; k <=2 ; k++) { 
//			for (int i = 4*k-2; i <= 4*k+1; i++) {
//				System.out.printf("  [%d]단\t", i);
//			} // for
//			System.out.println();
//			for (int i = 1; i <= 9; i++) {
//				for (int dan = 4*k-2; dan <= 4*k+1; dan++) {
//					System.out.printf("%d*%d=%02d\t", dan,i,dan*i);
//				} // for
//				System.out.println();
//			} // for			
//			System.out.println(); // 개행
//		} // for k
        //----------------------------------------------------------------
		
		
		//  k=1 [2]  [3][4]
		//  k=2 [5]  [6][7]
		//  k=3 [8]  [9][XXX10XXX]
		// 3*k-1
		
		/*
		if(A) {
			if(B) {
				 
			}//if B
		}//if A
		
		위 코딩과 아래 코딩이 같은 의미
		
		if(A && B) {
			
		}
		*/
		
		for (int k = 1; k <=3 ; k++) { 
			for (int dan = 3*k-1; dan <= 3*k+1 && dan != 10; dan++) { //3*k+1은 3*k-1에다가 2를 더해준것. 2더하면 4,7,9단 나오니까
				  //if( dan != 10)	
				  System.out.printf("  [%d]단\t", dan);
			} // for
			System.out.println();
			for (int i = 1; i <= 9; i++) {				
				for (int dan = 3*k-1; dan <= 3*k+1 && dan != 10; dan++) {					
				   //	if( dan != 10) 따로 if문을 안 주는게 좋은 코딩, for문에 &&연산자로 추가하는것이 좋음
					System.out.printf("%d*%d=%02d\t", dan,i,dan*i);
				} // for
				System.out.println();
				
			} // for			
			System.out.println(); // 개행
		} // for k
		
		
		
		
	}//main
}//class
