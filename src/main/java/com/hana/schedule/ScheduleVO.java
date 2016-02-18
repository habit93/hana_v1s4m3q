package com.hana.schedule;

public class ScheduleVO {
/*
CREATE TABLE schedule(
    scheduleno                        INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '�����ٹ�ȣ',
    rdate                             DATE     NOT NULL COMMENT '��¥',
    contents                          VARCHAR(200)     NOT NULL COMMENT '����',
    mno                               INT(10)    NULL  COMMENT '��� ��ȣ',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='������';
*/
  private int scheduleno;
  private String rdate;
  private String contents;
  private int mno;
  
  public int getScheduleno() {
    return scheduleno;
  }
  public void setScheduleno(int scheduleno) {
    this.scheduleno = scheduleno;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  public String getContents() {
    return contents;
  }
  public void setContents(String contents) {
    this.contents = contents;
  }
  public int getMno() {
    return mno;
  }
  public void setMno(int mno) {
    this.mno = mno;
  }

  
  
  
  
}
  