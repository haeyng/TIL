package days04;

import java.util.Scanner;

public class Ex09 {

	public static void main(String[] args) {
		//국어 점수를 입력받아서 수우미양가 등급을 출력
		//if문에서 switch문으로 바꿔보기
		//0~56 가
		//60~69 양
		//70~79 미
		//80~89 우
		//90~100 수
		
		// 자바는 범위를 줄 수 없어서 아래처럼 함
		// 100/10             10
        // 99~90/10          9
        // 89~80/10          8
        // 79~70/10          7
        // 69~60/10          6 
        // 59~0/10          0~5
		
		try (Scanner scanner = new Scanner(System.in)){
			int kor;
			char grade;
			System.out.print("국어 점수를 입력하세요 >");
			kor = scanner.nextInt();			
			switch (kor/10) { 
			//key는 변수, 수식 쓸 수 있음
			case 10: case 9: //case 10, 9: 표현도 가능한데  JDK 14 부터
				grade = '수'; break; 
			case 8:
				grade = '우'; break;
			case 7:
				grade = '미'; break;
			case 6:
				grade = '양'; break;
			default:                        //현재 이 코딩에서는 100점 이상은 '가'로 출력됨
				grade = '가'; break;    //default에는 break 안붙여도 상관없음 default 지나면 제어문을 빠져나가기 때문에
			}//switch
			//switch문은 break가 없으면 오류는 나지 않지만 차례대로 처리해버리기 때문에 결과가 모두 '가'이다
			//제어문을 빠져나올때 쓰는 것이 break;문 
			//break가 반드시 있어야 되는것은 아님
			//중첩 switch 가능 다른 제어문과 중첩 가능
			System.out.printf("국어 등급은 '%c'입니다.",grade);
		} catch (Exception e) {
			e.printStackTrace();
		}//catch
		
	}//main
}//class
