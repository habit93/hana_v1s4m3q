package com.hana.schedule;

public class ScheduleVO {
/*
CREATE TABLE schedule(
    scheduleno                        INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '스케줄번호',
    rdate                             DATE     NOT NULL COMMENT '날짜',
    contents                          VARCHAR(200)     NOT NULL COMMENT '내용',
    mno                               INT(10)    NULL  COMMENT '멤버 번호',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='스케줄';
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
  