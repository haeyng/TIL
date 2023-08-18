package days25;

import java.io.FileReader;
import java.io.FileWriter;

/**
 * @author 송해영
 * @date 2023. 8. 17. - 오후 3:19:30
 * @subject
 * @content
 */
public class Ex07_03 {

	public static void main(String[] args) {
			//파일 복사
		String pathName = ".\\src\\days25\\Ex01.java";//복사할 파일
		String copyPathName = ".\\src\\days25\\Ex01_Copy.java";//복사해서 만들 파일
		
		//> 복사 처리하는데 걸린 시간 : 38354800(ns)
		fileCopy_textStream(pathName, copyPathName);
		
		
	}//main
						//복사여부 리턴자료형 boolean으로 줌
	private static boolean fileCopy_textStream(String pathName, String copyPathName) {
		
		long start = System.nanoTime();
		
		try ( FileReader fr = new FileReader(pathName);
				FileWriter fw = new FileWriter(copyPathName, true)) {
			
			int code;
			
			while ((code=fr.read())!=-1) {
				fw.write(code);//파일에 쓰기작업
				System.out.println(code);
			}
			fw.flush();//마지막에 남은 자투리 비우는것
			
			System.out.println("파일 복사 완료됨.");
			
			long end = System.nanoTime();		
			System.out.printf("> 복사 처리하는데 걸린 시간 : %d(ns)\n", (end-start));
			
			return true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}

}//class
