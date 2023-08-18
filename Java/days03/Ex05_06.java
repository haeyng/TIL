package days03;

/**
 * @author 송해영
 * @date 2023. 7. 17.-오후 2:39:41
 * @subject 단항연산자  ++      --
 * @content        ㄴ    증감연산자
 */
public class Ex05_06 {

	public static void main(String[] args) {

		//어떤 기억공간(n)의 값을 1증가 시키는 코딩 1)2)3)4) 같은 코딩임 - 시험) 4가지 다 외우기
		int n = 10; 
		System.out.println( n ); //10
		
		// n = 11;
		//1)n= n + 1; //우측항먼저 처리, n에 할당된 값을 읽어와 1을 더하고 증가된 값을 다시 변수n에 대입한다
		//2)n+= 1; // 바로 위와 똑같은 같은 코딩 표현만 다름 // 복합대입연산자 +=
		//3)n++; // 후위형 증감연산자 Ex05_07.JAVA
		//4)++n; // 전위형 증감연산자
		System.out.println( n ); //11
		
	
		//어떤 기억공간(n)의 값을 1감소 시키는 코딩 1)2)3)4) 같은 코딩임
	    //1)n= n - 1;
		//2)n-= 1; // 위와 같은 코딩 //복합대입연산자-=
		//3)n--;
		//4)--n;
		System.out.println( n ); //9
		
		
		//어떤 기억공간(n)의 값을 3증가 시키는 코딩
	    //1)n = n +3;
		//2)n += 3 위와 같은 코딩 //
		
		
		//this.textbox1.text = this.textbox1.text + "님 환영합니다.";
		//this.textbox1.text += "님 환영합니다."; // 위와 같은 코딩인데 표현이 쉽게 가능해서 유용함 기억해두기
	    
	}//main

}//class
