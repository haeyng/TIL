package days02;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Ex17 {
	public static void main(String[] args) throws IOException {
		// 이름, 국어, 영어, 수학을 입력받아서
		// 총점, 평균을 계산하고
		// [출력형식]
		// 홍길동님은 국:89 영:78 수:56 총점:000 평균:00.00 이다.
		
		String name;
		byte kor, eng, mat;
		short total;
		double avg;
		
		BufferedReader br = new BufferedReader (new InputStreamReader(System.in));
		System.out.print("이름을 입력하세요 >");
		name = br.readLine();
		System.out.print("국어 점수를 입력하세요 >");
		kor = Byte.parseByte(br.readLine());
		System.out.print("영어 점수를 입력하세요 >");
		eng = Byte.parseByte(br.readLine());
		System.out.print("수학 점수를 입력하세요 >");
		mat = Byte.parseByte(br.readLine());
		
		// total = kor+eng+mat;라고 입력 하면 아래 오류메세지 뜸
		// Type mismatch: cannot convert from int to short : 자료형이 맞지 않다. 그런데 오류메세지에 마우스 갖다대면 int라고 뜬다
		// cpu는 효율성 때문에 4바이트 단위로 처리해서 int로 처리함. 그래서 kor+eng+mat는 int이다. int를 강제로 short로 형변환해줘야한다
		total = (short) (kor+eng+mat);
		avg = (double)total/3;
		
		System.out.printf("%s님은 국:%d 영:%d 수:%d 총점:%d 평균:%.2f 이다.\n",name,kor,eng,mat,total,avg);
		
	}

}
