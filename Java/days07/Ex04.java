package days07;

import java.util.Scanner;

public class Ex04 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
//		//Character
//		//한 문자를 대문자로 변환하는 매서드 : toUpperCase
//		System.out.println(Character.toUpperCase('y'));
//		System.out.println(Character.toUpperCase('Y'));
//		
//		//한 문자를 소문자로 변환하는 매서드 : toLowerCase
//		System.out.println(Character.toLowerCase('Y'));
//		System.out.println(Character.toLowerCase('Y'));
//
//		//String.toUpperCase()
//		System.out.println("aBc".toUpperCase());
//		System.out.println("aBc".toLowerCase());
		
		
		//[2]
		// 첫번째 선택 + 그외 (2,3,4,5,6..) 구분	
		/*
		String regex = "[1-3]";
		boolean flag = false;
		String inputData;
		int user;
		do {
			if (flag) {
				System.out.println("입력을 잘못했다. (1-3)");
			}//if
			System.out.print(">user 가위1 ,바위2, 보3 선택?");
			inputData = scanner.next();
			flag = true;
		} while (!inputData.matches(regex));
		
		user = Integer.parseInt(inputData);
		System.out.println(user);
		*/
		
		String regex = "[1-3]";
		boolean flag = false;
		int count;
		String inputData;
		int user;
		do {
			if (flag) {
				System.out.println("입력을 잘못했다. (1-3)");
			}//if
			System.out.print(">user 가위1 ,바위2, 보3 선택?");
			inputData = scanner.next();
			flag = true;
		} while (!inputData.matches(regex));
		
		user = Integer.parseInt(inputData);
		System.out.println(user);
		
	}

}
