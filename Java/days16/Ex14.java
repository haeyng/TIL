package days16;

import java.io.InputStream;
import java.util.InputMismatchException;
import java.util.Scanner;

public class Ex14 {

	public static void main(String[] args) {

		int a = 0, b = 0;
		//double c;
		InputStream source = System.in;
		Scanner scanner = new Scanner(source);
		
		//JVM 의 안에 예외처리기에 의해 
		//InputMismatchException 예외 객체 생성해서 돌려줌
		//개발자가 파악 후 예외 처리할수있음
		try {
			//예외가 발생할소지가 있는 코딩
			System.out.print("> a,b 두 정수 입력?");
			a = scanner.nextInt(); //특정 지역에서 예외가 발생하면 특정 지역 아래 코딩은 실행하지 않고 catch로 넘어간다
			b = scanner.nextInt();
			double c = a/b;
			
			System.out.printf("%d/%d=%.2f\n", a, b, c);	
			System.out.println("=정상 종료=");
			
			//다중 catch 문~
			//(주의사항) 부모 예외 클래스를 밑에 코딩한다.
			
			//JDK 1.7~ 멀티 catch 문
		} catch (InputMismatchException e) {
			System.out.println("> [알림] 정수만 입력 하세요.");
			//System.exit(-1); //프로그램 종료.
		}catch (ArithmeticException e) {
			System.out.println(">[알림] 0으로 나눌 수 없습니다.");
			//System.exit(-1);//프로그램 종료.
		}catch (Exception e) {//모든 예외의 최상위 부모는 Exception //매개변수 다형성 //catch문 여러개 쓸때는 부모의 예외객체는 맨밑에 쓴다. 위에 쓰면 오류남.
			e.printStackTrace();//예외를 추척해 print함
			//System.exit(-1);
		}finally {
			//예외가 발생 유무에 상관없이 처리할 구문
			System.exit(-1);
		}
		
		//c cannot be resolved to a variable
		//System.out.printf("%d/%d=%.2f\n", a, b, c);
		//System.out.println("=정상 종료=");
		
		
		
					/*
					String input = "1 fish 2 fish red fish blue fish";
					Scanner s = new Scanner(input).useDelimiter("\\s*fish\\s*");
				     System.out.println(s.nextInt());
				     System.out.println(s.nextInt());
				     System.out.println(s.next());
				     System.out.println(s.next());
				     s.close();
					*/
		
	}//main

}//class
