package days06;
/**
 *@author 송해영
 *@date 2023. 7. 23.-오후 7:30:25
 *@subject    구구단 출력하기 (중첩 for문)
 *@content
 */
public class Ex06 {
	public static void main(String[] args) {

				// [구구단]
				// 2단
				/*
				2*1=2
				2*2=2
				2*3=2
				2*4=2
				2*5=2
				2*6=2
				2*7=2
				2*8=2
				2*9=18
				*/
		
		
		// 중첩 for문
		for (int dan = 2; dan <=9; dan++) {
			System.out.printf("[%d단]\n",dan);
			for (int i = 1; i <=9; i++) {
				System.out.printf("%d*%d=%02d\n",dan,i,dan*i);
			} //for
		} //for dan
		
		
		
		System.out.printf("[%d단]\n", 2);
		for (int i = 1; i <=9; i++) {
			System.out.printf("%d*%d=%d\n",2, i, 2*i );
		} // for
		
		System.out.printf("[%d단]\n", 3);
		for (int i = 1; i <=9; i++) {
			System.out.printf("%d*%d=%d\n",3, i, 3*i );
		} // for


		System.out.printf("[%d단]\n", 4);
		for (int i = 1; i <=9; i++) {
			System.out.printf("%d*%d=%d\n",4, i, 4*i );
		} // for
		
		System.out.printf("[%d단]\n", 5);
		for (int i = 1; i <=9; i++) {
			System.out.printf("%d*%d=%d\n",5, i, 5*i );
		} // for
		System.out.printf("[%d단]\n", 6);
		for (int i = 1; i <=9; i++) {
			System.out.printf("%d*%d=%d\n",6, i, 6*i );
		} // for
		System.out.printf("[%d단]\n", 7);
		for (int i = 1; i <=9; i++) {
			System.out.printf("%d*%d=%d\n",7, i, 7*i );
		} // for
		System.out.printf("[%d단]\n", 8);
		for (int i = 1; i <=9; i++) {
			System.out.printf("%d*%d=%d\n",8, i, 8*i );
		} // for
		System.out.printf("[%d단]\n", 9);
		for (int i = 1; i <=9; i++) {
			System.out.printf("%d*%d=%d\n",9, i, 9*i );
		} // for
		
		
		
		
	}//main
}//class
