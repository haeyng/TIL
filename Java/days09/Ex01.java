package days09;
/**
 *@author 송해영
 *@date 2023. 7. 25.-오후 8:00:14
 *@subject
 *@content
 */
public class Ex01 {

	public static void main(String[] args) {
		
		int money = 125760;
		int unit = 50000;
		// 5만원/5 =>1만원/2 => 5천원/5 => 1천원/2 => 5백원.... 2,5 번갈아가면서 나눠줌
		
		boolean sw = false; // 스위치 변수
		int count = 0;//갯수를 저장할 변수
		
		while (unit>=1) { //1원 나올때까지 반복
				count = money / unit;
				System.out.printf("%d원 : %d개\n", unit , count);
				money = money % unit;
				
//				if (sw==false) unit = unit / 5; 
//				else                unit = unit / 2;
				unit /= !sw ? 5 : 2 ; //위 두줄과 같은 코딩
				
				sw = !sw;//참 거짓 바꿔주는 코딩
				
		}//while
	}//main
}//class
