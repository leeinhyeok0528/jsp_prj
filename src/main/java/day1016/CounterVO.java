package day1016;

public class CounterVO {

	private int cnt;

	public CounterVO() {
		System.out.println("counterVO의 객체 생성");

	}// constructor

	public int getCnt() {
		return cnt;
	}//get

	public void setCnt(int cnt) {
		this.cnt += cnt;
	}//set

	@Override
	public String toString() {
		return "CounterVO [cnt=" + cnt + "]";
	}//tostirng

}// class
