package kr.go.jeonju.dto;

public class ImpDTO {
	private int no;
	private String cate; 
	private String tourno;
	private String id;
	private String title; 
	private String content; 
	private double star;
	private String imgSrc;
	private String regdate;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getCate() {
		return cate;
	}
	public void setCate(String cate) {
		this.cate = cate;
	}
	public String getTourno() {
		return tourno;
	}
	public void setTourno(String tourno) {
		this.tourno = tourno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public double getStar() {
		return star;
	}
	public void setStar(double star) {
		this.star = star;
	}
	public String getImgSrc() {
		return imgSrc;
	}
	public void setImgSrc(String imgSrc) {
		this.imgSrc = imgSrc;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "ImpDTO [no=" + no + ", cate=" + cate + ", tourno=" + tourno
				+ ", id=" + id + ", title=" + title + ", content=" + content
				+ ", star=" + star + ", imgSrc=" + imgSrc + ", regdate="
				+ regdate + "]";
	}
	
}
