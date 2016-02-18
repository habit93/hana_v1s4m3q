package com.hana.calendar;

public class CalendarDTO {
/*
CREATE TABLE calendar(
    calendarno                        INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '�����ٹ�ȣ',
    rdate                             DATE     NOT NULL COMMENT '��¥',
    label                             VARCHAR(20)  NOT NULL, -- �޷¿� ��µ� ���̺�
    title                               VARCHAR(100) NOT NULL, -- ����(*)
    contents                          VARCHAR(200)     NOT NULL COMMENT '����',
    mno                               INT(10)    NULL  COMMENT '��� ��ȣ',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='������';
 */

  private int calendarno;
  private String rdate;
  private String label;
  private String title;
  private String contents;
  private int mno;
  
  public int getCalendarno() {
    return calendarno;
  }
  public void setCalendarno(int calendarno) {
    this.calendarno = calendarno;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  public String getLabel() {
    return label;
  }
  public void setLabel(String label) {
    this.label = label;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
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



