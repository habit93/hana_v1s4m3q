package com.hana.blogreply;

public class BlogreplyVO {
/*
CREATE TABLE blogreply(
    blogreplyno                       MEDIUMINT    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '��α� ��� ��ȣ',
    content                           VARCHAR(80)     NOT NULL COMMENT '����',
    rdate                             DATETIME     NOT NULL COMMENT '�����',
    blogno                            MEDIUMINT    NOT NULL COMMENT '��α� ��ȣ',
    indent                            MEDIUMINT    DEFAULT 0     NOT NULL COMMENT '�亯����',
    ansnum                            SMALLINT     DEFAULT 0     NOT NULL COMMENT '�亯����',
  FOREIGN KEY (blogno) REFERENCES blog (blogno)
) COMMENT='��α� ���';
*/
  
  private int blogreplyno;
  private String content;
  private String rdate;
  private int blogno;
  private int indent;
  private int ansnum;
  
  public int getBlogreplyno() {
    return blogreplyno;
  }
  public void setBlogreplyno(int blogreplyno) {
    this.blogreplyno = blogreplyno;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  public int getBlogno() {
    return blogno;
  }
  public void setBlogno(int blogno) {
    this.blogno = blogno;
  }
  public int getIndent() {
    return indent;
  }
  public void setIndent(int indent) {
    this.indent = indent;
  }
  public int getAnsnum() {
    return ansnum;
  }
  public void setAnsnum(int ansnum) {
    this.ansnum = ansnum;
  }
  
  
  
  
}
