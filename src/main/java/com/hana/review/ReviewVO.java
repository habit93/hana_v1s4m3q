package com.hana.review;

import org.springframework.web.multipart.MultipartFile;

public class ReviewVO {
/*
CREATE TABLE review(
    reviewno                          INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '¸®ºä¹øÈ£',
    title                             VARCHAR(20)    NOT NULL COMMENT '¸®ºäÁ¦¸ñ',
    contents                          VARCHAR(800)     NOT NULL COMMENT '¸®ºä³»¿ë',
    rdate                             DATE     NOT NULL COMMENT 'µî·ÏÀÏ',
    itemno                            INT(10)    NULL  COMMENT '¹°°Ç¹øÈ£',
    mno                               INT(10)    NULL  COMMENT '¸â¹ö ¹øÈ£',
  FOREIGN KEY (itemno) REFERENCES item (itemno),
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='¸®ºä';
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
