package days23;

import java.util.Collection;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;

/**
 * @author 송해영
 * @date 2023. 8. 14. - 오후 3:27:30
 * @subject HashMap ... 많이 사용됨-------------시험
 * @content
 */
public class Ex06 {

	public static void main(String[] args) {

		/*
		 * [Map 인터페이스를 구현한 컬렉션 클래스]
		 * 1. key + value 한 쌍으로 관리
		 * 2. Entry(엔트리) = key + value 한쌍
		 * 3. key 중복 허용X 
		 * 		value 중복 허용O
		 * 4. [Hash]Map(신)
		 * 		[Hash]Table(구)
		 * 5. HashMap을 사용하도록 권장.
		 * 6. 해싱(Hashing)
		 * 		-해시함수(hash function)를 이용해서 데이터를 해시테이블(hash table)에 저장하고 검색하는 기법
		 * 		-해시함수란? 데이터가 저장되어 있는 곳을 알려주는 함수
		 * 		데이터를 빠르게 찾을 수 있다.
		 * 		-데이터를 저장(key+value)할 키값을 해시함수에 넣으면
		 * 		 배열의 한 요소를 얻어오고 다시 그 배열에 연결된 링크드리스트에 데이터를 저장하는 방식이다.
		 * 		예) 1998.2.1 데이터 저장.
		 * 
		 * 		 [해시함수]
		 *    
		 *    
		 *    [1990]   [][][][][][][][][]
		 *        :    [][][][]
		 *    [1998]   [][][][2.1삽입][][][][]
		 *    [2000]   [][][][][]    
		 * */
		
		//				id		 name
		//HashMap<String, String> hm = new HashMap<String, String>();
		//HashMap 동기화처리X

		Hashtable<String, String> hm = new Hashtable<String, String>();
		//Hashtable 동기화처리O
		
		hm.put("admin", "관리자");
		hm.put("hong", "홍길동");
		System.out.println(hm);
		
		hm.put("hong", "홍중복");//key가 중복될때 에러는 발생하지 않고, 새로운 value로 저장됨. //key는 중복된 것은 허용하지 않음
		//System.out.println(hm);
		
		hm.put("root", "관리자");
		System.out.println(hm);
		System.out.println("-".repeat(40));
		
		
		//모든 key 조회하는 작업? - keySet()
		Set<String> kSet = hm.keySet();
		Iterator<String> ir = kSet.iterator();
		while (ir.hasNext()) {
			String key =  ir.next();
			System.out.println(key);
		}
		System.out.println("-".repeat(40));
		
		
		//true/false hm.containsKey("hong");
		//true;false hm.containsValue("홍중복");
		
		String value = hm.get("root");
				 value = hm.getOrDefault("kim", "익명");
				 
				 hm.replace("root", "관리자", "루트");
				 
		
		//모든 value 조회
		Collection<String> vSet = hm.values();
		Iterator<String> ir2 = vSet.iterator();
		while (ir2.hasNext()) {
			value = ir2.next();
			System.out.println(value);
		}
		System.out.println("-".repeat(40));
		
		
		//root 키를 알 때 value 조회?
		String key = "admin";
			value = hm.get(key);
		System.out.println(value);//관리자
		System.out.println("-".repeat(40));
		
		dispHm(hm);
	
	}//main

	/*[1]
	private static void dispHm(HashMap<String, String> hm) {
		//출력하고 싶은 형태
		//key : value 
		//key : value 
		//key : value 
		
		
		Set<String> kSet = hm.keySet();
		Iterator<String> ir = kSet.iterator();
		while (ir.hasNext()) {
			String key =  ir.next();
			String value = hm.get(key);
			System.out.printf("%s : %s\n",key,value);
		}//while
	}*/
	
	
	//[2]
	//private static void dispHm(HashMap<String, String> hm) {
	private static void dispHm(Hashtable<String, String> hm) {
		//출력하고 싶은 형태
//		hong : 홍중복
//		root : 관리자
//		admin : 관리자
		
		Set<Entry<String, String>> eset = hm.entrySet();
		Iterator<Entry<String, String>> ir = eset.iterator();
		while (ir.hasNext()) {
			Entry <String,String> entry =  ir.next();
			String key = entry.getKey();
			String value =	 entry.getValue();
			System.out.printf("e %s : %s\n",key,value);
		}
	
	}
	
}//class
