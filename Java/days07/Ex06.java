package days07;

public class Ex06 {

	public static void main(String[] args) {

		//1+2+..+9+10=55
		
		//1-2+3-4+5-6+7-8+9-10=-5
		
		//홀수 에는 sum+=i 누적    %-
		//짝수 에는 sum-=i 차감     %+
		
//		int sum=0;
//		for (int i = 1; i <=10; i++) {
//			
//			if (i%2==0) {//짝수
//				sum-=i;
//				System.out.printf("%d+",i);
//			} else {//홀수
//				sum+=i;
//				System.out.printf("%d-",i);
//			}//if
//			
//		} // for
//		System.out.printf("=%d\n",sum);
		
		
		int sum=0;
		for (int i = 1; i <=10; i++) {
			sum+= i%2==0?-i:i;
			System.out.printf(i%2==0?"%d+":"%d-",i);
		}
			
		
		
	}//main

}//class
