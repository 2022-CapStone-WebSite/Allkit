package com.spring.domain;

public class SearchCriteria extends Criteria{

	 private String searchType ="";
	 private String keyword = "";
	 
	 public String getSearchType() {
	  return searchType;
	 }
	 public void setSearchType(String searchType) {
	  this.searchType = searchType;
	 }
	 public String getKeyword() {
	  return keyword;
	 }
	 public void setKeyword(String keyword) {
	  this.keyword = keyword;
	 }
	 
	 @Override
	 public String toString() {
	  return super.toString() + " SearchCriteria [searchType=" + searchType + ", keyword=" + keyword + "]";
	 }
	 
	 
	 //검색 타입과 검색어
	 private String searchTypeKeyword; 

	 public void setSearchTypeKeyword(String searchType, String keyword) {
	  
	  if(searchType.equals("") || keyword.equals("")) {
	   searchTypeKeyword = ""; 
	  } else {
	   searchTypeKeyword = "&searchType=" + searchType + "&keyword=" + keyword; 
	  }  
	 }

	 public String getSearchTypeKeyword() {
	  return searchTypeKeyword;
	 }
	 

	 
	   
	 
	 
	}
   