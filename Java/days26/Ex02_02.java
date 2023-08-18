package days26;

import java.io.DataInputStream;
import java.io.FileInputStream;
/**
 * @author 송해영
 * @date 2023. 8. 18. - 오전 9:00:49
 * @subject Data[InputStream]/Data[OutputStream]
 * @content 
 * 					- 기본형 8가지를 읽기/쓰기 가능한 바이트 스트림
 * 					바로 읽기쓰기 작업이 가능하다는 것이 중요한 포인트
 */				
public class Ex02_02 {

	public static void main(String[] args) {

		String name ;
		int kor, eng , mat ;
		int tot  ;
		double avg ;
		boolean gender;
		
		//한 학생의 정보를 student[.dat] 파일에서 읽어오려고 할 때
		//FileWriter			문자 스트림
		//BufferedWriter 문자 보조 스트림
		String fileName = ".\\src\\days26\\student.dat";
		try ( FileInputStream in = new FileInputStream(fileName);
				DataInputStream dis = new DataInputStream(in))
		{
			//데이터를 순서대로 집어넣은것을 알고 있어야 read 메서드 사용
			name = dis.readUTF();
			kor = dis.readInt();
			eng = dis.readInt();
			mat = dis.readInt();
			tot = dis.readInt();
			avg = dis.readDouble();
			gender = dis.readBoolean();
			
			System.out.printf("%s %d %d %d %f %b\n"
		               , name , kor, eng, mat, avg, gender);
			
		} catch (Exception e) {
			e.printStackTrace();
		}//catch
			
		System.out.println("end");
		
		
		
	}//main

}//class
