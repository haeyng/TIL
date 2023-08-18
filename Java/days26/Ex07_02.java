package days26;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.ArrayList;

/**
 * @author 송해영
 * @date 2023. 8. 18. - 오후 4:42:04
 * @subject [직렬화] 	  : 객체를 스트림으로 만드는(변환) 것                중요함
 * @content [역직렬화] : 스트림을 객체로 만드는(변환) 것
 * 						-객체를 직렬화해서 읽기/쓰기 할 수 있는 바이트 스트림
 * 						Object[InputStream]
 * 						Object[OutputStream]
 * 						-직렬화가 가능한 클래스로 만들기 위해서 단지
 * 							ㄴ Serializable 인터페이스를 구현만 하면 된다.
 */
public class Ex07_02 {

	public static void main(String[] args) {

		//역직렬화
		
		String pathname = ".\\src\\days26\\UserInfo.ser";
		
		try ( FileInputStream in = new FileInputStream(pathname);
				ObjectInputStream ois = new ObjectInputStream(in); ) {
			
			//ois 스트림으로 부터 읽어들여서 u1 객체로 만드는 작업(:역직렬화)
			UserInfo u1 = (UserInfo) ois.readObject(); //첫번째 객체 읽기 //다운캐스팅
			UserInfo u2 = (UserInfo) ois.readObject(); 
			ArrayList<UserInfo> list = (ArrayList<UserInfo>) ois.readObject();  //다운캐스팅
			
			System.out.println(u1);
			System.out.println(list);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}//main		

}//class

	




