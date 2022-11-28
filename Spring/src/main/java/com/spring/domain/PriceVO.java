package com.spring.domain;

public class PriceVO {
	//상품번호
	private int gdsNum;
	//상품이름
	private String gdsName;
	//카테고리 이름
	private String cateName;
	//상품 점수 평균
	private double ratingAvge;
	//이미지
	private String gdsImg;
	
	private int gdsPrice;
	
	public int getGdsPrice() {
		return gdsPrice;
	}

	public void setGdsPrice(int gdsPrice) {
		this.gdsPrice = gdsPrice;
	}

	public int getGdsNum() {  
		return gdsNum;
	}

	public void setGdsNum(int gdsNum) {
		this.gdsNum = gdsNum;
	}

	public String getGdsName() {
		return gdsName;
	}

	public void setGdsName(String gdsName) {
		this.gdsName = gdsName;
	}

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}

	public double getRatingAvge() {
		return ratingAvge;
	}

	public void setRatingAvge(double ratingAvge) {
		this.ratingAvge = ratingAvge;
	}

	public String getGdsImg() {
		return gdsImg;
	}

	public void setGdsImg(String gdsImg) {
		this.gdsImg = gdsImg;
	}

	@Override
	public String toString() {
		return "SelectVO [gdsNum=" + gdsNum + ", gdsName=" + gdsName + ", cateName=" + cateName + ", ratingAvge="
				+ ratingAvge + ", gdsImg=" + gdsImg + "]";
	}
	
	
	
	

}
