package kr.go.jeonju.dto;

public class TourDTO {
	private int no;
	private String tourno; 
	private String cate; 
	private String title; 
	private String subtitle; 
	private String content; 
	private String regdate; 
	private int visited;
	private String imgURL;
	private String addr;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTourno() {
		return tourno;
	}
	public void setTourno(String tourno) {
		this.tourno = tourno;
	}
	public String getCate() {
		return cate;
	}
	public void setCate(String cate) {
		this.cate = cate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSubtitle() {
		return subtitle;
	}
	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getVisited() {
		return visited;
	}
	public void setVisited(int visited) {
		this.visited = visited;
	}
	public String getImgURL() {
		return imgURL;
	}
	public void setImgURL(String imgURL) {
		this.imgURL = imgURL;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	@Override
	public String toString() {
		return "TourDTO [no=" + no + ", tourno=" + tourno + ", cate=" + cate
				+ ", title=" + title + ", subtitle=" + subtitle + ", content="
				+ content + ", regdate=" + regdate + ", visited=" + visited
				+ ", imgURL=" + imgURL + ", addr=" + addr + "]";
	}
	
	
}
