package days03;

import java.util.Calendar;

/**
 *@author 송해영
 *@date 2023. 7. 17.-오후 9:06:17
 *@subject
 *@content 에러메세지 시험1)
 */
public class Ex02 {

	public static void main(String[] args) {
		
		//System.out.printf("%d\n","홍길동");
		//오류메세지:java.util.IllegalFormatConversionException: d != java.lang.String
		//%뒤에 있는d나s를Conversion이라고함
		//뜻 : %d는 문자열출력하는 conversion이 아니다. %s로 바꿔야함
		
		Calendar c = Calendar.getInstance(); //Calendar에 밑줄 눌러서 import문 추가함
		System.out.printf("%1$tm %1$te %1$tY\n",c); // 07 17 2023 월 일 연도 를 가져오는 출력서식 tm,te,ty
		//외울필요X 자주 안씀
		
		//%[argument_index$][flags][width][.precision]conversion 기본형식 -> 암기할 필요는 X
		
		System.out.printf("%1$c %1$C\n",'a'); // 대문자C를 넣으면 대'문자'로 출력
		System.out.printf("%1$x %% %1$X\n", 30); //x는 16진수로 출력
		//%%두개 찍으면 % 한개 출력됨 여기서 %는 리터럴임
		//%%에서 앞에 %는 '%[기본형식]conversion'에서 맨앞에 있는 퍼센트 
		//뒤에%는 conversion의 퍼센트
		
		System.out.printf("%(d\n", -123); //음수일때 (괄호 flag를 붙인다
		System.out.printf("%,d\n", 12323423); // 자주씀 꼭 외우기!! 중요
		//콤마 flag를 붙이면 세자리 마다 콤마를 찍어줌
		
		//도움말 자주 봐서 익히기 
		//https://docs.oracle.com/en/java/javase/11/docs/api/index.html
		//https://docs.oracle.com/en/java/javase/20/docs/api/java.base/java/util/Formatter.html#syntax
		
		

	}

}
