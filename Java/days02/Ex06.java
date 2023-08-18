package days02;

/**
 *@author 송해영
 *@date 2023. 7. 16.-오후 6:09:03
 *@subject
 *@content
 */
public class Ex06 {

	public static void main(String[] args) {
			String name = "홍길동"; // %s
			int age = 20;              // %d
			final double PI = 3.14;  // %f - 자동으로 소수점 6자리까지 출력됨
			char grade = 'A';         // %c
			
			System.out.printf("이름 : %s, 나이 : %d, PI : %f, 등급 : %c\n", name, age, PI, grade);
	}

}
