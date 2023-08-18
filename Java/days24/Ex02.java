package days24;

import java.util.Enumeration;
import java.util.Properties;

/**
 * @author 송해영
 * @date 2023. 8. 16. - 오전 11:36:53
 * @subject
 * @content
 */
public class Ex02 {

	public static void main(String[] args) {

		//[Properties 컬렉션클래스]
		//setProperty(), getProperty() 읽고 쓰기 작업
		// .  현재 디렉토리
		// .. 상위 디렉토리
		//~~\\자바프로젝트명 = 기본 폴더
		//key "user.dir" 
		//value "E:\Class\workspace\JavaClass\javaPro"
		/*
		String userDir = System.getProperty("user.dir");
		System.out.println(userDir);
		*/
		Properties sysProps = System.getProperties();
		Enumeration<Object> en = sysProps.keys();//열거형 타입
		while (en.hasMoreElements()) {
			String key = (String) en.nextElement();
			String value = System.getProperty(key);
			System.out.printf("%s : %s\n", key, value);
		}//while

	}//main

}//class
