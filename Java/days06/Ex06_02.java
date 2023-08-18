package days06;
/**
 *@author 송해영
 *@date 2023. 7. 23.-오후 7:30:25
 *@subject    구구단 출력하기 (while문 사용 변경)
 *@content
 */
public class Ex06_02 {
	public static void main(String[] args) {
		
		
		// [구구단] while문 사용 변경
		int dan =2;
		int i =1;
		while (dan<=9) {
			//i=1;
			System.out.printf("[%d단]\n",dan);
			i=1;
				while (i<=9) {//i가 10이 되어져 while문을 안돌게 됨 다시 i를 1로 만들어야 됨
					System.out.printf("%d*%d=%02d\n",dan,i,dan*i);
					i++; //
				}//while
			dan++;
			//i=1;
		}//while	

	}//main
}//class
