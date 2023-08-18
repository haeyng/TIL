package days04;

import java.util.Scanner;
/**
 *@author 송해영
 *@date 2023. 7. 22.-오후 6:00:44
 *@subject   로직 이해하고 외우기
 *				    뭐 냈는지 입력 후 출력될 때 
 *                 컴퓨터:1, 사용자:3 말고 컴퓨터:가위, 사용자:보 로 출력되게 바꾸기 (배열 사용)
 *@content
 */
public class Ex10_04 {

	public static void main(String[] args) {
		
//		1. 컴퓨터는 랜덤하게 1-3 발생시키는 숫자 입력받게 - 매서드 사용
//		2. 사용자는 1,2,3 중에 숫자 입력하게 - 스캐너
//		3. 누가 이겼는지 판가름, 판가름 하려면 컴퓨터-user 1,2,-2,-1 누가 이겼는지 체크
//		4. if, switch 써서 누가 이겼는지 출력하는 판가름 
//		5. 누가 이겼는지 출력.
		
		
		int com, user;
		
		try (Scanner scanner = new Scanner(System.in)){	
			System.out.print("User 가위(1), 바위(2), 보(3)를 입력하세요 > ");
			user = scanner.nextInt();
			com = (int)((Math.random()*3)+1);			
			
			//1번
			//String [] rockPaperScissors = new String [4];
			//   [가위]    [바위]    [보]               ->         [] 
			//배열명[0]    [1]      [2]  
			//0번째 공간에 가위 1번째에 바위 2번째에 보
			
			/*2번
			rockPaperScissors[0] = "";
			rockPaperScissors[1] = "가위";
			rockPaperScissors[2] = "바위";
			// ArrayIndexOutOfBoundsException: Index 3 out of bounds for length 3
			//배열인덱스(첨자값)가 범위를 벗어났다
			rockPaperScissors[3] = "보";
			*/
			
			String [] rockPaperScissors = {"","가위","바위","보"}; 
			//위에 1번 2번을 합쳐서 간단하게 초기화하고 표현한것
			
			
			//System.out.printf(">컴퓨터 : %d, 사용자 : %d\n", rockPaperScissors[com], rockPaperScissors[user]);
			//위 코딩을 출력할때 com에 1을 넣어서 가위를 출력하려고 함
			//그러면 1은 가위니까 가위를 출력하려면 1을 뺀 인덱스 값(첨자값) 0이니까 0번째 가위가 출력되기 때문에 1을 빼줌
			
			//System.out.printf(">컴퓨터 : %d, 사용자 : %d\n", rockPaperScissors[com-1], rockPaperScissors[user-1]);
			//java.util.IllegalFormatConversionException: d != java.lang.String
			//%d에 잘못된 형식 에러, 문자열을 출력하려고 하니까 %s를 입력해야함
			
			//System.out.printf(">컴퓨터 : %s, 사용자 : %s\n", rockPaperScissors[com-1], rockPaperScissors[user-1]);
			//이렇게 해도 출력이 잘 되지만 -1을 없애서 빼기 안하고 바로 배열을 가져오고 싶으면?
			//배열 크기를 증가시켜서 0번째는 값을 비워놓으면 됨!
			
			System.out.printf(">컴퓨터 : %s, 사용자 : %s\n", rockPaperScissors[com], rockPaperScissors[user]);
			//[0]번 공간을 "";로 바꿔서 할당하고 가위는 1 바위는 2 보는 3으로 바꿔주고 출력에 com-1 을 com으로 바꿔줌 -> 에러남!
			//ArrayIndexOutOfBoundsException: Index 3 out of bounds for length 3
			//배열인덱스(첨자값)가 범위를 벗어났다 [3]번 공간 보 가 범위를 벗어났다는 오류
			//String [] rockPaperScissors = new String [3]; 여기서 3으로 크기를 정했기 때문에 공간은 3개를 해준것이므로
			//0,1,2,3으로 4개를 하면 마지막 3번은 범위를 벗어났다는 오류가 남
			//해결방법 : 공간을 4로 바꿔줌
			
		
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