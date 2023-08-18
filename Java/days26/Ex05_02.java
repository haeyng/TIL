package days26;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.RandomAccessFile;

/**
 * @author 송해영
 * @date 2023. 8. 18. - 오전 11:13:19
 * @subject
 * @content
 */
public class Ex05_02 {

	public static void main(String[] args) throws IOException {

		int [] score = {
				//번호 국   영   수
					1, 100, 90, 90,   //4*4 한학생이 차지하는 메모리크기
					2, 70,  90,100,
					3, 100,100,100,
					4, 70, 60, 80,
					5, 70, 90, 100	
		};
		
		//성적 정보를 읽기,쓰기 작업
		String name = ".\\src\\days26\\score.dat";
		String mode = "rw";
		
		
		try (RandomAccessFile raf = new RandomAccessFile(name, mode);) {			
			for (int i = 0; i < score.length; i++) {
				long fp = raf.getFilePointer();
				System.out.printf("> 현재 파일 포인터 : %d - [%d]\n", fp, score[i]);
				raf.writeInt(score[i]); //Int라서 4바이트 단위 4
			} // for
			
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) { 
			e.printStackTrace();
		}
		
		//작업 끝난 후 일시정지 후 엔터치면 계속하게 처리
		System.out.println(">엔터치면 계속 진행합니다.");
		System.in.read();
		System.in.skip(System.in.available());
		
		//[문제]
		//모든 학생의 번호, 국, 영, 수 성적 정보를 출력
		//System.out.printf("번호:%d, 국어:%d,");
		
		int no, kor, eng, mat;
		int tot;
		double avg;
		
		try (RandomAccessFile raf = new RandomAccessFile(name, mode);) {			
			//현재 파일포인트 : 0
//			no = raf.readInt();//4바이트 만큼 정수로 읽어옴
			//현재 파일포인트 : 4
//			kor = raf.readInt();
//			eng = raf.readInt();
//			mat = raf.readInt();
			
			int 학생수 = score.length/4; //5
			for (int i = 0; i < 학생수; i++) {
				no = raf.readInt();
				kor = raf.readInt();
				eng = raf.readInt();
				mat = raf.readInt();
				tot = kor + eng + mat;
				avg = (double)tot/3;
				System.out.printf("번호:%d, 국어:%d 영어:%d 수학:%d 총점:%d 평균:%.2f\n", no ,kor, eng, mat, tot, avg);
			} // for
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) { 
			e.printStackTrace();
		}
		
		//[문제]
		//3번 학생의 수학점수를 100점에서 20점으로 수정하는 코딩하세요.
		
		
		try (RandomAccessFile raf = new RandomAccessFile(name, mode);) {	
			long pos = (4*4)*2 + 4+4+4; //16자리 두명 //   3번 학생 수학점수는 44위치
			raf.seek(pos);
			raf.writeInt(20);
			mat = raf.readInt();

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) { 
			e.printStackTrace();
		}
		
		//[문제]
		//3번 학생의 번호,국,영,수,총,평 만 출력하는 코딩하세요.

		try (RandomAccessFile raf = new RandomAccessFile(name, mode);) {	
			long pos = (4*4)*2;
			raf.seek(pos);
			
			no = raf.readInt();
			kor = raf.readInt();
			eng = raf.readInt();
			mat = raf.readInt();
			
			tot = kor + eng + mat;
			avg = (double)tot/3;
			
			System.out.printf("번호:%d, 국어:%d 영어:%d 수학:%d 총점:%d, 평균:%.2f\n", no ,kor, eng, mat, tot, avg);			

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) { 
			e.printStackTrace();
		}
		
		
		System.out.println("end");
		
	}//main

}//class
