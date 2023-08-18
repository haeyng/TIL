package days04;

public class Ex06_03 {

	public static void main(String[] args) {

		//1+2+3+4+5+6+7+8+9+10+=55 마지막 +를 출력하고 싶지 않을때
		int sum = 0;
		for(int i = 1 ; i <=10 ; i++){
			System.out.printf("%d+",i);
			sum = i + sum;
		}//for
		System.out.printf("\b=%d\n",sum); 
		//for문이 다 돌고 난 후에 +=sum 에서 +를 backspace 해주는게 제일 좋은 방법!
		//   \b 는 backspace 적용이 된다
		
	}//main
}//class
