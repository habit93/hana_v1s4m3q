package com.hana.expense;

public class ExpenseVO {
/*
CREATE TABLE expense(
    expenseno                         INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '�����ȣ',
    rdate                             DATE     NOT NULL COMMENT '��¥',
    sort                              VARCHAR(10)    NULL  COMMENT '�з�',
    expenseitem                       VARCHAR(20)    NOT NULL COMMENT '���⳻��',
    file1                             VARCHAR(10)    NULL  COMMENT '÷������',
    expensemoney                      MEDIUMINT(10)    NOT NULL COMMENT '����ݾ�',
    categoryno                        INT(10)    NULL  COMMENT '���⳻��ī�װ���ȣ',
    mno                               INT(10)    NULL  COMMENT '��� ��ȣ',
  FOREIGN KEY (categoryno) REFERENCES category (categoryno),
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='����';
*/
  private int expenseno;
  private String rdate;
  private String sort;
  private String expenseitem;
  private String file1;
  private int expensemoney;
  private int categoryno;
  private int mno;
  
  public int getExpenseno() {
    return expenseno;
  }
  public void setExpenseno(int expenseno) {
    this.expenseno = expenseno;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  public String getSort() {
    return sort;
  }
  public void setSort(String sort) {
    this.sort = sort;
  }
  public String getExpenseitem() {
    return expenseitem;
  }
  public void setExpenseitem(String expenseitem) {
    this.expenseitem = expenseitem;
  }
  public String getFile1() {
    return file1;
  }
  public void setFile1(String file1) {
    this.file1 = file1;
  }
  public int getExpensemoney() {
    return expensemoney;
  }
  public void setExpensemoney(int expensemoney) {
    this.expensemoney = expensemoney;
  }
  public int getCategoryno() {
    return categoryno;
  }
  public void setCategoryno(int categoryno) {
    this.categoryno = categoryno;
  }
  public int getMno() {
    return mno;
  }
  public void setMno(int mno) {
    this.mno = mno;
  }
  
  
  
}
  