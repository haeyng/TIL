package days02;

/**
 *@author 송해영
 *@date 2023. 7. 14.-오후 11:06:55
 *@subject 주말 숙제 p83까지 코드 입력해보기
 *@content
 */
public class Ex01 {

	public static void main(String[] args) {

		System.out.println("main() 시작");
		otherMethod();
		System.out.println("main() 종료");

	} //main

	private static void otherMethod() {
		System.out.println("otherMethod() 시작");
		for (int i = 1; i <= 10; i++) {
			if (i==5) {
				return;
			}

		}
		System.out.println("otherMethod() 종료");

	}
}//class
