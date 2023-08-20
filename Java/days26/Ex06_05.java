package days26;

import java.io.File;

/**
 * @author 송해영
 * @date 2023. 8. 18. - 오후 2:33:36
 * @subject
 * @content
 */
public class Ex06_05 {

	public static void main(String[] args) {

		//days26 폴더 안에 upload 폴더 유무 확인 후, 없으면 폴더를 생성하려고 함
		String pathname = ".\\src\\days26";
		File dir = new File(pathname, "upload");
		
		//리턴자료형
		//boolean  1. createNewFile() : 파일 새로 생성
		//											이미 생성할 파일이 존재하면 false
		//	File		2. createTempFile("파일명","확장자명") : 임시 파일 생성
		//					c:\\windows\\TEMP 파일 생성한다
		
		//	boolean 3.delete() : 파일 삭제
		// 3-1			deleteOnExit() : 응용 프로그래밍이 종료할 때 파일을 삭제.(임시파일 삭제할때 주로 사용함...)
		
		//boolean 4. renameTo(File) : 매개변수인 파일객체의 파일명을 변경하는 메서드
		//boolean 5. mkdir() : make directory 폴더 생성
		//boolean		midirs() : 						 폴더들 생성
		
		//							days26\\temp\\upload
		//											부모폴더 먼저 생성
		
		if( !dir.exists()) {
				System.out.println(dir.mkdir()); //true
				//dir.mkdirs();
		}else {
			dir.delete();
		}//if
		
	}//main

}//class
