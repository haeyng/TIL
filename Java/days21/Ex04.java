package days21;

import java.text.MessageFormat;
import java.text.ParseException;

/**
 * @author 송해영
 * @date 2023. 8. 10. - 오전 10:30:23
 * @subject
 * @content
 */
public class Ex04 {

	public static void main(String[] args) throws ParseException {

			String source = "번호:1,이름:홍길동,주소:서울 양천구 목동";
//		   위의 문자열에서 MessageFormat 클래스를 사용해서
//		   번호,이름,주소만 얻어와서 아래와 같이 출력하세요.
//		   
//		   [출력형식]
//		    1
//			홍길동
//			서울 양천구 목동

			int no;
			String name;
			String addr;
			
			
			/*
			//MessageFormat 형식화 클래스를 사용하지 않으면
			int index = source.indexOf("이름:");
			//System.out.println(index); //5
			int beginIndex = index + "이름:".length();
			int endIndex = source.indexOf(",",index);
			name= source.substring(beginIndex,endIndex);
			System.out.println(name);
			*/
			
			//MessageFormat.format(,); 
			String pattern = "번호:{0},이름:{1},주소:{2}";
			MessageFormat mf = new MessageFormat(pattern);
			Object [] objArr = mf.parse(source);
			
			// Type mismatch: cannot convert from Object to int
			//java.lang.ClassCastException 클래스 형변환 예외 발생
			//() cast 강제형변환 ( 상속 관계 ) ...  days15일차 E, R, S, T를 떠올리며 복습
			//no = (int) objArr[0];//1
			
			//"1"->1
			no = Integer.parseInt(objArr[0].toString());
			
			name = (String) objArr[1]; // 홍길동
			addr = (String) objArr[2];  // 주소 
			
			System.out.println(no);
			System.out.println(name);
			System.out.println(addr);
			
	}//main

}//class
