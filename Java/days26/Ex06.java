package days26;

import java.io.File;
import java.io.IOException;

import com.util.FileUtil;

/**
 * @author 송해영
 * @date 2023. 8. 18. - 오전 11:49:12
 * @subject
 * @content
 */
public class Ex06 {

	public static void main(String[] args) throws IOException {
		//[File 클래스]
		//1. 가장 많이 사용되는 입출력의 대상 - 파일(중요)
		//2. 파일 + 디렉토리(폴더)
		
		String pathname = ".\\src\\days26\\Ex01.java"; //상대경로 설정했을때는 세가지 값이 다르게 나오지만 표준경로로 설정했을때는 세가지 메서드의 값이 같게 나온다.
		//String pathname = "//E:\\Class\\workspace\\JavaClass\\javaPro\\src\\days26\\Ex01.java";
		
		File file = new File(pathname);
		//file.isDirectroy();
		//file.isFile();
		//file.length();
		//file.exists();
		
		//OS에서 사용하는 경로 구분자
		System.out.println(File.pathSeparator); // ;
		//OS에서 사용하는 이름 구분자
		System.out.println(File.separator); // \

		//파일이름을 반환하는 메서드
		String fileName = file.getName();
		System.out.println(fileName); //Ex01.java

		
		//확장자 					  .java
		//확장자를 제외한 파일명 Ex01
		int pos = fileName.indexOf(".");
		System.out.println( fileName.substring(0,pos) ); //Ex01
		System.out.println( fileName.substring(pos) ); //.java
		
		System.out.println(FileUtil.getExtension(fileName));
		System.out.println(FileUtil.getBaseName(fileName));
		
		
		System.out.println("-".repeat(50));
		// 파일의 경로를 반환하는 메서드. 리턴타입 String      //위에 적어놓은 세가지 메서드 ↓
		System.out.println(file.getPath()); // 경로   //.\src\days26\Ex01.java
		System.out.println(file.getAbsolutePath()); //절대경로    //E:\Class\workspace\JavaClass\javaPro\.\src\days26\Ex01.java
		System.out.println(file.getCanonicalPath());//표준경로   //E:\Class\workspace\JavaClass\javaPro\src\days26\Ex01.java
		
		//								파일의 부모 디렉토리
		System.out.println(file.getParent()); //.\src\days26
		System.out.println(file.getParentFile()); //File 객체 반환
		
		
		
		//com.util.FileUtil.java 추가 할 것임
		
		
		
		
	
	}//main

}//class
