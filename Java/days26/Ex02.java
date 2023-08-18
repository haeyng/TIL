package days26;

import java.io.BufferedWriter;
import java.io.DataOutputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;

/**
 * @author 송해영
 * @date 2023. 8. 18. - 오전 9:00:49
 * @subject Data[InputStream]/Data[OutputStream]
 * @content 
 * 					- 기본형 8가지를 읽기/쓰기 가능한 바이트 스트림
 */				
public class Ex02 {

	public static void main(String[] args) {

		String name = "이지현";
		int kor = 32, eng = 29, mat = 40;
		int tot = kor + eng + mat ;
		double avg = (double)tot/3;
		boolean gender = true;
		
		//한 학생의 정보를 student[.txt] 파일에 저장하려고 할 때
		//FileWriter			문자 스트림
		//BufferedWriter 문자 보조 스트림
		String fileName = ".\\src\\days26\\student.dat"; //바이트 스트림이라서 dat파일(data) 형식이 나을것같음       .ini
		try ( FileOutputStream out = new FileOutputStream(fileName, true) ; 
				DataOutputStream dos = new DataOutputStream(out);)
		{
			dos.writeUTF(name);
			dos.writeInt(kor);
			dos.writeInt(eng);
			dos.writeInt(mat);
			dos.writeInt(tot);
			dos.writeDouble(avg);
			dos.writeBoolean(gender);
			
			dos.flush();
			
		} catch (Exception e) {
			e.printStackTrace();
		}//catch
			
		System.out.println("end");
		
		
		
	}//main

}//class
