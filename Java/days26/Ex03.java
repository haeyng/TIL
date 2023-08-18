package days26;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.SequenceInputStream;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Vector;

/**
 * @author 송해영
 * @date 2023. 8. 18. - 오전 10:10:58
 * @subject 		Sequence[InputStream]
 * @content	순차적인 기능이 있는 바이트 입력용(읽기용도) 스트림
 * 					- 하나의 파일 용량이 너무 커서 여려개의 파일로 분리했다고 가정하면 
 * 						그 분리된 파일을 읽어와야할 때 사용한다.
 * 					- 여러개의 입력 스트림을 연속적으로 연결해서 
 * 						하나의 스트림으로 데이터를 처리할 수 있는 바이트 스트림이다.
 */
public class Ex03 {

	public static void main(String[] args) throws IOException {

		// 하나의 데이터가 1,2,3
		//						4,5,6
		//						7,8,9 있다고 가정 
		
		byte [] a = {1,2,3};
		byte [] b = {4,5,6};
		byte [] c = {7,8,9};
		
		//byte [] -> ByteArrayInputStream 메모리 스트림
		
		ByteArrayInputStream bais1 = new ByteArrayInputStream(a);
		ByteArrayInputStream bais2 = new ByteArrayInputStream(b);
		ByteArrayInputStream bais3 = new ByteArrayInputStream(c);
		
		
		/*
		//bias1 ~ bias3 까지의 바이트스트림을 순차적으로 읽어와서 처리하려고 함 :SequenceInputStream 사용
		 * [첫번째 방법]
		SequenceInputStream sis = new SequenceInputStream(bais1, bais2);
		SequenceInputStream sis2 = new SequenceInputStream(sis, bais3);
		*/
		
		
		//[두번째 방법] 순서가 있는 컬렉션 클래스를 하나 선언해서 bias1,2,3을 순차적으로 집어넣고 난 후에 컬렉션 클래스를 통해서 열거형 객체를 가져와야함.
		//List : ArrayList (열거형이 안보임..), vector 중에 선택
		/*
		ArrayList<ByteArrayInputStream> list = new ArrayList<ByteArrayInputStream>();
		list.add(bais1); //순차적으로 들어가는게 중요함 set 계열 사용x
		list.add(bais2);
		list.add(bais3);
		
		Enumeration<ByteArrayInputStream> en = list. ...> 열거형이 안보여서 안씀 vector로 바꿔서 씀
		*/
		
		
		Vector<ByteArrayInputStream> list = new Vector<ByteArrayInputStream>();
		Enumeration<ByteArrayInputStream> en = list.elements();
		list.add(bais1); //순차적으로 들어가는게 중요함 set 계열 사용x
		list.add(bais2);
		list.add(bais3);
		SequenceInputStream sis = new SequenceInputStream(en);
		
		int code;
		while ((code =sis.read()) != -1) {
			System.out.println(code);
		}//while
		
		
		
		
		
	}//main

}//class
