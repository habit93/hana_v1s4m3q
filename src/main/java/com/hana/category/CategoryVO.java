package com.hana.category;

public class CategoryVO {
/*
CREATE TABLE category(
    categoryno                        INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '지출내역카테고리번호',
    sort                              VARCHAR(50)    NOT NULL COMMENT '분류'
) COMMENT='지출내역카테고리';
*/
  private int categoryno;
  private String sort;
  
  public int getCategoryno() {
    return categoryno;
  }
  public void setCategoryno(int categoryno) {
    this.categoryno = categoryno;
  }
  public String getSort() {
    return sort;
  }
  public void setSort(String sort) {
    this.sort = sort;
  }

}
