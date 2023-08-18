package days02;

import java.util.Scanner;

/**
 *@author 송해영
 *@date 2023. 7. 16.-오후 11:00:07
 *@subject br
 *@content Scanner 클래스 (읽기 위한 용도의 클래스-키보드가 아니어도 된다)
 */
public class Ex17_02 {

	public static void main(String[] args) {

		// 이름, 국어, 영어, 수학을 입력받아서
		// 총점, 평균을 계산하고
		// [출력형식]
		// 홍길동님은 국:89 영:78 수:56 총점:000 평균:00.00 이다.
		
		String name;
		byte kor, eng, mat;
		short total;
		double avg;
		
		// Resource leak: 'sc' is never closed : 리소스 손실이 있으니 sc를 다 썼으면 sc를 닫으라는 뜻 안닫으면 낭비일뿐이지 오류는 아님
		Scanner sc = new Scanner(System.in); //(System.in)는 키보드로부터 스트림을 읽어오겠다는뜻 그리고 그것으로부터 스캔하겠다는 의미.
		
		System.out.print("> 이름 국어 영어 수학 입력 ? ");
		name = sc.next();    // String
		kor = sc.nextByte(); // byte
		eng = sc.nextByte(); // byte
		mat = sc.nextByte(); // byte
		
		//sc.next(); sc에 next();라는 매서드는 문자열을 읽어와서 name이라는 변수에 집어넣는다
		// 나머지 세개는 바이트 값을 읽어와 변수에 집어넣는다는 뜻
		
		//int로 바꾸고 싶으면 nextInt double로 바꾸고 싶으면 nextDouble을 쓰면 된다 각 자료형별로 next뒤에 함수가 있다
		
		
		// Type mismatch: cannot convert from int to short
		total = (short) (kor + eng + mat);
		avg = (double)total/3;
		System.out.printf("%s님은 국:%d 영:%d 수:%d 총점:%d 평균:%.2f 이다." //구분자는 스페이스로 해야된다 콤마는 따로 설정해야함 
				,name, kor, eng,mat, total, avg );
		
		
       sc.close();
		
	}

}
