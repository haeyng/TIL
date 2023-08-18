package days20;

import java.util.Date;

public class Ex01 {

	public static void main(String[] args) {

		int year = 2005;
		//1월 : 31일
		for (int i = 1; i <=12; i++) {
			System.out.printf("%d월 : %d일\n", i , getLastDay(year,i));
		} // for
			
	}//main

	public static int getLastDay(int year, int month) {
		Date d = new Date(year-1900, month, 1);
		d.setDate(d.getDate()-1);
		return d.getDate();
	}
	
}//class
