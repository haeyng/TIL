package days17;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

/**
 * @author 송해영
 * @date 2023. 8. 4. - 오후 5:02:45
 * @subject 파일 읽어서 출력 + try~catch~finally문
 * @content
 */
public class Ex02 {

	public static void main(String[] args) {

			String fileName = "C:\\Setup.log";
			FileReader fr = null;
			try {
			 fr = new FileReader(fileName); //FileReader fr 에서 FileReader 삭제
			 
			 /*
				int one = fr.read();
				System.out.println(one);
				one = fr.read();
				System.out.println(one);
				one = fr.read();
				System.out.println(one);
				one = fr.read();
				System.out.println(one);
				one = fr.read();
				System.out.println(one);
				*/
			 
			 int one;
			 while ((one = fr.read()) != -1) {
				System.out.printf("%c",(char)one);
			}

			} catch (FileNotFoundException e) {
				e.printStackTrace();
			}catch (IOException e) {
				e.printStackTrace();
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				if (fr != null) { //객체가 있었다면
					try {
						fr.close(); //fr 지역변수라 오류
					} catch (IOException e) {				
						e.printStackTrace();
					}
				} // if
			}
			
			//Unhandled exception type FileNotFoundException
			//FileReader fr = new FileReader(fileName);
			
			
	}//main

}//class
