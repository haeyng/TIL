package days08;

import java.util.Random;

/**
 * @author 송해영
 * @date 2023. 7. 24.-오후 3:03:04
 * @subject
 * @content
 */
public class Ex09 {

	public static void main(String[] args) {
		
		//로또 6/45
		//1~45까지의 정수를 6개 출력.
		//1<=(int)Math.random()*45+1<45+1
		//(int)(Math.random()*45)+1
		
		//Random rnd = new Random();
		//0<=rnd.nextInt(45)+1
		
		for (int i = 1; i <= 6; i++) {
			int lottoNumber = (int)(Math.random()*45)+1;
			System.out.println(lottoNumber);
			
		} // for
	
		/*출력 결과 예시
		 3
		       43 중복
		 35
		 29
		 27
		       43 중복
		 * */ // 결론 : 중복이 나옴
	
	}//main

}//class