package com.hana.category;

public class CategoryVO {
/*
CREATE TABLE category(
    categoryno                        INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '지출내역카테고리번호',
    categorysort                              VARCHAR(50)    NOT NULL COMMENT '분류'
    mno
) COMMENT='지출내역카테고리';
*/
  private int categoryno;
  private String categorysort;
  private int mno;
  
  public int getCategoryno() {
    return categoryno;
  }
  public void setCategoryno(int categoryno) {
    this.categoryno = categoryno;
  }
  public String getCategorysort() {
    return categorysort;
  }
  public void setCategorysort(String categorysort) {
    this.categorysort = categorysort;
  }
  public int getMno() {
    return mno;
  }
  public void setMno(int mno) {
    this.mno = mno;
  }
  
  


}
