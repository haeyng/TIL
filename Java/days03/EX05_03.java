package days03;

/**
 * @author 송해영
 * @date 2023. 7. 17.-오후 12:39:45
 * @subject 비교연산자의 결과값은 항상 true/false이다. (리턴자료형은 boolean)
 * @content instaceof 비교연산자는 클래스수업할때 배우기로
 */          
public class EX05_03 {

	public static void main(String[] args) {
		
		System.out.println( 10>3 ); //참(true)
		System.out.println( 10<3 ); //거짓(false)
		System.out.println( 10>=3 ); //참(true) //(><를 먼저 쓰고 =를 적기)
		System.out.println( 10<=3 ); //거짓(false)
		
		
		//(주의할것)		같다(==) 다르다(!=)
		System.out.println( 10==3 ); //거짓(false)
		System.out.println( 10!=3 ); //참(true)
		
		//System.out.println( 10=3 ); // =를 하나만 적으면 안됨 오류 주의
		//System.out.println( 10=!3 ); //  !가 부정연산자인데 (i 와 =)순서바뀌면 다른 의미가 되서 안됨 !가 나중에 오면 !먼저 연산하고 대입됨
		
		

		
	}

}
