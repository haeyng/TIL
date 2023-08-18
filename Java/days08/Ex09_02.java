package days08;

public class Ex09_02 {

	public static void main(String[] args) {

		//배열 선언 및 생성
		//배열을 초기화 하지 않으면 기본형의 초기값으로 설정되어져 있음. //여기서는 int                    기억해두기
		int [] lotto = new int [6];
		
		fillLotto(lotto); //로또번호채워넣을 함수
		
		//lotto 배열을 출력하는 dispLotto() 함수 선언 + 호출
		//lotto[0]=20		
		dispLotto(lotto); 		
	}//main

//	//중복되는 숫자가 나오기 때문에 중복되지 않는 로또 번호로 배열을 채우도록 코딩 수정
//	public static void fillLotto(int[] lotto) {
//		for (int i = 0; i < lotto.length; i++) {
//			int lottoNumber = (int)(Math.random()*45)+1;
//			lotto[i] = lottoNumber;
//		} // for
//	}중복체크안한것
	
	//중복되는 숫자가 나오기 때문에 중복되지 않는 로또 번호로 배열을 채우도록 코딩 수정
	//while 중복되지 않게 6개 배열 다 채울 때까지 - 반복 조건
	//index = 0
	public static void fillLotto(int[] lotto) {
		int index = 0; // 0번째 공간에 채울 변수 선언
		//int lottoNumber; //임의의 로또번호 값을 저장할 변수
		int lottoNumber= (int)(Math.random()*45)+1;
		lotto[index++] = lottoNumber;
		boolean flag = false; //로또 번호가 중복이 된다면 true값을 할당하려고함
		
		while (index<=5){ //배열의 요소에 로또번호를 모두 채울때까지 반복 1~5번째 공간에
			flag = false;
			lottoNumber= (int)(Math.random()*45)+1;
			
			//중복 번호 체크
			for (int i = 0; i < index; i++) {
				if(lotto[i]==lottoNumber) {
					flag = true;
					break;
				}//if
			} // for
			if(!flag) lotto[index++] = lottoNumber; 
			}//while
		
		/*
		for (int i = 0; i < lotto.length ; i++) {
			int lottoNumber = (int)(Math.random() * 45)+1;
			lotto[i] = lottoNumber;
		} // for
		*/
		
		
	}

	public static void dispLotto(int [] lotto) { //int [] lotto      int 배열을 매개변수로 받는
		
		for (int i = 0; i < lotto.length; i++) {
			System.out.printf("lotto[%d]=[%d]\n",i,lotto[i]);
		} // for
		System.out.println();
	}

}//class
