package com.hana.category;

public class CategoryVO {
/*
CREATE TABLE category(
    categoryno                        INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '���⳻��ī�װ���ȣ',
    categorysort                              VARCHAR(50)    NOT NULL COMMENT '�з�'
) COMMENT='���⳻��ī�װ�';
*/
  private int categoryno;
  private String categorysort;
  
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
  


}
