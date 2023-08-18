package days16;

import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

public class Ex04 {

	public static void main(String[] args) {

		// Employee emp = new Temp();   upcasting
		
		// upcasting  다형성
		List list = new ArrayList();
		

	    test(new ArrayList());  // new Regular()
	    test(new Vector());     // new SalesMan()
	} // main
	
	// upcasting                              매개변수 다형성
	public static void test(List list) {  // (Employee emp)
		
	}//main

}//class


