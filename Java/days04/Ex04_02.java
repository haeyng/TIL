package days04;

import java.util.Scanner;

public class Ex04_02 {

	public static void main(String[] args) {
		//국어 점수를 kor 변수에 입력받아서 등급(grade)을 출력
		//0~56 가
		//60~69 양
		//70~79 미
		//80~89 우
		//90~100 수
		//if 조건문 , if ~ else 조건문
		
		/*int kor;
		try (Scanner scanner = new Scanner(System.in)){ //try~catch 자동으로 scanner 닫아줌
			System.out.print("국어 점수 입력> ");
			kor = scanner.nextInt();

			if (0<=kor && kor<=100) {
				if (90<=kor) {
					System.out.println("수");
				} //if
				else if (80<=kor) { // 앞에서 조건 만족하면 뒤에 나머지 else if는 처리하지 않음
					System.out.println("우");
				}
				else if (70<=kor) {
					System.out.println("미");
				}
				else if (60<=kor) {
					System.out.println("양");
				}
				else {//마지막에는 조건을 안달고 else만 달아도 됨 위에가 다 아니면 
				         //그 외 다 이기 때문에 조건문이 필요없음
					System.out.println("가");
				}
				
			} else { 
				System.out.println("국어 점수 입력을 잘못했습니다");
			} //if
			
		} catch (Exception e) {
			e.printStackTrace();
		}//catch*/
		
		int kor;
		try (Scanner scanner = new Scanner(System.in)){
			System.out.print("국어 점수 입력> ");
			kor = scanner.nextInt();
			char grade = '가';
			if (0<=kor && kor<=100) {
				if (90<=kor) {
					grade = '수';
				}
				else if (80<=kor) { 
					grade = '우';
				}
				else if (70<=kor) {
					grade = '미';
				}
				else if (60<=kor) {
					grade = '양';
				}
				else { //char grade = '가'; 기본값이 '가'이기 때문에 
					      //없어도 되고 grade = '가'; 를 할당안해도 위 조건들을 만족하지 않으면 
					      //기본값이 가가 되어져있음 안줘도 됨
					//System.out.println("가");
					grade = '가';
				}
				System.out.printf("국어 점수는 %d점이고 등급은 '%c'입니다.",kor,grade);
			} else { 
				System.out.println("국어 점수 입력을 잘못했습니다");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}//catch		
	}//main
}//class