package days08;

public class Ex09_03 {

	public static void main(String[] args) {
	
		int [] lotto = new int [6];
		
		fillLotto(lotto); 
		
		dispLotto(lotto);
		
}//main	
	public static void fillLotto(int[] lotto) {
		int index = 0;
		int lottoNumber= (int)(Math.random()*45)+1;
		lotto[index++] = lottoNumber;
		boolean flag = false; // 로또번호가 중복이 되면 true 할당.
		
		while (index<=5){ 
			flag = false;
			lottoNumber= (int)(Math.random()*45)+1;     //  12
			
			//isDuplicateLotto()중복이 되면 true, 중복이 되지 않으면 flase
			if (!isDuplicateLotto(lotto,lottoNumber, index))  //중복 체크 후 중복되지 않을 때만 lotto[index++] = lottoNumber; 
				lotto[index++] = lottoNumber; 			
			
			}//while
		
		/*
		for (int i = 0; i < lotto.length ; i++) {
			int lottoNumber = (int)(Math.random() * 45)+1;
			lotto[i] = lottoNumber;
		} // for
		*/
		
	}
	
// 시험 외우기 함수만들어서 코딩
	private static boolean isDuplicateLotto(int[] lotto, int lottoNumber, int index) {
		for (int i = 0; i < index; i++) {
			if(lotto[i]==lottoNumber) {
				return true;
			}//if
		} // for
		return false;
	}

	public static void dispLotto(int [] lotto) { 
		for (int i = 0; i < lotto.length; i++) {
			System.out.printf("lotto[%d]=[%02d]\n",i,lotto[i]);
		} // for
		System.out.println();
	}

}//class
