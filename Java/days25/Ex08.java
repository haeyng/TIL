package days25;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Arrays;

/**
 * @author 송해영
 * @date 2023. 8. 17. - 오후 4:21:04
 * @subject [메모리 스트림]
 * @content - 주로 다른 곳에 입,출력하기 전에 메모리 상에 데이터를 임시로 저장(보관)할 목적으로 사용하는 스트림이다.
 * 
 * 					-Byte		ByteArrayInputStream/ByteArrayOutputStream  .. 쓸일이 별로 없음
 * 					 Char		CharArrayReader/CharArrayWriter .. 쓸일이 별로 없음
 * 					 String   StringReader/StringWriter
 * 
 */
public class Ex08 {

	public static void main(String[] args) throws IOException {

		byte [] buf = {0,1,2,3,4,5,6,7,8,9};
		
		// byte [] -> ByteArrayInputStream를 사용해서 -> buf를 읽기작업하고(while문으로) -> ByteArrayOutputStream를 사용해서 -> byte []로 변환해서 사용
		
		//읽기(입력용) 메모리 바이트 스트림을 만듦
		ByteArrayInputStream bais = new ByteArrayInputStream(buf);
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		
		
		int code;
		while ((code =bais.read())!=-1) {
			System.out.println(code);
			baos.write(code);
		}
		byte [] outbuf =baos.toByteArray();
		System.out.println(Arrays.toString(outbuf));
		
		baos.close();
		bais.close(); //close는 항상 예외처리 해야함
		
		
	}//main

}//class
