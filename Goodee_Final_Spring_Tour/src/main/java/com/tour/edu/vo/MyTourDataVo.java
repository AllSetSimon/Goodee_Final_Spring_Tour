package com.tour.edu.vo;

public class MyTourDataVo {
	
	private int dataNo;
	private String name;
	private int bookNo;
	private int attrLoc1;
	private int attrLoc2;
	private int tourOrder;
	private int contentId;
	public MyTourDataVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "MyTourDataVo [dataNo=" + dataNo + ", name=" + name + ", bookNo=" + bookNo + ", attrLoc1=" + attrLoc1
				+ ", attrLoc2=" + attrLoc2 + ", tourOrder=" + tourOrder + ", contentId=" + contentId + "]";
	}
	public MyTourDataVo(int dataNo, String name, int bookNo, int attrLoc1, int attrLoc2, int tourOrder, int contentId) {
		super();
		this.dataNo = dataNo;
		this.name = name;
		this.bookNo = bookNo;
		this.attrLoc1 = attrLoc1;
		this.attrLoc2 = attrLoc2;
		this.tourOrder = tourOrder;
		this.contentId = contentId;
	}
	public int getDataNo() {
		return dataNo;
	}
	public void setDataNo(int dataNo) {
		this.dataNo = dataNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getBookNo() {
		return bookNo;
	}
	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}
	public int getAttrLoc1() {
		return attrLoc1;
	}
	public void setAttrLoc1(int attrLoc1) {
		this.attrLoc1 = attrLoc1;
	}
	public int getAttrLoc2() {
		return attrLoc2;
	}
	public void setAttrLoc2(int attrLoc2) {
		this.attrLoc2 = attrLoc2;
	}
	public int getTourOrder() {
		return tourOrder;
	}
	public void setTourOrder(int tourOrder) {
		this.tourOrder = tourOrder;
	}
	public int getContentId() {
		return contentId;
	}
	public void setContentId(int contentId) {
		this.contentId = contentId;
	}
	
	
	
	
}
