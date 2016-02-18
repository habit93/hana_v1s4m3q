package com.hana.income;

public class IncomeVO {
/*
CREATE TABLE income(
    incomeno                          INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '수입번호',
    rdate                             DATE     NOT NULL COMMENT '날짜',
    incomeitem                        VARCHAR(20)    NOT NULL COMMENT '수입내용',
    incomemoney                       MEDIUMINT(10)    NOT NULL COMMENT '수입금액',
    mno                               INT(10)    NULL  COMMENT '멤버 번호',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='수입';
*/
  private int incomeno;
  private String rdate;
  private String incomeitem;
  private int incomemoney;
  private String mno;
  
  /*정산 달*/
  private String month;
  
  public String getMonth() {
    return month;
  }
  public void setMonth(String month) {
    this.month = month;
  }
  
  
  public int getIncomeno() {
    return incomeno;
  }
  public void setIncomeno(int incomeno) {
    this.incomeno = incomeno;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  public String getIncomeitem() {
    return incomeitem;
  }
  public void setIncomeitem(String incomeitem) {
    this.incomeitem = incomeitem;
  }
  public int getIncomemoney() {
    return incomemoney;
  }
  public void setIncomemoney(int incomemoney) {
    this.incomemoney = incomemoney;
  }
  public String getMno() {
    return mno;
  }
  public void setMno(String mno) {
    this.mno = mno;
  }


  
  
  
}
  