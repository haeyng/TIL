package days02;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Ex09_02 {

	public static void main(String[] args) throws IOException {
		
		BufferedReader br = new BufferedReader( new InputStreamReader(System.in) );
		
		
		System.out.print("> 이름을 입력하세요 ?");
		
		String name;
		name= br.readLine();
	
		System.out.printf("> 이름 : %s", name);
	}

}
