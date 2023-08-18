package days07;

import java.util.Scanner;

public class Ex04_02 {

	public static void main(String[] args) {
		
		Scanner scanner = new Scanner(System.in);
		
		String inputData;
		String regex = "[1-3]";
		boolean flag = false;
		int failureNumber=0;//실패횟수 저장 변수 선언
		int user;
		
		do {
			if (flag) {
				failureNumber++;
				System.out.printf(">[알림 (%d)] 입력을 잘못했다. (1-3)\n",failureNumber);
				if (failureNumber==5) {
					System.out.println("\t [5번] 실패했기에 프로그램 종료");
					//break; 여기서 쓰면 do while문을 빠져나가버림 main함수를 빠져나가야 종료됨
					//return; //main함수 빠져나감
					System.exit(-1); // 어떤 함수든 종료
				}
			}//if
			System.out.print(">user 가위1 ,바위2, 보3 선택?");
			inputData = scanner.next();
			flag = true;
		} while (!inputData.matches(regex));
		
		user = Integer.parseInt(inputData);
		System.out.println(user);
		
	}

}
