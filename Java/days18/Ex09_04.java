package days18;
/**
 * @author 송해영
 * @date 2023. 8. 7. - 오후 5:14:09
 * @subject
 * @content
 */
public class Ex09_04 {

	public static void main(String[] args) {
		
		/*
	      문제 설명
	      길이가 n이고, "수박수박수박수...."와 같은 패턴을 유지하는 문자열을 리턴하는 함수, 
	      solution을 완성하세요. 예를들어 n이 4이면 "수박수박"을 리턴하고 3이라면 "수박수"를 리턴하면 됩니다.

	      제한 조건
	      n은 길이 10,000이하인 자연수입니다.
	      입출력 예
	      n   return
	      3   "수박수"
	      4   "수박수박"
	      */
		
		String answer = solution(5);
		System.out.println(answer);

	}//main
	
	//	StringBuffer sb = new StringBuffer();
	//  sb.append( "수박".repeat(n/2) );
	//  sb.append( "수".repeat(n%2) );   
	
	public static String solution(int n) {
		// String answer = "";
		// answer += "수"; // "박"
		// return answer;
		StringBuffer sb = new StringBuffer();
		 
		int 몫 = n/2;
		for (int i = 0; i < 몫; i++) {
			sb.append("수박");
		} // for
		int 나머지 = n%2;
		if(나머지 == 1 ) sb.append("수");
		
		return sb.toString();
	}
	/*
	
	
	/*
	private static String solution(int n) {
		StringBuffer sb = new StringBuffer();
		boolean sw = true;
		
		for (int i = 0; i < n; i++) {
			if (sw) {
				sb.append("수");
			} else {
				sb.append("박");
			}
			sw = !sw;
		} // for
		*/

		
		/*
		for (int i = 0; i < n; i++) {
			if (i%2==0) {
				sb.append("수");
			} else {
				sb.append("박");
			}
		} // for		
	return sb.toString();		
		 */
	

}//class
