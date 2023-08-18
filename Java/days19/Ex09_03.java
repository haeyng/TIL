package days19;

import java.io.FileReader;
/**
 * @author 송해영
 * @date 2023. 8. 8. - 오후 2:29:36
 * @subject 대,소문자 + 0~9 숫자 갯수 출력
 * @content
 */
public class Ex09_03 {

	public static void main(String[] args) {

		String path = ".\\src\\days19\\Ex01.java"; //맨앞에 . 은 현재 디렉토리
		
		//int [] 대counts = new int [26];
		//int [] 소counts = new int [26];
		//1) int [] numArr = new int [10];
		//0행 : 대문자, 1행 : 소문자       "가변배열 선언"
		int [][] counts = new int [3][];
		counts[0] = new int [26];
		counts[1] = new int [26];
		counts[2] = new int [10];
		
		
		try (FileReader fr = new FileReader(path)){
				int code;
				char one;
				while ((code = fr.read()) != -1) {
					//System.out.println(code);
					one = (char)code;
					if(Character.isUpperCase(one)) {
						counts[0][one-'A']++;
					}else if(Character.isLowerCase(one)){
						counts[1][one-'a']++;
					}else if(Character.isDigit(one)) {
						//2)numArr[one-'0']++;
						counts[2][one-'0']++;
					}
					}//while
				//막대그래프
				for (int i = 0; i < counts.length; i++) {
					System.out.printf("[%c]문자\n", i==0?'대': i ==1? '소' :'숫');
					for (int j = 0; j < counts[i].length; j++) {
						System.out.printf("%c(%d) : %s\n"
								, i==0?j+'A': i==1? j+'a':j + '0'
								, counts[i][j]
								,"#".repeat(counts[i][j]));
					} // for
				} // for
				
				//3) for문 숫자
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}//main

}//class
