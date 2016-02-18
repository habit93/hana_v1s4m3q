package com.hana.blogreply;

public class BlogreplyVO {
/*
CREATE TABLE blogreply(
    blogreplyno                       MEDIUMINT    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '블로그 댓글 번호',
    content                           VARCHAR(80)     NOT NULL COMMENT '내용',
    rdate                             DATETIME     NOT NULL COMMENT '등록일',
    blogno                            MEDIUMINT    NOT NULL COMMENT '블로그 번호',
    indent                            MEDIUMINT    DEFAULT 0     NOT NULL COMMENT '답변차수',
    ansnum                            SMALLINT     DEFAULT 0     NOT NULL COMMENT '답변순서',
  FOREIGN KEY (blogno) REFERENCES blog (blogno)
) COMMENT='블로그 댓글';
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
