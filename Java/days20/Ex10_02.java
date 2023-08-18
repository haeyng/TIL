package days20;

import java.text.MessageFormat;
import java.text.ParseException;

/**
 * @author 송해영
 * @date 2023. 8. 9. - 오후 3:16:22
 * @subject MessageFormat - 암기하기
 * @content 데이터값을 특정형식에 맞춰서 출력
 * 					특정형식에 맞춰져있는 데이터값을 읽기작업할때 씀
 */
public class Ex10_02 {

	public static void main(String[] args) {

		String source = "이름:이준희, 나이:20살, 성별:true";
		String pattern = "이름:{0}, 나이:{1}살, 성별:{2}";
		
		//MessageFormat.format(pattern, args)
		MessageFormat mf = new MessageFormat(pattern);
		try {
			Object [] objs = mf.parse(source);
			for (Object obj : objs) {
				System.out.println(obj);
			}
			
		} catch (ParseException e) {
			e.printStackTrace();
		}

		
		
		
		
		
	}//main

}//class
