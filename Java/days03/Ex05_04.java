package days03;

/**
 * @author 송해영
 * @date 2023. 7. 17.-오후 2:01:19
 * @subject 논리연산자
 * @content 참/거짓으로 판단  boolean
 *                1) 일반 논리 연산자
 *                    ㄱ. && 일반 논리 AND 연산자 (논리곱)
 *                         (둘다 참이면 참) 인 연산자
 *                         참 && 참 => 참
 *                         참 && 거짓 => 거짓
 *                         거짓 && 참 => 거짓
 *                         거짓 &&거짓 =>거짓
 *                         
 *                    ㄴ. ||   일반 논리 OR 연산자 (논리합)
 *                         (둘다 거짓이면 거짓) 인 연산자
 *                         참 || 참 => 참
 *                         참 || 거짓 => 참
 *                         거짓 || 참 => 참
 *                         거짓 ||거짓 =>거짓
 *                         
 *                    ㄷ. !    부정(NOT) 연산자
 *                         !참 => 거짓
 *                         !거짓 =>참
 *                         
 *                2) 비트 논리 연산자 : & ^ | ~ - 나중에 설명
 */
public class Ex05_04 {

	public static void main(String[] args) {
		
//		//연산자 우선 순위    예)  x > +
//		//산술연산자>비교연산자>논리연산자>대입연산자
//		System.out.println(3 <= 5  &&  10>1)   ;   //true 
//		//                             참             참 
//		System.out.println(3 <= 5  &&  10>1)   ;   
//		System.out.println(3 <= 5  &&  10<1)   ;  
//		
//		//경고 : Dead code
//		//                            거짓    &&   참/거짓 // 10<1에 노란색 밑줄 : 앞에가 거짓이라 뒤에 결과에 상관없이 거짓, 뒤에는 처리 안함, 없는 코딩하고 같다
//		System.out.println(3 >= 5  &&  10<1)   ;  
//		System.out.println(3 >= 5  &&  10<1)   ;   

		/*
		System.out.println(3 <= 5  ||  10>1);     
		System.out.println(3 <= 5  ||  10<1); 
		System.out.println(3 >= 5  ||  10>1);    
		System.out.println(3 >= 5  ||  10<1);      
		*/
		
		//The operator ! is undefined for the argument type(s) int
		//! 부정연산자 not은 int 피연산자에 선언이 안되어있다 = int 앞에 사용할 수 없다.
		//!boolean boolean형 앞에만 올수있음
		//System.out.println(!3 <= 5); // !3을 처리하고 비교
		//비교연산자>논리연산자
		//   <=           !
		//! 부정연산자는 단항연산자로 어떤 연산자(이항,삼항)보다 우선순위가 높다. 
		System.out.println(!(3 <= 5));  //괄호 속 연산자를 먼저하고 부정
		
		
		
		
	}//main
		
}//class
