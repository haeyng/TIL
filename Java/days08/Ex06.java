package days08;
/**
 * @author 송해영
 * @date 2023. 7. 24.-오후 12:16:18
 * @subject 재귀함수 (recursive function)
 * @content 순환, 되풀이되는, 재귀하는
 * 					함수 안에서 자기 자신을 다시 호출하는 함수를 "재귀[호출]함수"라고 함
 */
public class Ex06 {

	public static void main(String[] args) {

		disp(); //함수 호출 부분
		
	}//main

	
	//재귀 함수
	private static void disp() {
		System.out.println(">disp() 호출 됨");
		
		disp();
		
	}
}//class