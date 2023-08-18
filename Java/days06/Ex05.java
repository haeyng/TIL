package days06;

import java.util.Scanner;

/**
 *@author 송해영
 *@date 2023. 7. 23.-오후 4:44:16
 *@subject   제어문 활용
 *@content
 */
public class Ex05 {
	public static void main(String[] args) {
		
		int n;
		
		try (Scanner scanner = new Scanner(System.in)) {
			System.out.print("정수 n을 입력하세요 > ");
			
			//n = scanner.nextLine(); //중간에 공백이 있더라도 엔터를 구분자로 입력받는다.
			//Type mismatch: cannot convert from String to int 정수로 바꿔줌
			
			//n = scanner.nextInt(); ////문자 , 실수 안되고 정수형태로만 입력가능
			//System.out.println(n);
			//java.util.InputMismatchException
			//12a를 입력했더니 뜬 오류 입력 잘못했다는 오류 : Int라서
			
			String inputData = scanner.nextLine();
			char [] idArr = inputData.toCharArray();
			
			boolean flag = false; //숫자가 아닌게 있으면 true로 바꿀것임
			
			for (int i = 0; i < idArr.length; i++) {
				if (!('0'<=idArr[i] && idArr[i]<='9')) {
			  //if ('0'>idArr[i] || idArr[i]>'9')) 위가 가독성이 더 좋음
					flag = true;
					break; // 하나라도 숫자가 아니면 더 이상 체크하지 않고 빠져나옴
				}//if //숫자인지 체크하는 if문 
			} //for		

			     /*-----------------------------------------------------------------------------------------
//				if (flag) { //flag 자체가 참,거짓을 가지는 boolean형이라서(flag==true) 대신 flag만 입력해도 됨
//					System.out.println("입력 잘못했습니다");
//				} else {
//					n = Integer.parseInt(inputData);
//					System.out.println(n);
			      ------------------------------------------------*/
			
				//위에 있는것을 ! not을 붙여서 위 아래 바꿔줌  같은 의미임
				if (!flag) { //!를 붙이면 
					n = Integer.parseInt(inputData);
					System.out.println(n);
				} else {
					System.out.println("입력 잘못했습니다");
				}//if				
				
				
		} catch (Exception e) {
			e.printStackTrace();
		}//catch
		
	}//main
}//class
