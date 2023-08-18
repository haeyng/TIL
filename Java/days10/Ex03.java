package days10;

import java.io.IOException;
import java.util.Arrays;
import java.util.Scanner;
/**
 * @author 송해영
 * @date 2023. 7. 26.-오후 12:06:11
 * @subject 배열 단점 때문에 컬렉션 클래스 사용
 * @content  1) 배열크기가 자동으로 증가되거나 감소되지 않음
 * 					2) 요소 삽입이 복잡함
 */
public class Ex03 {

	static int index = 0; //다른함수에서 인식을 못해서 전역변수로 줌// 배열에 채울 위치값을 가진 변수

	static Scanner scanner = new Scanner(System.in);
	
	static char con = 'y';

	public static void main(String[] args) throws IOException {
		int [] m = new int [3];  // [1][2][3] m[3]=4	
		String [] menus = {"추가","수정","삭제","검색","조회","종료"};
		int selectedNumber;
		
		while (true) {
			dispMenus(menus);
			selectedNumber=selectMenus(scanner);
			processMenus(selectedNumber,m); //m을 인식시키려고 추가
		}//while	
	}//main
	
	private static void processMenus(int selectedNumber, int [] m) throws IOException {
		
		switch (selectedNumber) {
		case 1: // main 함수 안에 있는 m 배열에 값을 입력받아서 요소를 추가.
			add(m);
			break;
		case 2:
			System.out.println("배열에 요소 수정");
			break;
		case 5: //배열의 모든 요소 조회하는 곳
			list(m);
			break;
		case 6:
			exit();
			break;
		}
		일시정지();
	}
	
	public static void 일시정지() {
		System.out.print(">아무키나 누르면 계속합니다.");

		//예외처리 방법 2가지 1. try~catch 사용 2.throws 사용
		try {
			System.in.read();
			System.in.skip(System.in.available());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
	private static void list(int[] m) {
		System.out.println("[5. 조회]");
		
//		if (index==0) {
//			System.out.println("추가된 요소가 없습니다.");
//			return; //여기에 return을 넣고 }괄호 닫으면  함수를 빠져나간다 else 대신 list 함수를 빠져나갈때
//		} else {
//			for (int i = 0; i < index; i++) {//index로 변경 채워넣을것까지만 조회
//				System.out.printf("m[%d]=%d",i,m[i]);
//			} // for
//			System.out.println();
//		}//if    ======> 이 코딩 에러남 원인 모름..
		
		if (index==0) {
		System.out.println("추가된 요소가 없습니다.");
		return ;
		}//if
		for (int i = 0; i < index; i++) {//index로 변경 채워넣을것까지만 조회
			System.out.printf("m[%d]=%d  ",i,m[i]);
		} // for
		System.out.println();	
	}

	//m 배열에 요소를 추가하는 함수(메서드)
	private static void add(int[] m) throws IOException {

		System.out.println("[1. 추가]");

		do {
			//배열크기 증가
			if (index==m.length) { //같으면 배열이 다 찼다는 뜻
				int [] temp = new int [m.length+3];		
				for (int i = 0; i < temp.length; i++) {
					temp[i] = m[i];
				} // for
				m = temp; //temp 주소값을 m에
			}
			// if (index==3) break; 배열크기 초과할때 빠져나오는
			System.out.printf("> 정수입력 ?");
			int n = scanner.nextInt();

			m[index++] = n;//배열크기 할당 하는것.  이 위에 배열크기 증가 코딩 추가해야됨

			System.out.print("\t 요소추가 계속할거냐? ");
			con = (char) System.in.read();
			System.in.skip(System.in.available()); //13,10
		} while (Character.toUpperCase(con)=='Y');
		//} while (Character.toUpperCase(con)=='Y' && index<3); 배열크기 3 제한

		System.out.println(Arrays.toString(m));

	}

	private static void exit() {
		System.out.println("\n\n 프로그램 종료합니다.");
		System.exit(-1);
	}
	private static int selectMenus(Scanner scanner) {
		System.out.print(">메뉴 선택하세요?");
		return scanner.nextInt();
	}
	private static void dispMenus(String[] menus) {
		System.out.println("[메뉴]");
		for (int i = 0; i < menus.length; i++) {
			System.out.printf("%d. %s\t", i+1, menus[i]);
		} // for	
		System.out.println();
	}//main

}
