package days19;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author 송해영
 * @date 2023. 8. 8. - 오후 2:46:52
 * @subject
 * @content
 */
public class Ex10 {

	public static void main(String[] args) {

		//정규표현식 (Regular Expression) == 정규식
		//String					regex
		//- 문자열 속에 원하는 조건(패턴)과 일치하는 문자열을 찾아내기 위해서 사용된다.
		//- 미리 정의된 기호
		//- 자바에서는 정규표현식과 관련된 클래스가 2개 밖에 없다.
		//   String.matches(regex)
		//	  1) Pattern 클래스
		//	  2) Matcher 클래스
		


		String [] data = {"bat","baby","bonus","cA","ca","co", "c.", "c0", "car"
                , "combat", "count", "date", "disc", "fx"};
		
		
		//1) data 배열에 들어있는 단어들 중에 c로 시작하는 단어를 모두 찾아서 출력.
		//     ㄴdata[i].startsWith("c")
		//		ㄴdata[i].matches(regex)
		
		
		// String regex = "c.*";
		// String regex = "c[a-zA-Z]*";// c로 시작하면서 영문자 0개 이상은 올 수 있다
		//String regex = "c[a-z]"; //c로 시작하면서 소문자 1개 == 2 문자
		//String regex = "c\\w"; //     '\w'
		//String regex = "c[a-zA-Z0-9]"; //     '\w' 하고 같은 의미!
		//String regex = ".*"; //  .  모든 문자 * 반복횟수 0~무한대 //문자로 이루어진것 다 출력
		//String regex = "c.*t"; //c로 시작하고 t로 끝나는 모든 문자열
		
		//String regex = "c[0-9]";
		//String regex = "c\\d"; //"c[0-9]"; 하고 같은 의미
		
		//String regex = "c[^0-9]"; //[^  ] ^는 부정. 숫자는 아니어야된다는뜻
		//String regex = "c\\D"; //"c[^0-9]"; 하고 같은 의미
		
		//    \\s 공백       \\S 공백이 아닌것 (!공백)
		
		//String regex = "(b|c).*"; //b나 c
		//String regex = "[bc].*"; //b나 c        "(b|c).*" 같은 의미
		
		//String regex = "[bcd].{2}"; //두개 
		//String regex = "[bcd].{2,3}";  //두개 또는 세개
		//String regex = "[bcd].+";  //한개 이상
		//String regex = "[bcd].?";  //1개 또는 0개
		
		//String regex = "[bcd].*"; 
		//String regex = "[b-d].*"; // "[bcd].*"; 같은 의미
		 
		String regex = "[a-zA-Z&&[^b-d]].*"; //소문자,대문자 중에 소문자 bcd 제외한 알파벳  0~여러개
		
		
		Pattern p = Pattern.compile(regex);  //정규표현식 객체 만듦
		
		for (int i = 0; i < data.length; i++) {
			Matcher m = p.matcher(data[i]);
			if( m.matches()) {
				System.out.println(data[i]);
			}
		} // for
		
		
		
		
		
		
		
		
		
		
		
	}//main

}//class
