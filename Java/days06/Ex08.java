package days06;
/**
 *@author 송해영
 *@date 2023. 7. 23.-오후 9:31:24
 *@subject
 *@content
 */
public class Ex08 {

	public static void main(String[] args) {
		// ****
		// ****
		// ****
		// ****
		/*
		System.out.println("****");
		System.out.println("****");
		System.out.println("****");
		System.out.println("****");
		 */
		// i=1  j=1,2,3,4 +개행
		// i=2  j=1,2,3,4 +개행
		// i=3  j=1,2,3,4 +개행
		// i=4  j=1,2,3,4 +개행
		
		for (int i = 1; i <= 4; i++) {     // 행 갯수
			// System.out.println("****");
			// * x 4 + 개행
			for (int j = 1; j <= 4; j++) { // 열(별) 갯수
				System.out.print("*");
			} // for
			System.out.println();
		} // for

	} // main

} // class