package days25;

import java.io.File;
import java.io.FileWriter;

public class Ex07_02 {

	public static void main(String[] args) {

		//실행 후에 
		//1. 저장할 파일명을 입력하세요. kenik.txt 엔터
		//2. 저장할 문자열(Data) 입력하세요. 내일은 금요일 엔터
		//입력한 문자열이 파일에 저장되게
		//계속 입력할지? y
		// 저장할 문자열 입력? 엔터
		//계속 입력할지? n
		
		//[파일 저장]
		String pathName = ".\\src\\days25\\sample.txt";
		File file = new File(pathName);
		
		//파일의 존재 유무를 true/false값으로 반환하는 함수
		//System.out.println(file.exists());  //false
		
		//														boolean형으로 append(뒤에 누적시킨다는 뜻)
		//  파일 + 문자 출력용 스트림
		// 파일 새로 생성 + 덮어쓰기 됨
		try ( FileWriter fw = new FileWriter(file, true) ) { //true속성에 의해서 write 메서드에 작성된것이 계속 뒤에추가됨 //false하면 덮어쓰기 됨
			/*
			fw.append('a');	
			fw.append("append_string");
			
			fw.write(98);//='b'
			fw.write("write_string");
			*/
			fw.write("새로 실행해서 텍스트 추가");
			//쓰기 + 추가   는    fr 출력용 *스트림*에 쓰기+추가작업이 된 것이다.   (중요!)
			
			//fw.flush(); // 스트림을 비우는 것
			
			//fw.close(); //파일 스트림을 close하게 되면 flush메서드를 적지 않아도 자동적으로 flush가 일어남
			
			System.out.println(" end ");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		

		
		
		
		
		
		
	}//main

}//class
