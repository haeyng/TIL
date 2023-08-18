package days18;

public class Ex08_02 {

	public static void main(String[] args) {
		//암기
		
		String dir = System.getProperty("user.dir");  
		System.out.println(dir); //E:\Class\workspace\JavaClass\javaPro
		
		String sep = System.getProperty("file.separator"); // '\\' 경로를 구분하는 구분자 암기하기

	
		String directory = "C:\\temp\\days09"; //경로
		String fileName = "Ex01.java"; //파일이름
		
		//String path = directory + "\\" + fileName; //전체경로를 알고 싶음
		
		//System.out.println(path);
		// "c:\\temp\\days09\\Ex01.java"
		
		//char     directory.charAt(directory.length()-1) == '\'
		//String   directory.substring(directory.length()-1).equals("\\")
		//directory.endsWith("\\")
		
		
		/*
		String path;
		if (directory.endsWith("\\")) {
			path = directory + fileName;
		} else {
			path = directory + "\\" + fileName;
		}
		System.out.println(path);
		*/
		String path;
		if (directory.endsWith("sep")) {
			path = directory + fileName;
		} else {
			path = directory + "sep" + fileName;
		}
		System.out.println(path);
		
	}//main

}//class
