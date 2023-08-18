package days03;

public class Ex01 {

	public static void main(String[] args) {

		String name = "홍길동";
		System.out.printf("%s\n",name);        //홍길동
		System.out.printf("[%s]\n",name);      //[홍길동]
		System.out.printf("[%10s]\n",name);  //[       홍길동] 
		// [%10s]에서 10은 너비 10자리를 우측정렬하라는 뜻, 공백 7글자 홍길동 3글자
		System.out.printf("[%-10s]\n",name); //[홍길동       ] 좌측정렬
		
		//byte %d short %d int %d long %d
		//위에 것들도 %o를 이용해 8진수 형태로 출력 가능
		//%x로 16진수형태로 출력할 수 있다
		
		int n = 50;
		System.out.printf("%d\n",n);   //50
		System.out.printf("%o\n",n);   //62 (8진수)
		System.out.printf("%#o\n",n); //062 #붙이면 0이 붙는다:flag가 붙는다고 표현함
		System.out.printf("%x\n",n);   //32 (16진수)
		System.out.printf("%#x\n",n);   //0x32 #붙이면 0x가 붙음:flag가 붙는다고 표현함
		
		double pi = 3.141592;
		System.out.printf("%f\n", pi);
		System.out.printf("%.3f\n", pi);        // 자동으로 반올림 처리해서 셋째자리까지 출력
		System.out.printf("[%10.3f]\n", pi);  //10자리 확보하고 우측정렬, 소수점 3자리 출력
		System.out.printf("[%-10.3f]\n", pi); //10자리 확보하고 좌측정렬, 소수점 3자리 출력
		
		int no = 1; // 0001 와 같은 4자리 숫자형태로 출력하려고 할때는
		System.out.printf("%d\n",no);     //1
		System.out.printf("%4d\n",no);   //   1
		System.out.printf("%04d\n",no); //0001
		// ->출력하려는 자릿수 숫자 앞에 0을 붙이면 0001로 출력된다 *** 기억하기!)
		
		System.out.printf("%d(%c)\n", 65, 65);  // 65(A)
		
		//System.out.printf("%d(%c)\n",65); 
		// 65가 같아 한번에 %d와 %c에 입력하고 싶어서 그냥 하나만 써버리면 오류남
		//java.util.MissingFormatArgumentException: Format specifier '%c' 
		//뜻: %c 포맷의 argument가 빠져서(=%d 뒤에 %c에 들어갈 값이 빠졌다) 오류 
		
		System.out.printf("%1$d(%1$c)\n",65); //1$ :첫번째 매개변수를 두개에 적용한다
		
		//System.out.printf("홍길동"); 
		//이것도 실행하면 print처럼 홍길동으로 출력됨
		//printf 함수 정확하게 이해가 필요함
		
		
	}

}
