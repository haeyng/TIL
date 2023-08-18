package days26;

import java.io.File;
import java.io.FilenameFilter;

import com.util.FileUtil;

public class Ex06_03 {

	public static void main(String[] args) {

		//days26 폴더 안에 java 파일만 골라서 조회
		
		String pathname = ".\\src\\days26";
		File dir = new File(pathname);
		
		
		//2번 풀이를 람다식으로 수정함
		File [] list = dir.listFiles( ( d, n) -> n.endsWith(".dat") );
		for (File file : list) {
			System.out.println(file.getName());
		}//foreach
		
		
		/* 풀이 2번
		File [] list = dir.listFiles(new FilenameFilter() {
			@Override
			public boolean accept(File dir, String name) {
				//System.out.println(dir + "***" + name);
				return name.endsWith(".dat");
			}
		});
		
		for (File file : list) {
			System.out.println(file.getName());
		}
		*/
		
		
		
		/* 풀이 1번
		//String [] dir.list();
		File [] list = dir.listFiles();
		for (int i = 0; i < list.length; i++) {
			if(list[i].isFile()) {
				String fileName = list[i].getName();
				//.java
				if(fileName.endsWith(".java")) {
					System.out.println(fileName);
				}//if
			}//if			
			//FileUtil.getExtension(fileName).equals(".java")		
		} // for
		*/
	}//main

}//class
