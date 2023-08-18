package days09;

import java.security.SignatureException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.swing.text.SimpleAttributeSet;

public class Ex03_02 {

	public static void main(String[] args) {

		String rrn = "990123-1700001";
		
		int age = 0;
		
		//주민등록번호 -> 나이
		//세는나이 countingAge
		age = getCountingAge(rrn);
		System.out.println("> 세는 나이 : "+ age);
		//만 나이 AmericanAge
		age = getAmericanAge(rrn);
		System.out.println("> 만 나이 : "+ age);
		
		//             2019.12.31     20.1.1		20.12.31		21.1.1
		//세는나이 :       1살				2살			2살				3살
		//만 나이 :        0살				0살			1살				1살
		
	
	}//main
	
	private static int getAmericanAge(String rrn) {
		//생일이 오늘날짜 지남 여부 체크
		//생일이 지나지 않았다면 -1
		//만나이 = (올해년도 - 생일년도 +1)-1]             -1(o,x) -1할때는 생일이 안지난경우
		//         = 세는나이 -1            생일(-1)?
		//생일이 지났는지 안지났는지 여부 체크
		
		
		//생일 1999.1.23           123
		//오늘 2023.7.25           725
		//오늘 날짜 725에서 생일 123을 빼줌
		//723 -123 >=0 이면 생일이 지남   0살 빼줌
		//                                          -1살
		
		//1999.1.23           .1.23             "123"
		int birthMMdd = Integer.parseInt(getBirth(rrn).substring(4).replace(".",""));
		
		
		/*[1] calendar 클래스 사용 월/일
		Calendar c = Calendar.getInstance();
		//년도 = c.get(Calendar.YEAR)
		int thisMMdd = c.get(Calendar.MONTH); //7
		int thisDat = c.get(Calendar.DATE); //25
		int thisMMdd = thisMonth *100 +thisDay; //725
		*/
	
		//[2] 2023[0725] ==725 Date 클래스 사용 월/일
		/*
		Date d = new Date();
		//년도 d.getYear()+1900
		int thisMonth = d.getMonth()+1; //1월 0 12월 11
		d.getDate();
		int thisDay = d.getDate();
		int thisMMdd = thisMonth * 100 + thisDay;
		*/
		
		//[3] SimpleDateFormat
		Date d = new Date();
		String pattern = "MMdd";
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);	
		int thisMMdd = Integer.parseInt(sdf.format(d));//725
		
		
		//[4]
		//1999.1.23
		//2023.7.25
		//날짜와 날짜 비교
		
		
		boolean flag = thisMMdd - birthMMdd>=0; // true 생일지남
		
		int americanAge = getCountingAge(rrn) -1 + (flag? 0 : -1);
		
		return americanAge;
	}

	private static int getCountingAge(String rrn) {
		//올해 2023년도
		//[1]
		//Calendar c= Calendar.getInstance();
		//int thisYear = c.get(Calendar.YEAR);
		
		//[2]
		Date  d =new Date();//java.util로 sql 아님
		int thisYear= d.getYear() + 1900;  // 줄그어진것 앞으로 안쓸예정이라는 뜻
		
		//생일 1999년도                        1999.1.23
		int birthYear = Integer.parseInt(getBirth(rrn).substring(0, 4));
		
		//세는 나이 = 올해년도 - 생일년도 +1
		int countingAge = thisYear - birthYear +1;
		return countingAge;

	}
	//성별 ㅅ 돌려주는 함수
	 public static int getGender(String rrn) {
	      //return  Integer.parseInt(rrn.substring(7, 8));
	      return rrn.charAt(7)-'0';     // '0' 48
	   }
	
	
	//yyy-MM-dd
public static String getBirth(String rrn) {
    // rrn = "890123-1700001"
    int year =  Integer.parseInt( rrn.substring(0, 2) );
    int month = Integer.parseInt( rrn.substring(2, 4) );
    int day = Integer.parseInt( rrn.substring(4, 6) );
    // System.out.printf("%s.%s.%s\n", year, month, day);
    // "1999.01.23"
    // 1800, 1900, 2000
    int ㅅ = getGender(rrn);
    
    int centry = 1800;
    switch ( ㅅ ) {
       case 1: case 2: case 5: case 6:
          centry = 1900;
          break;
       case 3: case 4: case 7: case 8:
          centry = 2000;
          break;
       case 9: case 0 :
          centry = 1800;
          break;
    } // switch
    year = centry + year;
    String birthday = String.format("%d.%d.%d", year, month, day);
    
    return birthday;
 }



}//class