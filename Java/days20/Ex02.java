package days20;

import java.util.Date;

public class Ex02 {

	public static void main(String[] args) {

		int year = 2023;
		int month = 8;
		
		int lastDay = Ex01.getLastDay(year, month);
		int dayOfWeek = getDayOfWeek(year, month, 1);
		
		Date startDay = new Date(year-1900, month-1, 1);
		startDay.setDate(startDay.getDate()- dayOfWeek);
		
		//System.out.println(startDay.toLocaleString());
		
		int m ; //출력할때 날짜
		for (int i = 1; i <=42; i++) {
			m = startDay.getMonth()+1;
			if (month==m) {
				System.out.printf("%d\t",startDay.getDate());
			} else {
				System.out.printf("\t");
			}
			if (i%7==0) System.out.println();
			startDay.setDate(startDay.getDate()+1);
		} // for
		
	}//main
	public static int getDayOfWeek(int year, int month,int date) {
		Date d = new Date(year-1900, month-1, date);
		return d.getDay(); //0일~6토
	}
	
	public static boolean isEqualsDate(Date d1, Date d2) {
		int index = 10;// .toLocaleString().lastIndexOf(".");
		d1.setHours(0);
		d1.setMinutes(0);
		d1.setSeconds(0);
		d2.setHours(0);
		d2.setMinutes(0);
		d2.setSeconds(0);
		
		//String s1 = d1.toLocaleString().substring(0,index);
		//String s2 = d2.toLocaleString().substring(0,index);
		//return s1.equals(s2);
		return d1.equals(d2);
	}
}//class
