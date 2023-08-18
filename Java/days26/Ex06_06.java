package days26;

import java.io.File;

public class Ex06_06 {

	public static void main(String[] args) {

		//days26
		// 	ㄴ [temp]
		//		  ㄴ temp_a
		//				ㄴ xxx
		//				ㄴ yyy
		//		  ㄴ temp_b

		String pathname = ".\\src\\days26\\temp";
		File dir = new File(pathname);

		if (dir.exists()) {
			//System.out.println(dir.delete());//false 삭제안됨. 삭제되면 true
			// then the directory must be empty inorder to be deleted. : delete()메서드로 삭제하려는 폴더는 하위 디렉토리가 없어야 삭제할 수 있다.

			//deleteFolders(dir);
			//deleteAll(dir);
			//directoryDelete(File f);

		} // if
		//재귀함수로 제일 밑에 있는 폴더부터 삭제해야됨




	}//main
	
	//1번이 더 좋음
	private static void directoryDelete(File f) {
		//f가 삭제되지 않았을 경우에 while문 반복
		while (!f.delete()) { //true, false
	
			File [] list = f.listFiles();
			for (int i = 0; i < list.length; i++) {
				if (list[i].delete()) {
					System.out.printf("%s 삭제 완료\n", list[i]);
				} else {
					directoryDelete(list[i]);
				}//if
			} // for
			
		}//while
		
		
	}
	
	
	/*[1번]
	//dir이    days26\\temp
	private static void deleteFolders(File dir) {

		File[] childList = dir.listFiles();//자식이 폴더 또는 파일일수 있음
		//temp\\temp_a,     temp_b
		
		if (childList != null) {
			for (int i = 0; i < childList.length; i++) {
				File child = childList[i]; //temp_a
				deleteFolders(child);         
				System.out.printf("> %s 를 삭제했습니다.\n", child);
			}
		}
		dir.delete();         
		System.out.printf("> %s 를 삭제했습니다.\n", dir);

	}
	*/
	
	/*
	private static void deleteAll(File file) {
	      File[] files = file.listFiles();
	      
	      for (int i = 0; i < files.length; i++) {

	    	  if(files[i].isDirectory()) {
	            deleteAll(files[i]);         
	         }
	         files[i].delete();
	      } // for
	   }
	*/
	
}//class
