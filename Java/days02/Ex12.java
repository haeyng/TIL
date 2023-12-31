package days02;

/**
 *@author 송해영
 *@date 2023. 7. 16.-오후 7:42:11
 *@subject
 *@content
 */
public class Ex12 {

	public static void main(String[] args) {
		//문자형  char (2) //2진법으로 표현되서 정수형
		//[진법 변환]
		// 16 진수 : 0 1 2 3 4 5 6 7 8 9 a(10) b(11) c(12) d(13) e(14) f(15)
		// 10 진수 : 0 1 2 3 4 5 6 7 8 9
		// 8 진수  : 0 1 2 3 4 5 6 7
		// 2 진수  : 0 1
		byte b = 10; //  [00001010]
		// int i = 10;  //  [00000000 00000000 00000000 00001010]
		
		char c = 'A';  // 2진수(0,1)  65 ->   초창기 ASCII 7비트( 128문자만 표현 가능했음-한글표현이 안됨)
		// 정수 65값이 2진수로 저장되는게 문자 'A'라는 뜻
		// 'A'라는 문자가 2진수로 나타내기 위해서 매칭되는 10진수 65값을 코드표로 만들어 표준화 한것 ASCII
		
		// 자바  유니코드 2바이트      [00000000][01000001]
		
		// 확장ASCII ( 8비트  256문자 )
		// 인코딩( encoding )   'A' => 65 변환            ~을 코드화한다.
		// 디코딩                65 -> 'A' 변환 
		
		// 문자형 char를 2바이트 정수형으로 둔 이유? 
		// ->'A' 문자가 정수 65를 가지고 2진수로 변환시켜 저장되기 때문에 정수계열에 포함되어져 있다
		
		//  '\u0000'~ '\uffff'  -> char 문자형의 표현 범위
		// 여기서 \ u는 유니코드 2바이트를 뜻함 
		// 16진수 61 -> 10진수 ? (1의 자리 1에 16^0곱하고 10의 자리 6에 16^1곱해서 더하면 97)
		char d = '\u0061'; // 'a'는 유니코드로 /u0061 'b'는 /u0062
		System.out.printf("d:%c%n", d); // 'a' - 97, 'A' - 65
		
		// 대문자 - 소문자 = 65 - 97 =  -32
		
	}

}
