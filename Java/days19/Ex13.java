package days19;

import java.util.Date;

/**
 * @author 송해영
 * @date 2023. 8. 8. - 오후 4:18:05
 * @subject 달력그리기 - Date 클래스 
 * @content 
 */
public class Ex13 {

	public static void main(String[] args) {

		//년도, 달 입력받음
		int year = 2023;
		int month = 8;
		
		Date today = new Date(); //오늘 날짜 객체 2023.8.8
		int t_year = today.getYear() + 1900;
     	int t_month = today.getMonth() +1;
     	int t_date = today.getDate();
		
		int dayOfWeek = getDayOfWeek(year, month, 1); //요일을 가져오는 함수
		int lastDay = getLastDay(year, month);//그달의 마지막날을 돌려주는 함수
		
		
		
		//System.out.println(dayOfWeek + "/" + lastDay);
		
		 Date d = new Date(year -1900, month - 1, 1 ); // 2023.8.1
	       int date = d.getDate() - dayOfWeek;
	       d.setDate(date);
	       // System.out.println( d.toLocaleString());
	       for (int i = 1; i <= 42; i++) {
	          // System.out.println( d.toLocaleString());
	    
	    	   int y = d.getYear() +1900;
	    	   int m = d.getMonth() +1;
	    	   int dd = d.getDate();
	    	   
	    	   if (t_year == y && t_month == m && t_date ==dd) {
	    		   System.out.printf("[%d]\t", d.getDate() ); 
			}else {
	    	   System.out.printf(m == month?"%d\t":"(%d)\t", d.getDate() ); 
			}
	    	   
	    	   //년,월,일이 같아야됨 [8]
	          //System.out.printf(m == month?"%d\t":"(%d)\t", d.getDate() ); 
	          if( i%7==0) System.out.println();
	          date = d.getDate() + 1 ; 
	          d.setDate(date); 
	       } // for

		
		
	}//main

	private static int getLastDay(int year, int month) {
		Date d = new Date(year-1900, month, 1);
		int date = d.getDate() - 1;
		d.setDate(date);
		return d.getDate();
	}

	private static int getDayOfWeek(int year, int month, int date) {
		Date d = new Date(year-1900, month-1, date);
		return d.getDay(); //0일~6토
	}

}//class
