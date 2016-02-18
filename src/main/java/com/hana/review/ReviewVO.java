package com.hana.review;

import org.springframework.web.multipart.MultipartFile;

public class ReviewVO {
/*
CREATE TABLE review(
    reviewno                          INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '�����ȣ',
    title                             VARCHAR(20)    NOT NULL COMMENT '��������',
    contents                          VARCHAR(800)     NOT NULL COMMENT '���䳻��',
    rdate                             DATE     NOT NULL COMMENT '�����',
    itemno                            INT(10)    NULL  COMMENT '���ǹ�ȣ',
    mno                               INT(10)    NULL  COMMENT '��� ��ȣ',
  FOREIGN KEY (itemno) REFERENCES item (itemno),
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='����';
*/
  
  private int reviewno;
  private String title;
  private String contents;
  private String rdate;
  private int itemno;
  private int mno;
  
  public int getReviewno() {
    return reviewno;
  }
  public void setReviewno(int reviewno) {
    this.reviewno = reviewno;
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
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  public int getItemno() {
    return itemno;
  }
  public void setItemno(int itemno) {
    this.itemno = itemno;
  }
  public int getMno() {
    return mno;
  }
  public void setMno(int mno) {
    this.mno = mno;
  }


  
}
