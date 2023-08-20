package days26;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;

public class Ex06_07 {

	public static void main(String[] args) {

		//주말 과제
		//javaPro 폴더 및 하위 폴더 안에 있는 모든 파일을 찾아서 keyword = "fileName"
		//검색한 후에 파일명, 라인번호 출력...

		findInFiles("C:\\Users\\ming\\eclipse-workspace\\javaPro");		

	}//main

	private static void findInFiles(String path) {
		
		String keyword = "fileName";
		File parent = new File(path);		
		File [] list = parent.listFiles();
		File f = null;;
		String line;
		int lineNumber=1;
		
		for (int i = 0; i < list.length; i++) {
			f= list[i];	
			lineNumber=1;
			String fileName = f.getName();
			System.out.printf("-----%s-----\n", fileName);
			
			try (FileReader in = new FileReader(f);
					BufferedReader br = new BufferedReader(in)) {
				
				while ((line=br.readLine())!=null) {
					
					if (line.contains(keyword)) {
						line.replaceAll(keyword, "[" + keyword + "]");
						System.out.printf("%d : %s\n", lineNumber, line);						
					} //if
					lineNumber++;
				}				
			} catch (Exception e) {
				e.printStackTrace();
			}					
			
			/*//FileName 들어간 내용 라인들 출력
			if (f.isDirectory()) {
				findInFiles(f.getPath());
			} else {
				try (FileReader fr = new FileReader(list[i]);
						BufferedReader br = new BufferedReader(fr);
						) {
					while ((line = br.readLine())!=null) {
						if (line.contains("fileName")) {						
							//System.out.println(FileLine); //FileName 들어간 내용 라인들 출력
						} //if					
					}//while					
				} catch (Exception e) {
					e.printStackTrace();
				}//catch
				
			} //if	
			*/
			
		} //for	
		
	}
	
}//class