package day1018;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class DataDAO {

	
	public List<DataVO> selectData(){
		List<DataVO> list = new ArrayList<DataVO>();
		
		
		if(new Random().nextBoolean()) {
		  list.add(new DataVO("img.png", "3조 조원 이인혁", "모든일에 최선을 다하는 조원" , 1));
		  list.add(new DataVO("img2.jpg", "페페", "이게뭐에요?" , 2)); list.add(new
		  DataVO("img5.jpg", "페페", "흐음~" , 3)); list.add(new DataVO("img4.jpg",
		  "밍기적햄스터", "할루?" , 4));
		
		//VO파일에 데이터 생성.
		}
		
		return list;
	}//selectData
	
}//DataDAO
