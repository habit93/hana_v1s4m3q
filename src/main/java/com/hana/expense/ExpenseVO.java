package com.hana.expense;

public class ExpenseVO {
/*
CREATE TABLE expense(
    expenseno                         INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '지출번호',
    rdate                             DATE     NOT NULL COMMENT '날짜',
    categoryno                        INT(10)    NULL  COMMENT '지출내역카테고리번호',
    expenseitem                       VARCHAR(20)    NOT NULL COMMENT '지출내용',
    expensemoney                      MEDIUMINT(10)    NOT NULL COMMENT '지출금액',
    mno                               INT(10)    NULL  COMMENT '멤버 번호',
  FOREIGN KEY (categoryno) REFERENCES category (categoryno),
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='지출';
*/
  private int expenseno;
  private String rdate;
  private int categoryno;
  private String expenseitem;
  private int expensemoney;
  private int mno;
  
  /*정산 달*/
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
  