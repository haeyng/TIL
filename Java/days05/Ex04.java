package days05;

public class Ex04 {

	public static void main(String[] args) {
		/* [1] 1+2+3+4+5+6+7+8+9+10=55
				int sum = 0;
				for (int i = 1; i <=10 ; i++) {
					System.out.printf("%d+",i);
					sum +=i;
				} //for
				System.out.printf("=%d",sum);*/

		
		
		/*[2] 1+3+5+7+9=25 
		//1~10까지 홀수의 합
		int sum = 0;
		for (int i = 1; i <=10 ; i++) {
			if (i%2==1) {
				System.out.printf("%d+",i);
				sum +=i;
			} //if
		} //for
		System.out.printf("=%d",sum);*/
		
		
		
		/*[3] 1+3+5+7+9=25  
		//1~10까지의 홀수의 합
		//[continue 문 설명]
		int sum = 0;
		for (int i = 1; i <=10 ; i++) {
			if (i%2==0) continue; //짝수이면 밑에 영역 수행하지 않고 바로 증감식으로 보내기
				System.out.printf("%d+",i);
				sum +=i;
		} //for
		System.out.printf("=%d",sum);*/
		
		
		

		//[4] for문 반밖에 안돌고 if문 체크도 안하니까 성능이 좋음
		int sum = 0;
		for (int i = 1; i <=10 ; i+=2) {
				System.out.printf("%d+",i);
				sum +=i;
		} //for
		System.out.printf("=%d",sum);
		
		
		/*[5] 1~n까지의 합 출력
		//1+2+3+4+5=15
		int n = 5;
		int sum = 0;
		for (int i = 1; i <= n; i++) {
			System.out.printf(i==n? "%d" : "%d+", i);
			sum += i;
		} //for
		System.out.printf("=%d\n",sum);*/
	
		
		
		
		
		
	}//main
}//calss
