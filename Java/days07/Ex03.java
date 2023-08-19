package days07;

import java.util.Scanner;

public class Ex03 {

	public static void main(String[] args) {
		
//		3. [ days04.Ex10_04.java ] 
//		가위바위보 게임에서
//		다시 게임할거니라고 물어보고 예('y')라고 하면 
//		반복해서 계속할 수 있도록 코딩을 수정하세요.
		
		int com, user;
		
		try (Scanner scanner = new Scanner(System.in)){	
			System.out.print("User 가위(1), 바위(2), 보(3)를 입력하세요 > ");
			user = scanner.nextInt();
			com = (int)((Math.random()*3)+1);			
			
			String [] rockPaperScissors = {"","가위","바위","보"}; 

			System.out.printf(">컴퓨터 : %s, 사용자 : %s\n", rockPaperScissors[com], rockPaperScissors[user]);

			switch (user-com) {
			case 1: case -2:
				System.out.println("사용자 승리");
				break;
			case -1: case 2:
				System.out.println("컴퓨터 승리");
				break;
			default: 
				System.out.println("무승부");
				break;
			}//switch
			
		} catch (Exception e) {
			e.printStackTrace();
		}//catch	 //scanner.close()자동 : try리소스문
		
	}//main
}//class
