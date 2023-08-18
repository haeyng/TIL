package days26;

import java.io.DataInput;
import java.io.DataOutput;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.RandomAccessFile;

/**
 * @author 송해영
 * @date 2023. 8. 18. - 오전 10:36:50
 * @subject Piped[Reader] / Piped[Writer]
 * @content - 스레드 간에 데이터를 입력/출력할 때 사용하는 스트림이다.
 * 
 * 					[RandeomAccess File]
 * 				랜덤하게(임의의 위치에 있는 데이터) 접근	    + 파일 스트림 (하나의 클래스로 읽기쓰기가 다 가능, 읽기,쓰기 따로 두개 쓸 필요가 없다.)
 					: 파일의 어느 위치에나(원하는 위치에) 읽기/쓰기가 가능한 장점이 있는 스트림이다.
 					- DataOutput, DataInput 각각 상속 받음
 						출력스트림	입력스트림 이 둘다 구현(implement)이 되어 있기 때문에 읽기/쓰기용 스트림으로 가능하다.
 						
 					- seek(위치값)      내가 원하는 위치로 이동시키는 함수
 					- getFilePoint()    파일 포인트; 내가 현재 있는 위치를 알아올때 사용하는 함수 
 					- readXXXX()      읽기용
 					- writeXXXX()     쓰기용
 */
public class Ex05 {

	public static void main(String[] args) throws IOException {

		String s = "I Love normal Java";
		String q = "javabook";
		
		String name = ".\\src\\days26\\random.txt";
		String mode = "rw"; //r 은 읽기용도로 쓰겠다는 뜻 //w는 쓰기 용도로 쓰겠다는 뜻 //rw 읽기,쓰기용도로 쓰겠다는 뜻
		
		try (RandomAccessFile raf = new RandomAccessFile(name, mode);) {
			long cp = raf.getFilePointer();
			//System.out.println(cp);
			raf.writeBytes(s);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) { //e 지역변수
			e.printStackTrace();
		}
		
		//쓰기작업 끝난 후 일시정지 후 엔터치면 계속하게 처리
		
		System.out.println(">엔터치면 계속 진행합니다.");
		System.in.read();
		System.in.skip(System.in.available()); //13,10번값 제거
		
		try (RandomAccessFile raf = new RandomAccessFile(name, mode);) {
			//임의의 위치로 이동 시켜서 이동된 임의의 위치에서 읽기,쓰기 작업하려고 함
			raf.seek(7);
			raf.writeBytes(q);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//작업 끝난 후 일시정지 후 엔터치면 계속하게 처리
		System.out.println(">엔터치면 계속 진행합니다.");
		System.in.read();
		System.in.skip(System.in.available()); //13,10번값 제거
		
		
		try (RandomAccessFile raf = new RandomAccessFile(name, mode);) {
			raf.seek(2);
			String line = raf.readLine();
			System.out.println(line);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		System.out.println(" end ");
		
	}//main

}//class
