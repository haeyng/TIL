package days16;

import java.io.InputStream;
import java.util.InputMismatchException;
import java.util.Scanner;
/**
 * @author 송해영
 * @date 2023. 8. 3. - 오후 4:29:11
 * @subject 멀티 catch문 설명
 * @content
 */
public class Ex14_02 {

	public static void main(String[] args) {

		int a = 0, b = 0;
		//double c;
		InputStream source = System.in;
		Scanner scanner = new Scanner(source);
		
		try {
			System.out.print("> a,b 두 정수 입력?");
			a = scanner.nextInt();
			b = scanner.nextInt();
			double c = a/b;		
			System.out.printf("%d/%d=%.2f\n", a, b, c);	
			System.out.println("=정상 종료=");
		}catch (InputMismatchException | ArithmeticException e) {
			System.out.println("[1]\n" + e.toString());
			System.out.println("[2]\n" + e.getMessage());
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			System.exit(-1);
		}
		
		
	}//main

}//class
