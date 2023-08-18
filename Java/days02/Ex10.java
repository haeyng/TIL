package days02;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 *@author 송해영
 *@date 2023. 7. 16.-오후 7:21:16
 *@subject
 *@content
 */
public class Ex10 {

	public static void main(String[] args) throws IOException {

			//나이 정수 (0~125) byte, shor, int,long
			Byte age = 0;
			
			BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
			
			System.out.print("나이 입력 >");
			
			// age = br.readLine();이렇게 입력하면 
			// 오류 두개가 뜨는데 첫번째 Type mismatch: cannot convert from String to byte
			// -자료형 불일치, 문자열에서 바이트로 바꿀수없다 age가 byte 이기 때문에
			// 두번째 Unhandled exception type IOException - 예외처리를 해야 한다.
			
			//age=Byte.parseByte(br.readLine());
			String inputData = br.readLine();
			age = Byte.parseByte(inputData); //"20"
			
			//byte,short,int,long ->%d
			System.out.printf("나이는 %d살 입니다.\n",age);		
	}
}
