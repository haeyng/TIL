package days17;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

/**
 * @author 송해영
 * @date 2023. 8. 4. - 오후 5:02:45
 * @subject 파일 읽어서 출력 + try~catch~finally문
 * @content 한 문자 <- int fr.read()
 * 					한 라인
 */
public class Ex02_02 {

	public static void main(String[] args) {

			String fileName = "C:\\Setup.log";
			FileReader fr = null;
			BufferedReader br = null;
			
			try {
			 fr = new FileReader(fileName); //FileReader fr 에서 FileReader 삭제			 
			 br = new BufferedReader(fr); //다형성 , 업캐스팅 
			 
			 
			 String line = null;
			 int lineNumber =1;
			 while ((line = br.readLine()) != null) {
				//System.out.println(line);
				 System.out.printf("%d : %s\n", lineNumber++, line);
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
						br.close();
					} catch (IOException e) {				
						e.printStackTrace();
					}
				} // if
			}
			
			//Unhandled exception type FileNotFoundException
			//FileReader fr = new FileReader(fileName);
			
			
	}//main

}//class
