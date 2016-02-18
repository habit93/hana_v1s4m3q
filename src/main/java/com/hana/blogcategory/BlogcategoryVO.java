package com.hana.blogcategory;

public class BlogcategoryVO {
/*
    blogcategoryno                    MEDIUMINT    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT 'ī�װ���ȣ',
    grp                               TINYINT    DEFAULT 1     NOT NULL COMMENT '�׷�',
    title                             VARCHAR(50)    NOT NULL COMMENT '�Խ��� �̸�',
    orderno                           SMALLINT     DEFAULT 1     NOT NULL COMMENT '�Խ��� ��� ����',
    visible                           CHAR(1)    DEFAULT 'Y'     NOT NULL COMMENT '��� ���',
    ids                               VARCHAR(100)     DEFAULT 'admin'     NOT NULL COMMENT '���� ����',
    cnt                               MEDIUMINT    DEFAULT 0     NOT NULL COMMENT '��ϵ� �ۼ�' 
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
