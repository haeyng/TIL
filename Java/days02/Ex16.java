package days02;

/**
 *@author 송해영
 *@date 2023. 7. 16.-오후 9:21:53
 *@subject 형변환
 *@content
 */
public class Ex16 {

	public static void main(String[] args) {
		
		// 1. 자동형변환 - 2가지 경우
		int i = 10; //         [][][][]	4바이트에 10이 들어가있음	
		long l = i; // [][][][][][][][] 8바이트에 10이 들어가있음
		//같은 정수 계열이라도 바이트수가 다르기 때문에 다른타입임.
		//좌측이 자료형이 long형으로 크고 우측이 좌측보다 더 작음. 
		//좌측 기억공간의 크기가 우측값보다 크기때문에 자동으로 큰 자료형으로 바뀌어서 들어가게됨 
		//->첫번째 경우:더 큰자료형이 할당될때
		
		float f = l; // float(실수형)이 long(정수형)보다 더 큰 자료형으로 인식해서 자동 형변환됨
		System.out.println( f );
		
		//자동 형변환 되는 두번째 경우 :작은 자료형 연산 큰 자료형 연산 결과가 큰 자료형으로 자동변환된다
		long L = l + i; // 우측 항을 먼저 연산 long(8byte) + int(4yte) = long 큰 자료형으로 자동으로 바뀐다
		
		
		// 2. 강제형변환(개발자가 원하는 값을 얻기 위해서 강제로 형변환)
		//    3*(5+2)   이때, () 괄호는 최우선연산자이다.
		//    (변환하고자하는 타입(=자료형)) cast연산자가 하는 역할:강제로 형변환        
		//    cast연산자 ()를 사용해서 강제 형변환 하는것을 캐스트강제형변환이라고함
		//    cast 연산자가 나누기보다 우선순위가 높다
		
		int a = 20;
		int b = 3;
		//System.out.println(a/b); // 6으로 나옴 int/int 연산은 int가 나온다
		//따라서 int 둘중 하나를 실수형으로 변환해 6.666으로 다 나타내줄수있다
		System.out.println(  (double)a/b ); // 6.666666..몫 double/int => double
		// 위와 같음 System.out.println(  a/(double)b );
	}

}
