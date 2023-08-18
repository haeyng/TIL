package days26;

import java.io.File;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.Date;

/**
 * @author 송해영
 * @date 2023. 8. 18. - 오후 12:22:38
 * @subject [javaPro 모든 하위 폴더, 파일 목록 정보 조회] 
 * @content
 */

public class Ex06_02 {

	public static void main(String[] args) {

		String currentDirectory = System.getProperty("user.dir");
		System.out.println(currentDirectory); //E:\Class\workspace\JavaClass\javaPro
		
		File parent = new File(currentDirectory);
		System.out.println(parent.isDirectory()); //true
		
		
		
		/*
		String [] list = parent.list();//디렉토리 안의 하위 폴더,파일 목록을 돌려줌
		//File [] list = parent.listFiles(); //
		
		for (int i = 0; i < list.length; i++) {
			//System.out.println(list[i]);
			File f = new File(parent, list[i]); //파일 객체 생성
			System.out.printf( "%s\t%s\t%d\n",f.isDirectory()?"[폴더]": "파일", f.getName(),f.length());
		} // for
		*/
		
		
		//long값을 읽어서 ->LocalDateTime -> DateFo~~~도 가능
		
		String pattern = "yyyy-MM-dd a h:mm";
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		
		File [] list = parent.listFiles(); // 파일 객체 생성 안해도 됨
		for (int i = 0; i < list.length; i++) {
		
			// list[i].canWrite() //읽기전용 파일은 쓸수없음 false
			//long list[i].lastModified(); //수정한 날짜 정보   ----> Date
			
			Date date = new Date(list[i].lastModified());
			String 수정날짜 = sdf.format(date);
			
			System.out.printf( "%s\t%s\t%d\t%s\n"
						,list[i].isDirectory()?"[폴더]": "파일"
						, list[i].getName()
						,list[i].length()
						,수정날짜);
		} // for
		
		
		
		
		
		
		
		
	}//main

}//class
