package days07;

public class Ex05 {

	public static void main(String[] args) {
		// [정규표현식]
		/*
		// 1. 주민등록번호 000000-0000000
		String rrn = "123456-1234567";
		String regex = "[0-9]{6}-\\d{7}";
		//숫자표현 [0-9] 나  \d
		//반복횟수  ?(0,1)   +(1,여러번)    *(0,여러번)
		//             {n}n개       {n,m} n에서m까지   {n,} 적어도 n번만큼
		if ( rrn.matches(regex)) {
			System.out.println("올바른 주민등록번호 형식이다");
		}else {
			System.out.println("잘못된 주민등록번호 형식이다");
		}
		*/
		
		// 2. 우편번호 000-000, 00000
		/*
		String zipCode = "123-456";
		String zipCode2 = "12345";
		String zipCode3 = "123456";
		String zipCode4 = "123-a45";
		String zipCode5 = "123-3456";
		*/
		String [] zipCodes = {"123-456","12345","123456","123-a45","123-3456"};
		
		String regex = "\\d{3}-\\d{3} | \\d{5}";
		boolean flag = false;
		for (int i = 0; i < zipCodes.length; i++) {
			flag = zipCodes[i].matches(regex);
			System.out.printf("%s - %s 우편번호\n"
					,zipCodes[i]
					,flag ? "올바른":"잘못된"
					);
		} // for
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
