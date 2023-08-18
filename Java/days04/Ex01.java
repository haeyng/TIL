package days04;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Ex01 {

	public static void main(String[] args) throws IOException {
		String name;
		int kor,eng,mat;
		int total;
		double avg;
		
		BufferedReader br = new BufferedReader (new InputStreamReader(System.in));
		System.out.print(">이름, 국어, 영어, 수학을 입력하세요");
		String inputData = br.readLine();
		
		
		String regex="[, ]"; //콤마(,)나 공백한칸( )을 구분자로 쓸수있음
		//단어 사이에는 콤마로 구분돼 있는데 콤마 앞뒤에 공백이 존재할 가능성이 있다.
		//String 클래스에 있는 split 매서드로 처리하면 단어 앞뒤에 있는 공백이 처리가 안되고 그대로 문자열에 대입이 된다
		//regex에 있는 split 매서드를 이용하면 정규 표현식을 통해 일치한 부분으로 구분할수있으므로
		//String 클래스에 있는 split 매서드보다 유연하게 처리가 가능하다!
		//리턴되는 것은 여러개로 자르다보니 String 배열이 자료형임. 배열도 하나의 자료형임
		String [] datas = inputData.split(regex);
	

		name = datas[0];
		// java.lang.NumberFormatException:For input string: " 90   "
		// 입력할 때 90 앞뒤에 공백 때문에 오류가 남
		// 공백을 제거해야됨 datas[1].trim() 넣어서 공백제거함
		kor = Byte.parseByte(datas[1]);
		eng = Byte.parseByte(datas[2]);
		mat = Byte.parseByte(datas[3]);
		
		total = kor+eng+mat;
		avg = (double)total/3;
		
		System.out.printf("이름=\"%s\",국어=%d,영어=%d,수학=%d,총점=%d,평균=%.2f",name,kor,eng,mat,total,avg);
	}

}
