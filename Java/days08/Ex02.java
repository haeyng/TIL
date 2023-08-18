package days08;

public class Ex02 {

	public static void main(String[] args) {

		//3) 정수를 가변 매개변수(인자)로 받아서 합을 반환하는 함수 선언
		//4) 한 문자를 매개변수로 받아서 대문자로 바꿔서 반환하는 함수 선언

		System.out.println(sum(1,2,3));
		System.out.println(sum(1,2,3,4,5,6));
		System.out.println(sum(new int [] {1,2}));

		char one = 'x';
		char upperOne = myUpperCase(one);
		System.out.println(upperOne);

	}//main

	public static char myUpperCase(char one) {

		//대문자 바꾸는 함수
		if ('a'<=one&&one<='z') {
			one = (char)(one-32);
		}//if
		return one;


		//		char UpperCaseOne = one;
		//		return Character.toUpperCase(one);
		//		if (Character.isLowerCase(one)) {             //is 는 true false값을 돌림 //소문자가 아니면 들어왔던 문자 그대로 돌린다
		//		UpperCaseOne = Character.toUpperCase(one);
		//			one = Character.toUpperCase(one);
		//		}//if

	}

	public static int sum( int... args) { //int... args 가변인자. 가변인자는 ()안에 제일 마지막에 옴 (int... args, long l )는 안됨 
		int result = 0;

		//		for (int i = 0; i < args.length; i++) {
		//			result += args[i];
		//		} // for
		//		return result;
		
		// foreach문( 확장for문 )
		for (int i : args) {
			result += i;
		}//foreach
		return result;
	}//main
}//class
