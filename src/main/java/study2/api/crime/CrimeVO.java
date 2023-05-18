package study2.api.crime;

public class CrimeVO {
	private int idx;
	private String police;
	private int year;
	private int robbery;
	private int murder;
	private int theft;
	private int violence;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getPolice() {
		return police;
	}
	public void setPolice(String police) {
		this.police = police;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getRobbery() {
		return robbery;
	}
	public void setRobbery(int robbery) {
		this.robbery = robbery;
	}
	public int getMurder() {
		return murder;
	}
	public void setMurder(int murder) {
		this.murder = murder;
	}
	public int getTheft() {
		return theft;
	}
	public void setTheft(int theft) {
		this.theft = theft;
	}
	public int getViolence() {
		return violence;
	}
	public void setViolence(int violence) {
		this.violence = violence;
	}
	
	@Override
	public String toString() {
		return "CrimeVO [idx=" + idx + ", police=" + police + ", year=" + year + ", robbery=" + robbery + ", murder="
				+ murder + ", theft=" + theft + ", violence=" + violence + "]";
	}
}
