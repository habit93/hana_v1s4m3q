package com.hana.blogcategory;

public class BlogcategoryVO {
/*
    blogcategoryno                    MEDIUMINT    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '카테고리번호',
    grp                               TINYINT    DEFAULT 1     NOT NULL COMMENT '그룹',
    title                             VARCHAR(50)    NOT NULL COMMENT '게시판 이름',
    orderno                           SMALLINT     DEFAULT 1     NOT NULL COMMENT '게시판 출력 순서',
    visible                           CHAR(1)    DEFAULT 'Y'     NOT NULL COMMENT '출력 모드',
    ids                               VARCHAR(100)     DEFAULT 'admin'     NOT NULL COMMENT '접근 계정',
    cnt                               MEDIUMINT    DEFAULT 0     NOT NULL COMMENT '등록된 글수' 
 */
  
  private int blogcategoryno;
  private int codeno;
  private String title;
  private int orderno;
  private String visible;
  private String ids;
  private int cnt;
  private String sort;
  
  public int getBlogcategoryno() {
    return blogcategoryno;
  }
  public void setBlogcategoryno(int blogcategoryno) {
    this.blogcategoryno = blogcategoryno;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public int getOrderno() {
    return orderno;
  }
  public void setOrderno(int orderno) {
    this.orderno = orderno;
  }
  public String getVisible() {
    return visible;
  }
  public void setVisible(String visible) {
    this.visible = visible;
  }
  public String getIds() {
    return ids;
  }
  public void setIds(String ids) {
    this.ids = ids;
  }
  public int getCnt() {
    return cnt;
  }
  public void setCnt(int cnt) {
    this.cnt = cnt;
  }
  public int getCodeno() {
    return codeno;
  }
  public void setCodeno(int codeno) {
    this.codeno = codeno;
  }
  public String getSort() {
    return sort;
  }
  public void setSort(String sort) {
    this.sort = sort;
  }

  
}
