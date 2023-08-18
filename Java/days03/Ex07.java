package days03;

/**
 * @author 송해영
 * @date 2023. 7. 17.-오후 3:18:33
 * @subject 대문자 -> 소문자 변환
 *                소문자 -> 대문자 변환
 * @content
 */
public class Ex07 {

	public static void main(String[] args) {
		
		char lowerCase , upperCase ; //lowerCase 소문자  upperCase대문자
		lowerCase = 'x';
		//upperCase 변수에는 'X'(lowerCase의 대문자)를 저장해서 출력하려고함
		//'A' 65 -> 'a' 97
		//대문자      소문자    차 =32
		// 소문자-32 = 대문자
		
		//upperCase=lowerCase - 32; 만 적으면
		//Type mismatch: cannot convert from int to char 강제형변환하라 오류뜸 char 취함
		upperCase=(char) (lowerCase - 32); //
		
		System.out.printf("%c\n", upperCase);
		
		lowerCase=(char) (upperCase +32); // 
		System.out.printf("%c\n", lowerCase);
		
		
		//'0' 은 코드값 48 '2'는 50 '4'는 52
		System.out.println('4' - '2');  //2
		//                          52-50 // 코드값-코드값으로 처리되서 2
		
		
	}//class

}//main
