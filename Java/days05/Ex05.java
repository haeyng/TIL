package days05;

public class Ex05 {
	public static void main(String[] args) {
		// 조건문 : if
		// 분기문 : switch
		// 반복문 : for                  , foreach(확장for문)
		// 기타 : break, continue
		// 조건반복문 : while, do~while 
		
		//for 반복문과 while 조건반복문의 차이점? 언제 사용할지
		//반복횟수가 정해져있으면 for문     
		//반복조건이 정해져있으면 while문
		
		//[while문 자동완성 3가지 뜻]-------------------------
		/*[컬렉션(collection)] //컬렉션 안에 열거자,반복문이 있음
		[열거자] 반복해서 처리
		while (en.hasMoreElements()) {
			type type = (type) en.nextElement();
		-------------------------------------------------------*/
		/*[반복자] 반복해서 처리
		while (it.hasNext()) {
			type type = (type) it.next();
		--------------------------------------------------------*/
		/*while (condition) {
		 * //조건식이 참일 동안 계속 반복해서 {} 블럭을 실행한다. 거짓이 되면 while문 빠져나감
		}//while-----------------------------------------------------------------------*/
		
		
		
		// [ 1~10까지 합 ( while문 ) ]
		/*[1]-----------------------------------------------------
		int i = 1, sum = 0;
		while (i<=10) {
			System.out.printf("%d+",i);
			sum+=i;
			i++;  //없으면 i가 계속 1이니까 1증가시키는 것을 추가해야함
		}
		System.out.printf("=%d\n",sum);---------------------*/
		
		/*[2]---------1번에서 i값 초기화를 0으로 변경해도 1~10합을 출력하고 싶을때?
		int i = 0, sum = 0;
		while (i<10) {    // 11
			i++;               // 11 
			System.out.printf("%d+",i); // 1+2+...+11+
			sum+=i;          // 66
		}
		System.out.printf("=%d\n",sum);*/
		
		
		//[3]
		int i = 0, sum = 0;
		while (++i<=10) {            //전위형, 후위형 값 다른것 확인하기
	  //while (i++<=10) {           //맨처음 비교할때는 0이고 내려갈때 1로 내려감//마지막에 10비교해도 내려갈때 1이 더해져 11로 됨
			System.out.printf("%d+",i);
			sum+=i;
		}
		System.out.printf("=%d\n",sum);
		
		
		
		
		
		
		
		
	}//main
}//class
