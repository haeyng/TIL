package days25;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;

/**
 * @author 송해영
 * @date 2023. 8. 17. - 오후 3:19:30
 * @subject
 * @content
 */
public class Ex07_04 {

	public static void main(String[] args) {
			//파일 복사
		String pathName = ".\\src\\days25\\Ex01.java";//복사할 파일
		String copyPathName = ".\\src\\days25\\Ex01_Copy.java";//복사해서 만들 파일
		
		//> 복사 처리하는데 걸린 시간 : 38354800(ns)
		//> 복사 처리하는데 걸린 시간 : 1095800(ns)   보조스트림을 사용해서 복사하는데 걸린 시간이 줄어들어서 차이남
		fileCopy_textStream02(pathName, copyPathName);
		
		
	}//main
						//복사여부 리턴자료형 boolean으로 줌
	private static boolean fileCopy_textStream02(String pathName, String copyPathName) {
		
		long start = System.nanoTime();
		
		final int BUFFER_SIZE = 1024;
		
		try ( FileReader fr = new FileReader(pathName);
				FileWriter fw = new FileWriter(copyPathName, true);
				//버퍼기능이 있는 보조 스트림을 사용해서 파일을 복사하려고 함
				BufferedReader br = new BufferedReader(fr, BUFFER_SIZE);//한문자씩 말고 BUFFER_SIZE만큼 1024씩 읽기
				BufferedWriter bw = new BufferedWriter(fw, BUFFER_SIZE);
				) {
			
			/* ==> BUFFER_SIZE 사이즈가 아닌 한 라인단위로 읽는 작업
			String line = null;
			int lineNumber = 1;
			
			while ((line = br.readLine()) != null) {
				System.out.printf("%d : %s\n",lineNumber++,line);
				bw.write(line); //해도 복사가 됨
			}//while
			*/
			char [] cbuf = new char [BUFFER_SIZE]; //버퍼
			int readCharNumber = 0; //읽어온갯수의 변수
			while ((readCharNumber = br.read(cbuf))!=-1) { //리턴값 int 실제 읽어온 char의 갯수
				bw.write(cbuf, 0, readCharNumber); //쓰기작업 할때 읽어온 갯수만큼 버퍼에 작업하라는 뜻 // 1024씩 읽어오다가 마지막에 1024보다 작은 자투리 남을때 중요함
			}
			
			
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
