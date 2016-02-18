package com.hana.blog;

import org.springframework.web.multipart.MultipartFile;

public class BlogVO {
/*
CREATE TABLE blog(
    blogno                            MEDIUMINT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '��α׹�ȣ',
    title                             VARCHAR(200)     NOT NULL COMMENT '����',
    content                           MEDIUMTEXT     NOT NULL COMMENT '����',
    file                             VARCHAR(20)    NOT NULL COMMENT '������',
    good                              MEDIUMINT(7)     NOT NULL COMMENT '���ƿ�',
    rdate                             DATETIME     NOT NULL COMMENT '�ۼ��ð�',
    cnt                               MEDIUMINT(7)     NOT NULL COMMENT '��ȸ��',
    replycnt                          SMALLINT(5)    NOT NULL COMMENT '��ۼ�',
    blogcategoryno                    MEDIUMINT(10)    NULL  COMMENT '��α�ī�װ���ȣ',
    mno                               INT(10)    NULL  COMMENT '��� ��ȣ',
  FOREIGN KEY (blogcategoryno) REFERENCES blogcategory (blogcategoryno),
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='��αױ�';
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
  
  /* Framework���� �ڵ� ���ԵǴ� Thumb ���� ��ü */
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
