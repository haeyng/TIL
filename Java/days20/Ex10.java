package days20;

import java.text.MessageFormat;

/**
 * @author 송해영
 * @date 2023. 8. 9. - 오후 3:16:22
 * @subject MessageFormat
 * @content 데이터값을 특정형식에 맞춰서 출력
 * 					특정형식에 맞춰져있는 데이터값을 읽기작업할때 씀
 */
public class Ex10 {

	public static void main(String[] args) {
		String name = "이준희";
		int age = 20;
		boolean gender = true;
		
		/*[1]
		//위의 데이터(값)들을 특정형식으로 출력
		String output = String.format("이름은:%s, 나이:%d살, 성별:%s",name, age, gender);
		System.out.println(output);
		*/
		
		//[2]MessageFormat
		//이름은:이준희, 나이:20살, 성별:true
		String pattern = "이름은:{0}, 나이:{1}살, 성별:{2}";
		String output = MessageFormat.format(pattern, name, age, gender );
		System.out.println(output);
		
		//SQL
		//INSERT INTO board (no, title, writer, content, regdate)
		// VALUES({0},'{1}','{2}'.'{3}',{4})"
		
	
		
	}//main

}//class
