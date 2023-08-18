package days04;

import java.util.Scanner;

public class Ex04 {

	public static void main(String[] args) {
		//국어 점수를 kor 변수에 입력받아서 등급(grade)을 출력
		//0~56 가
		//60~69 양
		//70~79 미
		//80~89 우
		//90~100 수
		//if 조건문 , if ~ else 조건문
		
		int kor;
		try (Scanner scanner = new Scanner(System.in)){ //try~catch 자동으로 scanner 닫아줌
			System.out.print("국어 점수 입력> ");
			kor = scanner.nextInt();
			
			//The operator <= is undefined for the argument type(s)
			//0<=kor<=100로 조건문 쓰면 에러남 
			//boolean형하고 int하고 크다 작다 비교연산을 사용할 수 없다
			if (0<=kor && kor<=100) {
				
				if (90<=kor) { //if문 안에 if문이 올수있음 중첩if문
					System.out.println("수");
				} //if
				if (80<=kor && kor<=89) { //점수가 88이라고 가정할때 여기 if문을 만족하지만
														//if문은 밑에 있는 if문들 5개 모두 확인함
														//위에서 if문을 만족하면 밑에 if문들을 실행하지 않는 
														//효율적인 elseif 사용하는것이 좋음
					System.out.println("우");
				} //if
				if (70<=kor && kor<=79) { 
					System.out.println("미");
				} //if
				if (60<=kor && kor<=69) {
					System.out.println("양");
				} //if
				if (kor<=59) {
					System.out.println("가");
				} //if
				
			} else { //국어점수가 if에서 설정한 범위를 벗어나 조건식이 거짓이 되면 
				        //잘못입력했다는 메세지 띄울것임
				System.out.println("국어 점수 입력을 잘못했습니다");
			} //if
			
		} catch (Exception e) {
			e.printStackTrace(); // 에러가 나면 보이게 출력되게 함
		}//catch
	}//main
}//class
