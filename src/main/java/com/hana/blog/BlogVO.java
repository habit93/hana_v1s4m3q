package com.hana.blog;

import org.springframework.web.multipart.MultipartFile;

public class BlogVO {
/*
CREATE TABLE blog(
    blogno                            MEDIUMINT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '블로그번호',
    title                             VARCHAR(200)     NOT NULL COMMENT '제목',
    content                           MEDIUMTEXT     NOT NULL COMMENT '내용',
    file                             VARCHAR(20)    NOT NULL COMMENT '썸파일',
    good                              MEDIUMINT(7)     NOT NULL COMMENT '좋아요',
    rdate                             DATETIME     NOT NULL COMMENT '작성시간',
    cnt                               MEDIUMINT(7)     NOT NULL COMMENT '조회수',
    replycnt                          SMALLINT(5)    NOT NULL COMMENT '댓글수',
    blogcategoryno                    MEDIUMINT(10)    NULL  COMMENT '블로그카테고리번호',
    mno                               INT(10)    NULL  COMMENT '멤버 번호',
  FOREIGN KEY (blogcategoryno) REFERENCES blogcategory (blogcategoryno),
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='블로그글';
*/
  
  private int blogno;
  private String title;
  private String content;
  private String file;
  private int good;
  private String rdate;
  private int cnt;
  private int replycnt;
  private int blogcategoryno;
  private int mno;
  
  /* Framework에서 자동 주입되는 Thumb 파일 객체 */
  private MultipartFile fileMF;
  
  public int getBlogno() {
    return blogno;
  }
  public void setBlogno(int blogno) {
    this.blogno = blogno;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  public String getFile() {
    return file;
  }
  public void setFile(String file) {
    this.file = file;
  }
  public int getGood() {
    return good;
  }
  public void setGood(int good) {
    this.good = good;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  public int getCnt() {
    return cnt;
  }
  public void setCnt(int cnt) {
    this.cnt = cnt;
  }
  public int getReplycnt() {
    return replycnt;
  }
  public void setReplycnt(int replycnt) {
    this.replycnt = replycnt;
  }
  public int getBlogcategoryno() {
    return blogcategoryno;
  }
  public void setBlogcategoryno(int blogcategoryno) {
    this.blogcategoryno = blogcategoryno;
  }
  public int getMno() {
    return mno;
  }
  public void setMno(int mno) {
    this.mno = mno;
  }
  public MultipartFile getFileMF() {
    return fileMF;
  }
  public void setFileMF(MultipartFile fileMF) {
    this.fileMF = fileMF;
  }
  
  
  
  
  
  
}
