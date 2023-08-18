package days03;

/**
 * @author 송해영
 * @date 2023. 7. 17.-오후 3:26:24
 * @sbject
 * @content
 */
public class Ex08 {

	public static void main(String[] args) {

		//Type mismatch: cannot convert from double to float 
		//float pi = 3.141592; 오류
		
		//float pi = (float)3.141592;아래와 같음
		float pi = 3.141592f;
		// 소수점 네번째 자리에서 반올림한 실수값을 얻어와서 출력하려고 한다
		// 3.142
		
		
		//첫번째 방법
		//System.out.printf("%.3f",pi); //출력외에 사용할수없는 코딩, 변수에서 저장해서 출력해야함 아래처럼
		
		//pi = Float.parseFloat(String.format("%.3f",pi)); // "3.142"
		//System.out.println(pi);
		
		//두번째 방법 -시험)
		System.out.println(pi * 1000);            //3141.592
		System.out.println((int)(pi * 1000));  //3141 강제로 정수변환 소수점제거
		System.out.println((int)(pi*1000) / 1000f);  // 1000에 접미사 붙여서 실수로 만듦 (반올림이 아니라 절삭(잘라냄)됨)
		//System.out.println(pi * 1000+0.5); 뒤에 041015625나와서 오차가 있다
		System.out.println((int)(pi * 1000+0.5) / 1000f); //0.5를 더해준다..... 외우기
		
	
	}//main

}//class
