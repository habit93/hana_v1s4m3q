package com.hana.expense;

public class ExpenseVO {
/*
CREATE TABLE expense(
    expenseno                         INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '�����ȣ',
    rdate                             DATE     NOT NULL COMMENT '��¥',
    categoryno                        INT(10)    NULL  COMMENT '���⳻��ī�װ���ȣ',
    expenseitem                       VARCHAR(20)    NOT NULL COMMENT '���⳻��',
    expensemoney                      MEDIUMINT(10)    NOT NULL COMMENT '����ݾ�',
    mno                               INT(10)    NULL  COMMENT '��� ��ȣ',
  FOREIGN KEY (categoryno) REFERENCES category (categoryno),
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='����';
*/
  private int expenseno;
  private String rdate;
  private int categoryno;
  private String expenseitem;
  private int expensemoney;
  private int mno;
  
  /*���� ��*/
  private String month;
  private String categorysort;
  
  public String getMonth() {
    return month;
  }
  public void setMonth(String month) {
    this.month = month;
  }
  public String getCategorysort() {
    return categorysort;
  }
  public void setCategorysort(String categorysort) {
    this.categorysort = categorysort;
  }
  
  
  

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
  public int getCategoryno() {
    return categoryno;
  }
  public void setCategoryno(int categoryno) {
    this.categoryno = categoryno;
  }
  public String getExpenseitem() {
    return expenseitem;
  }
  public void setExpenseitem(String expenseitem) {
    this.expenseitem = expenseitem;
  }
  public int getExpensemoney() {
    return expensemoney;
  }
  public void setExpensemoney(int expensemoney) {
    this.expensemoney = expensemoney;
  }
  public int getMno() {
    return mno;
  }
  public void setMno(int mno) {
    this.mno = mno;
  }
  
  
  
}
  