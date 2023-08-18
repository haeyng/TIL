package days04;

/**
 *@author 송해영
 *@date 2023. 7. 22.-오전 7:49:21
 *@subject switch 분기문
 *@content for 반복문(암기)
 */
public class Ex05 {
	public static void main(String[] args) {
		//어떤것을 반복할때 for문을 사용
		//무엇을 반복할지, 반복하는 규칙을 찾는게 중요함!!
		
//		for ( 초기식 ; 조건식 ; 증감식) {
//			System.out.println("홍길동"); 
//		}//for

		
		/*예)
		 for (int i = 1; i <= 5; i++) {  
		
			//i는 반복횟수를 나타내는 변수, 조건식이 거짓이면 {}영역 한번도 반복을 수행하지 않음
			//i가 1일때 {} 영역을 수행하고 증감식으로 감 i가 1 증가해서 i가 2가 됨
			//i가 2가 되면 5보다 작은것이 참이기 때문에 다시 {} 영역을 수행하고 다시 증감식으로 감 i는 3이 됨
			//초기식은 한번만 실행 되고 조건식이 거짓(i가 6이 되면)이 되면 반복문을 빠져나간다.
			System.out.println("홍길동"); 
		} // for
		// i=1 홍길동
		// i=2 홍길동
		// i=3 홍길동
		// i=4 홍길동
		// i=5 홍길동
		*/
	

//		[1~10까지의 합 출력]
//		1+2+3+4..+9+10=55
		int sum = 0;
		for (int i = 1; i <=10; i++) {
			System.out.printf("%d+",i);
			sum = sum + i; //for문이 도는 1,2,3..10 값이 누적됨
//			i=1  sum=1
//			i=2  sum=3
//			i=3  sum=6
//			:
		}//for
		System.out.printf("=%d\n",sum);				
	}//main
}//class
