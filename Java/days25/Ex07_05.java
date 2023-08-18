package days25;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;

/**
 * @author 송해영
 * @date 2023. 8. 17. - 오후 3:19:30
 * @subject 실행파일 복사 (exe, dll, mp4 등등 복사 )(문자로 읽으면 안되고 바이트 단위로 읽어야 됨!)
 * 					바이트 스트림을 사용해서 복사.
 * 					FileInputStream
 * 					FileOutputStream
 * 
 * 					BufferedInputStream
 * 					BufferedOutputStream
 * 			
 * @content
 */
public class Ex07_05 {

	public static void main(String[] args) {
		//파일 복사
		String pathName = "C:\\Program Files (x86)\\Windows Photo Viewer\\ImagingDevices.exe";//복사할 파일
		String copyPathName = "C:\\Users\\user\\Documents\\ImagingDevices_copy.exe";//복사해서 둘 경로와 복사할 파일

		//> 복사 처리하는데 걸린 시간 : 588822600(ns) //보조스트림 안쓰고 복사하는데 걸린 시간.
		//fileCopy_byteStream(pathName, copyPathName);

		
		//> 복사 처리하는데 걸린 시간 : 1996300(ns)
		fileCopy_byteStream02(pathName, copyPathName);//버퍼 기능이 있는 보조스트림을 사용해서 복사하는데 걸린 시간이 줄어들어서 차이남


	}//main


	private static boolean fileCopy_byteStream02(String pathName, String copyPathName) {

		long start = System.nanoTime();

		final int BUFFER_SIZE = 1024;

		try ( FileInputStream fis = new FileInputStream(pathName);
				FileOutputStream fos = new FileOutputStream(copyPathName, true);

				//보조스트림 객체선언
				BufferedInputStream bis = new BufferedInputStream(fis, BUFFER_SIZE);
				BufferedOutputStream bos = new BufferedOutputStream(fos, BUFFER_SIZE);
				) {

			byte [] b = new byte [BUFFER_SIZE];
			int readByteNumber = 0;

			while ((readByteNumber=bis.read(b))!=-1) {
				bos.write(b, 0, readByteNumber);
			}//while
			bos.flush();

			System.out.println("파일 복사 완료됨.");

			long end = System.nanoTime();		
			System.out.printf("> 복사 처리하는데 걸린 시간 : %d(ns)\n", (end-start));

			return true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}






	//복사여부 리턴자료형 boolean으로 줌
	private static boolean fileCopy_byteStream(String pathName, String copyPathName) {

		long start = System.nanoTime();

		try ( FileInputStream fis = new FileInputStream(pathName);
				FileOutputStream fos = new FileOutputStream(copyPathName, true);
				) {

			int b;
			while ((b = fis.read())!=-1) {//한바이트 읽어서 b에 저장
				fos.write(b);	
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
