package days26;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import com.util.FileUtil;

/**
 * @author 송해영
 * @date 2023. 8. 18. - 오후 4:09:21
 * @subject 하나의 파일을 잘라서 여러 개의 파일로 분할(생성)
 * @content
 */
public class Ex06_08 {

	public static void main(String[] args) {

		String parent = ".\\src\\days26";
		String child = "시간표_(5강의실)(디지털컨버전스)AWS 클라우드와 Elasticsearch를 활용한 Java(자바) Full-Stack 개발자 양성과정(I).v1.hwp";
		
		File f = new File(parent,child);
		
		System.out.println("> 파일 크기 : "+f.length()+"(byte)");//> 파일 크기 : 293376(byte)
				
		//10kb = 1024 * 10 byte
		final int VOLUME = 10 * 1024; //10kb
		//"시간표.hwp"
		//      ↓ 잘라서
		//시간표_1.hwp
		//시간표_2.hwp
		//시간표_3.hwp
		
		//필요한것
		//확장자를 제외한 순수 파일명
		String baseName =  FileUtil.getBaseName(child);
		//확장자를 가져오는 작업
		String ext = FileUtil.getExtension(child);
		//System.out.println(baseName);//파일명
		//System.out.println(ext);//확장자

		int code = 0;
		int i = 0; //10kb씩 증가..몇kb읽었는지.. 카운트 변수
		int index = 0; //파일을 자른 숫자 번호
		
		FileOutputStream fos = null;
		BufferedOutputStream bos = null;
		//null로 선언한 이유 : 새로 만들때마다 new로 생성되지 않게 
		
		try (FileInputStream fis = new FileInputStream(f);
				BufferedInputStream bis = new BufferedInputStream(fis);) {
			
			while ((code = bis.read())!=-1) {
				
				//10kb       fos객체 생성 후 저장   파일명 _1(index++).hwp
				//fos 객체 생성 10kb읽어와서 저장	파일명_2.hwp
				//fos 객체 생성 10kb읽어와서 저장 	파일명_3.hwp
				//스트림 끝날때까지 반복
				
				if (i % VOLUME == 0) {
					if(i != 0) bos.close();//저장되고 스트림 닫음
					
					child = String.format("%s_%d%s", baseName, ++index, ext);
					System.out.println(child);
					
					File temp = new File(parent,child);
					fos = new FileOutputStream(temp);
					bos = new BufferedOutputStream(fos);
				} // if
				bos.write(code);
				i++;
				System.out.printf("[%d]\n",i);
			}//while
			
			System.out.println(" end ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}//main

}//class
