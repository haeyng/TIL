package days20;

import java.text.DecimalFormat;
import java.text.ParseException;

/**
 * @author 송해영
 * @date 2023. 8. 9. - 오후 2:21:41
 * @subject
 * @content
 */
public class Ex07_02 {

	public static void main(String[] args) {
			
		String strMoney = "1,234,567";
		int money;
		
		
		//[2] DecimalFormat 사용
		String pattern = "#,###";
		DecimalFormat df = new DecimalFormat(pattern);
		//strMoney =  df.format(money);
		try { //패턴에 일치하지 않으면 예외발생
			Number num = df.parse(strMoney);
			money =  num.intValue();
			System.out.println(money);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		//int money = 1234567;
		//System.out.println(money);
		
		/* [1]
		strMoney = strMoney.replaceAll(",", "");
		System.out.println(strMoney); //"1234567"
		
		money = Integer.parseInt(strMoney);
		System.out.println(money); //1234567
		*/
		
		
	}//main

}//class
