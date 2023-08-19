package days10;

import java.util.Random;

public class Ex07 {

	public static void main(String[] args) {
		
		//[랜덤하게 한글 이름을 입력]
		
		//											44032	55203
		//System.out.printf("%d\t%d\n",(int)'가',(int)'힣');
		
		
		Random rnd = new Random();	
		char one = (char)(rnd.nextInt('힣'-'가' + 1)+ '가');
		System.out.println(one);
		
	}//main

}//class
