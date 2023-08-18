package days06;

import java.util.Arrays;
import java.util.Random;
import java.util.stream.IntStream;

public class Ex01_03 {

	public static void main(String[] args) {

		int a = 5, b = 7, c = 1;
		
//		1. jdk 1.5 제네릭
//		2. jdk 1.8 람다식과 스트림
//		OptionalInt[7]
		System.out.println(IntStream.of(a,b,c).max()); 
		//a,b,c가 나열된 스트림으로 만들어짐 max함수가 OptionalInt[7] 클래스 타입으로 리턴해줌 
		//그런데 클래스가 필요한게 아니라 7이 필요 하기 때문에 아래처럼 해줌
//		[1]
//				int max = IntStream.of(a,b,c).max().getAsInt(); // getAsInt()가 OptionalInt에서 현재 value값(int값)을 가져옴
//				System.out.println(max);
		
//		[2]
//				System.out::println(); //=> 매서드 참조
		IntStream.of(a,b,c).max().ifPresent(System.out::println);
		//가장 큰값을 가져오겠다       / 현재꺼 
		
		
		
//------------------------------------------------------------------		
//		10개 정수 배열 중에서 가장 큰 값 찾기(람다식과 스트림 이용한 풀이법)
		int [] m = new Random().ints(5, 16).limit(10).toArray();
		System.out.println(Arrays.toString(m));
//		출력결과 => 5에서 16까지 랜덤한 수 10개를 나열 / 16은 포함X
		
		int max = new Random().ints(5, 16).limit(10).max().getAsInt();
		System.out.println(max);
//		출력결과 => 5에서 16까지 랜덤한 수 중에 가장 큰 수 1개를 찾음
//		-------------------------------------------------------------
		
		
		
	}//main
}//class
