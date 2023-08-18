package days18;

import java.util.Arrays;

/**
 * @author 송해영
 * @date 2023. 8. 7. - 오후 3:05:25
 * @subject
 * @content
 */
public class Ex08_03 {

	public static void main(String[] args) {

		String s = "안녕하세요. 입니다. 입니다. 입니다.";
		String name = "홍길동";

		/*
		//첫 번째 "입니다."을 찾아서 앞에 "홍길동"을 붙여서 아래처럼 출력되기를 원함
		//"안녕하세요. 홍길동입니다. 입니다. 입니다.";
		
		//int index = s.indexOf('입'); // int <- 자동형변환'입' .... 앞에서부터 찾음
		int index = s.indexOf("입니다"); //7
		s = s.substring(0,index) + name + s.substring(index); //index 7을 기준으로 잘라서 홍길동을 넣음
		
		System.out.println(index);
		*/
		
		//(문제)
		//마지막 "입니다" 를 찾아서 그 앞에 "홍길동"을 붙이자.
		//"안녕하세요. 입니다. 입니다. 홍길동입니다.";
		
//		int index = s.lastIndexOf("입니다."); //뒤에서부터 찾음
//		s = s.substring(0,index) + name + s.substring(index);
//		System.out.println(s);

		/*
		String [] sArr = s.split("입니다");
		System.out.println(Arrays.toString(sArr));
		*/
		
		
//		int fromIndex = 0;
//		int firstIndex = s.indexOf("입니다", fromIndex);
//		System.out.println(firstIndex); //7
//		fromIndex = firstIndex +"입니다".length();
//		int secondIndex = s.indexOf("입니다", fromIndex);
//		System.out.println(secondIndex);//12
		
		int fromIndex = 0;
		int index = -1;
		while ((index=s.indexOf("입니다",fromIndex)) != -1) {
			System.out.println(index);
			fromIndex = index + "입니다".length();
		}
		
		//함수로 만들어보기
		//메서드 : indexOf()
		//매개변수 String target, String sw, int no
		//리턴값 : int index;
		
		
		"abc".toUpperCase(); //"ABC"
		"abc".toLowerCase(); //"abc"
		
		
		// String [] "홍길동,김길동,이길동".split(regex)
		
		String [] nameArr = "홍길동,김길동,이길동,박길동".split(",",2);
		for (int i = 0; i < nameArr.length; i++) {
			System.out.println(nameArr[i]); // , 두개로 자름
		} // forr
		
		
		
	}//main
	

}//class




