package days04;

import java.util.Scanner;

public class Ex08 {

	public static void main(String[] args) {
		//switch 분기문
		
		/*
		switch (key) { //key : 변수, 수식 사용 가능 (정수, 문자열, 문자),    상수, 리터럴은 안됨
		case value: //value : 리터럴,상수,문자열,문자 올 수 있음,             변수는 사용할 수 없음
			break;
		default: // default는 없어도 됨
			break;
		}//switch*/
		
		int n;
		try(Scanner scanner = new Scanner (System.in)) {
			System.out.print("정수를 입력하세요 >");
			String result = null;
			n = scanner.nextInt();
			switch (n%2) {
			case 0:
				//System.out.println("짝수");
				result = "짝수";
				break;
			case 1:
				//System.out.println("홀수");
				result = "홀수";
				//default; 나머지가 0이나 1 그 외에 경우가 있다면 default; 써서 나머지 경우의 값을 주면 됨
				break;
			}//switch			
			System.out.println(result);
			//The local variable result may not have been initialized
			//switch(n%5)일때 나머지가 0,1,2,3,4일수도 있는데 
			//case가 0,1밖에 안되어 있으면 경우에 따라서 
			//초기값이 없는 상태에서 result에 값이 안들어갈 수 있기 때문에 초기화 해야함
		} catch (Exception e) {
			e.printStackTrace();
		}//catch
		System.out.println(" end ");
	}
}