package days06;

import java.util.Scanner;

/**
 *@author 송해영
 *@date 2023. 7. 20.-오후 7:54:17
 *@subject 복습 문제풀이 - 로직 연습은 중첩 if문이랑 삼항연산자로 하기
 *@content
 */
public class Ex01 {

	public static void main(String[] args) {

//		[1] 중첩 if문 .... 연습하기
//		세 정수 a, b, c 를 입력받아서 가장 큰수, 가장 작은수를 찾아서 출력하세요.
//		- 두개씩 비교해서 더 큰, 작은 것 찾아내면 됨
		
		try (Scanner scanner = new Scanner (System.in)) {
				int a, b, c;
				
				System.out.print("세 정수 a, b, c를 입력하세요 > ");
				
				a= scanner.nextInt();
				b= scanner.nextInt();
				c= scanner.nextInt();		
							
				/*
				 if (a>b) {
				 
						if (a>c ) {
						max = a;
						}else { //c<a
						max = c;
						}					
				} else{ // b>a
						if (b>c) {
							max = b;
						} else { //c>b
							max = c;
						}
				}//if			
				System.out.printf("가장 큰 수 : %d, 가장 작은 수 : %d", max, min);
				*/				
				
	   /*[2] 삼항연산자				
				int max = a>b ? (a>c? a : c ): (b>c? b : c);
				int min = a<b ? (a<c? a: c) : (b<c ? b : c);
				
				System.out.printf("가장 큰 수 : %d, 가장 작은 수 : %d", max, min);
				*/
				
	  //[3] Math.max(), min()
				//int max = Math.max(a, b);
				//max = Math.max(max, c);
				
				int max = Math.max(Math.max(a, b), c); //위에 두줄을 한줄로!
				int min = Math.min(Math.min(a, b), c);
				
				System.out.printf("가장 큰 수 : %d, 가장 작은 수 : %d", max, min);
			
		} catch (Exception e) {
			e.printStackTrace();
		}//catch
		

		
	}//main

}//class
