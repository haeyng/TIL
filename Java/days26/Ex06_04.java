package days26;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;

/**
 * @author 송해영
 * @date 2023. 8. 18. - 오후 2:15:35
 * @subject
 * @content
 */
public class Ex06_04 {

	public static void main(String[] args) {

		//days26 폴더 안에 있는 모든 파일을 검색해서 
		//"fileName" 문자열을 찾아서 문자열을 가지고 있는 파일명과 라인번호를 출력.
		String pathname = ".\\src\\days26";
		String keyword = "fileName";
		
		File parent = new File(pathname);
		File [] list = parent.listFiles();
		File f = null;
		String line = null;
		int lineNumber=1;
		
		for (int i = 0; i < list.length; i++) {
			f = list[i];
			lineNumber=1;
			String fileName = f.getName();
			System.out.printf("-----%s-----\n", fileName); //파일 목록 출력 //if문 안에 넣으면?
			
			try (FileReader in = new FileReader(f);
					BufferedReader br = new BufferedReader(in)){
	
				while ((line = br.readLine())!=null) {
	
					if (line.contains(keyword)) {
						line.replaceAll(keyword, "["+keyword+"]");
						System.out.printf("%d : %s\n",lineNumber , line);
					} // if
					lineNumber++;
				}//while
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}//catch
			
		} // for
		
		
		
		
		
		
		
		
	}//main

}//class
