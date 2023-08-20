package days26;

import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;

/**
 * @author 송해영
 * @date 2023. 8. 18. - 오전 9:00:49
 * @subject Data[InputStream]/Data[OutputStream]
 * @content 
 * 					- 기본형 8가지를 읽기/쓰기 가능한 바이트 스트림
 */				
public class Ex01 {

	public static void main(String[] args) {

		String name = "이지현";
		int kor = 32, eng = 29, mat = 40;
		int tot = kor + eng + mat ;
		double avg = (double)tot/3;
		boolean gender = true;
		
		//한 학생의 정보를 student[.txt] 파일에 저장하려고 할 때
		//FileWriter		   문자 파일 스트림
		//BufferedWriter 문자 보조 스트림
		String fileName = ".\\src\\days26\\student.txt";
		
		try ( FileWriter out = new FileWriter(fileName, true);
				BufferedWriter bw = new BufferedWriter(out)){
			
			String data = String.format(
					"%s,%d,%d,%d,%d,%f,%b\n"
					, name, kor, eng, mat, tot, avg, gender);// 공백xxx
			bw.append(data);
			bw.flush(); 
			System.out.println(data);
			
		} catch (Exception e) {
			e.printStackTrace();
		}//catch
			
		System.out.println("end");
		
	}//main

}//class
