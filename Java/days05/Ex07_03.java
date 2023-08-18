package days05;

public class Ex07_03 {

	public static void main(String[] args) {
		// 조건문 if
		// 분기문 switch
		// 반복문 for         [foreach]  배열, 컬렉션의 반복처리에 사용
		// 조건반복문 while , do~while
		// 기타   break, continue
		
		//1.정수 10개 저장할 배열 m을 선언
		//2.임의의 정수 (1~100)를 각 배열의 요소에 저장
		//3.for문을 사용해서 각 배열의 요소를 출력.

		int [] m = new int [10];
		
		//1<=(int)Math.random()*100+1<101  //임의의 정수 (1~100)
		
		m [0] =(int)(Math.random()*100)+1;
		m [1] =(int)(Math.random()*100)+1; 
		m [2] =(int)(Math.random()*100)+1; 
		m [4] =(int)(Math.random()*100)+1; 
		m [5] =(int)(Math.random()*100)+1; 
		m [6] =(int)(Math.random()*100)+1; 
		m [7] =(int)(Math.random()*100)+1; 
		m [8] =(int)(Math.random()*100)+1; 
		m [9] =(int)(Math.random()*100)+1 ;
		                              
		/*
		for (int i = 0; i < m.length; i++) {
			 	m[i]=(int)(Math.random()*100)+1 ;			 			 
			 	System.out.printf("m[%d]=%d\n", i, m[i]);// m[0]=37(랜던한값) ~ m[9]=33 출력됨
		} //for
		*/
		
		for (int n : m) { //m배열 안에 있는 요소를 하나씩 가져와서 n변수에 저장하고 출력 (변수명은 원하는대로 정하고)
			System.out.println( n );
		}//foreach
		
	}//main
}//class
