package days04;

import java.util.Scanner;
/**
 *@author 송해영
 *@date 2023. 7. 22.-오후 2:55:24
 *@subject      컴퓨터 - 사용자(user) 가위,바위,보 게임
 *                    뭐 냈는지 입력 후 출력될 때 
 *                    컴퓨터:1, 사용자:3 말고 컴퓨터:가위, 사용자:보 로 출력되게 바꾸기 (if, switch 각각 사용)
 *@content
 */
public class EX10_03 {
	public static void main(String[] args) {
		
			int com, user;
			String coms = null, users = null; // 가위, 바위, 보
			
			try (Scanner scanner = new Scanner(System.in)){	
				System.out.print("User 가위(1), 바위(2), 보(3)를 입력하세요 > ");
				user = scanner.nextInt();
				com = (int)((Math.random()*3)+1);			
				
				//user의 int값을 users 새로운 변수에 문자열로 가위, 바위, 보를 각각 입력되게 한 것 
				switch (user) {
				case 1:
					users = "가위";
					break;
				case 2:
					users = "바위";
					break;
				case 3:
					users = "보";
					break;
				}//switch
				
				//com의 int값을 coms 새로운 변수에 문자열로 가위, 바위, 보를 각각 입력되게 한 것 
				if (com==1) {
						coms = "가위";
				}else if (com==2) {
						coms = "바위";
				}else if (com==3) {
						coms = "보";
				}
				
				System.out.printf("> 컴퓨터:%d, 사용자:%d\n", com, user); //> 컴퓨터:1, 사용자:3
				System.out.printf("> 컴퓨터:%s, 사용자:%s\n", coms, users);//> 컴퓨터:가위, 사용자:보
				
				switch (user-com) {
				case 1: case -2:
					System.out.println("사용자 승리");
					break;
				case -1: case 2:
					System.out.println("컴퓨터 승리");
					break;
				default: //case 0:으로 해도 됨
					System.out.println("무승부");
					break;
				}//switch
				
			} catch (Exception e) {
				e.printStackTrace();
			}//catch	 //scanner.close()자동 : try리소스문
		}//main
	}//class
