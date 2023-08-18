package days18;

public class Ex09_03 {

	public static void main(String[] args) {

//		String으로 처리했을때 시간 : 3860240600ns  //4초
//		StringBuffer로 처리했을때 시간 : 7659000ns// 호출하자마자 찍힘 4천배 차이남
		
		//testString();
		testStringBuffer();
		
	}//main
	
	
	//String
	private static void testString() {
		long start = System.nanoTime();
		String s = "a";
		for (int i = 0; i < 200000; i++) {
			s += "a";
		} // for		
		long end = System.nanoTime();
		System.out.printf("> String으로 처리했을때 시간 : %dns\n", (end-start) );//> String으로 처리했을때 시간 : 3860240600ns  //4초
	}
	
	
	//StringBuffer
	private static void testStringBuffer() {
		long start = System.nanoTime();
		StringBuffer sb = new StringBuffer("a");
		for (int i = 0; i < 200000; i++) {
			sb.append("a");
		} // for		
		long end = System.nanoTime();
		System.out.printf("> StringBuffer로 처리했을때 시간 : %dns\n", (end-start) );//> StringBuffer로 처리했을때 시간 : 7659000ns// 호출하자마자 찍힘
	}
}//class
