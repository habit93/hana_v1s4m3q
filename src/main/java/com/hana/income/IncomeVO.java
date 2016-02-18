package com.hana.income;

public class IncomeVO {
/*
CREATE TABLE income(
    incomeno                          INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '���Թ�ȣ',
    rdate                             DATE     NOT NULL COMMENT '��¥',
    incomeitem                        VARCHAR(20)    NOT NULL COMMENT '���Գ���',
    incomemoney                       MEDIUMINT(10)    NOT NULL COMMENT '���Աݾ�',
    mno                               INT(10)    NULL  COMMENT '��� ��ȣ',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='����';
*/
  private int incomeno;
  private String rdate;
  private String incomeitem;
  private int incomemoney;
  private String mno;
  
  /*���� ��*/
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
  