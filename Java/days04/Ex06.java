package days04;

public class Ex06 {

	public static void main(String[] args) {
		
		//1+2+3+4+5+6+7+8+9+10+=55 마지막 +를 출력하고 싶지 않을때
		int sum = 0;
		for(int i = 1 ; i <=10 ; i++){
			if (i==10) { //i가 10일때는 +없이 출력
				System.out.printf("%d",i);
			} else {//i가 10이 아닐때는 +붙여서 출력
				System.out.printf("%d+",i);
			} //if
			sum = i + sum;
		}//for
		System.out.printf("=%d\n",sum);
	}//main
}//class
