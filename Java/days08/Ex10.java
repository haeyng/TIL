package days08;

public class Ex10 {

	public static void main(String[] args) {
		
		//신용카드
		String card = "7655-8988-9234-5677"; // -구분자로 잘라서 배열에
		
		String regex = "-";
		String [] cardArr= card.split(regex);
		
		//0~3 임의의 수
		int index = (int)Math.random()*4;
		cardArr[index] = "****";	
		
		
		//String printCard = String.format("%s-%s-%s-%s", cardArr[0],cardArr[1],cardArr[2],cardArr[3]);
		//System.out.println(printCard);
		
		String printCard = String.join("-",cardArr);     // String.join()
		System.out.println(printCard);
		
				
//				7655-****-9234-5677
//				7655-8988-9234-****
//				****-8988-9234-5677
//				7655-8988-****-5677

				
	}//main
}//class
