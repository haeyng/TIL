package days07;

public class Ex01 {

	public static void main(String[] args) {
		
		//1. 구구단 가로 출력
		// for i= 2~9 단
		//   for j =1~9
		//i = 1 j = 1,2,3,4,~9
		//i=2 j=1,2,3,4~9
		//2*1 2*2 ~2*9
		
//		for (int dan = 2; dan <=9; dan++) {
//			for (int i = 1; i <= 9; i++) {
//				System.out.printf(" [%d단]\n",dan);
//			} // for
//				System.out.printf("%d*%d=%d",dan,i,dan*i);
//		} // for
		
		
		//2. 구구단 세로 출력
		// for i= 2~9 
		//   for j=1~9 단
		//i = 1 j = 1,2,3,4,~9
		//i=2 j=1,2,3,4~9
		//2*1 3*1 ~ 9*1
		
//		int i, dan = 0;
//		for (int i = 2; i <= 9; i++) {
//			for (int dan = 1; dan <= 9; dan++) {
//				System.out.printf("%d*%d=%d",dan, i , dan*i);
//			} // for
//			System.out.printf(["%d단]");
//		} // for
			
		
		//3.이등변 삼각형별찍기
		//1행 __*     i =1 j =2   j =1
		//2행 _***   i =2 j =1   j=3
		//3행 ***** i =3 j =0   j=5
		//                       공백   별
		//             i+j==3    j=3-i
		//                           2*i-1
		
//		for (int i = 1; i <=3; i++) { //행갯수
//			System.out.printf("%d : ", i);       ->라인번호 찍기
//			//공백 for
//			for (int j = 1; j < 3-i ; j++) {
//				System.out.print("_");
//			} // for
//			//별 for
//			for (int j = 1; j < 2*1-1; j++) {
//				System.out.print("*");
//			} // for
//			System.out.println();
//		} // for
		
		// 4.
		for (int i = 1; i <=3 ; i++) {
			for (int j = 1; j <= 5; j++) {
				if (i+j>=4 &&j-i <=2) System.out.print("*");
				 else System.out.print("_");

				}
			System.out.println();
			} // for
		

		// *
		// **
		// ***
		// ****
		/*
		for (int i = 1; i <=4; i++) {
			for (int j = 1; j <=4; j++) {
				//if( i >= j ) System.out.print("*");
				if( i <= j ) System.out.print("*");
				else System.out.print("_");
			}
			System.out.println();
		}
		*/
		
		// ___*
		// __**
		// _***
		// ****
		/*
		for (int i = 1; i <=4; i++) {
			for (int j = 1; j <=4; j++) { 
				if( i + j >= 5 ) System.out.print("*");
				else System.out.print("_");
			}
			System.out.println();
		}
		*/
		
		/*
		for (int i = 1; i <=5; i++) {
			for (int j = 1; j <=5; j++) {
				//if( i==j) System.out.print("*");
				//if( i+j==6) System.out.print("*");
				if( i+j==6  || i==j ) System.out.print("_");
				else System.out.print("*");
			} // for
			System.out.println();
		} // for
		*/
		
		}
}
