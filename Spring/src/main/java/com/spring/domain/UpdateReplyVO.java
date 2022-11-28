package com.spring.domain;

public class UpdateReplyVO {
	//상품번호
	private int gdsNum;
	//상품 평균 평점
	private double ratingAvge;
	
	public int getGdsNum() {
		return gdsNum;
	}
	public void setGdsNum(int gdsNum) {
		this.gdsNum = gdsNum;
	}
	public double getRatingAvge() {
		return ratingAvge;
	}
	public void setRatingAvge(double ratingAvge) {
		this.ratingAvge = ratingAvge;
	}
	
	@Override
	public String toString() {
		return "UpdateReplyVO [gdsNum=" + gdsNum + ", ratingAvge=" + ratingAvge + "]";
	}
}
