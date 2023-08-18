package days20;

import java.util.Date;

/**
 * @author 송해영
 * @date 2023. 8. 9. - 오전 10:49:23
 * @subject
 * @content
 */
public class Ex03 {

	public static void main(String[] args) {
		//개강일 (2023.7.13.9:00:00)
		Date sday = new Date(2023-1900,7-1,13,9,0,0);
		System.out.println(sday.toLocaleString());
		Date today = new Date();
		System.out.println(today.toLocaleString());
		//두 날짜의 차
		
		dispDiffDays(sday,today);
		
		
		/*
		System.out.println(sday.getTime());//1689206400000
		System.out.println(today.getTime());//1691546642287		
		//long diff = today.getTime()-sday.getTime();
		*/
		
		/*
		long diff = today.getTime()-sday.getTime();
		
		System.out.println(diff+"ms"); //ms의 차이
		System.out.println(diff/1000+"s"); //s의 차이
		System.out.println(diff/1000/60+"m"); //m의 차이
		System.out.println(diff/1000/60/60+"h"); //h의 차이
		System.out.println(diff/1000/60/60/24+"h"); //day의 차이 27일 차이
		
		System.out.println(diff/(1000*60*60*24)+"h"); //day의 차이 27일 차이
		
		*/
		
		// ??일 ??시간 ???분 ??초 ??밀리세컨드 차이나는지 출력
		
		//diff = today.getTime()-sday.getTime();
		//System.out.println(diff);

	}

	public static void dispDiffDays(Date sday, Date eday) {
		long diff = eday.getTime()-sday.getTime();
		
		long 몫 = diff / (1000*60*60*24);
		System.out.printf("%dd-",몫);
		diff %= (1000*60*60*24);
		
		몫 = diff / (1000*60*60);
		System.out.printf("%dh-",몫);
		diff %=(1000*60*60);
		
		몫 = diff / (1000*60);
		System.out.printf("%dm-",몫);
		diff %=(1000*60);
		
		몫 = diff / (1000);
		System.out.printf("%ds-",몫);
		diff %=(1000);
		
		몫 = diff / 1;
		System.out.printf("%dms\n",몫);

		try {
			Thread.sleep(1000); //1000으로 하면 1초마다
		} catch (InterruptedException e) {
			e.printStackTrace();
		} //10ms 만큼 잠깐 쉰다
		
		//dispDiffDays(sday, new Date());
	}

}
