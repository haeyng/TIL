package days18;

import java.io.BufferedReader;
import java.io.FileReader;

/**
 * @author 송해영
 * @date 2023. 8. 7. - 오후 4:13:30
 * @subject
 * @content
 */
public class Ex08_05 {

	public static void main(String[] args) {
		
		//E:\Class\workspace\JavaClass\javaPro
		String userDir = System.getProperty("user.dir");
		//System.out.println(userDir);
		String path = userDir.concat("\\src\\days18\\ss19.txt");
		//System.out.println(path);
		
		/*
		try(FileReader fr = new FileReader(path);){
			
			int code ;
			while ( (code =  fr.read()) != -1  ) {
				System.out.printf("%c", (char)code);			
			}		
		} catch (Exception e) {
			e.printStackTrace();
		}
		*/
		
		/*
		try(FileReader fr = new FileReader(path);
				BufferedReader br = new BufferedReader(fr)){
			String name;
			while ( (name =  br.readLine()) != null  ) {
				System.out.printf("%s\n", name);			
			}		
		} catch (Exception e) {
			e.printStackTrace();
		}//catch
		*/
		
		String [] nameArr = new String [20];
		int index = 0;
		try(FileReader fr = new FileReader(path);
				BufferedReader br = new BufferedReader(fr)){
			String name;
			while ( (name =  br.readLine()) != null  ) {
				//System.out.printf("%s\n", name);
				nameArr[index++] = name;
			}		
		} catch (Exception e) {
			e.printStackTrace();
		}//catch
		
		//String join() 메서드 ...기억해두기
		String nameTag = "<ol><li>".concat( String.join("</li><li>", nameArr)).concat("</li></ol>");
		
		System.out.println(nameTag);
		
		
		
	}//main

}//class
