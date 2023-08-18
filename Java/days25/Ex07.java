package days25;

import java.io.File;
import java.io.FileReader;

/**
 * @author 송해영
 * @date 2023. 8. 17. - 오후 2:17:33
 * @subject
 * @content
 */
public class Ex07 {

	public static void main(String[] args) {
		//상대경로
		String pathName = ".\\src\\days25\\Ex01.java"; //맨앞에 .은 상대경로(기준이 있는경로) 현재 디렉토리 기준임! javaPro까지로 정해져있음..
		
		
		/*
		String parent=".\\src\\days25";
		String child = "Ex01.java";
		File f = new File(parent, child);
		 */
		
		
		//File 클래스 : 파일, 폴더(디렉토리)를 다루는 클래스
		//				다룬다는 것? 파일이나 폴더를 생성,이름변경,삭제,정보를 얻어오고 ..등 을 하는 것
		
		File file = new File(pathName);
	
		//파일 크기를 알고 싶음
		System.out.println(file.isDirectory()); //false ".\\src\\days25"; 일때는 true나옴
		System.out.println(file.isFile()); //true 지금 f가 Ex01.java 파일이기 때문에
		
		System.out.println(file.length());//파일의 크기 , 단위는 byte
		
		long fileLength = file.length();
		System.out.printf(">파일 크기 : %d(bytes)\n", fileLength);
		
		
		try ( FileReader fr = new FileReader(file) ) {
			
			/*
			fr.read();
			fr.read(char [] cbuf);
			fr.read(CharBuffer target);
			fr.read(char [] cbuf,  int offset, int length);
			*/
			
			
			int code;
			//fr.read(); // /u0000~/uffff 까지의 한 문자를 읽어와서 int 정수로 돌려줌
			
			//라인 단위로 처리하는 보조 스트림을 사용하면 라인 번호를 앞에 붙일때 더 코딩이 쉬워진다.
			while ((code=fr.read())!=-1) {//====> 한문자씩 읽어오기 때문에 라인 번호 붙이기 번거로움, 못하는건 아님
				System.out.printf("%c", (char)code);
			}//while
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
	}//main

}//class
