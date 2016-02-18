package com.hana.shopcategory;

public class ShopcategoryVO {
  
  public int categoryno;
  public String category;
  public int codeno;
  private int sort;
  
  private String code;
  
  public String getCode() {
    return code;
  }
  public void setCode(String code) {
    this.code = code;
  }
  public int getSort() {
    return sort;
  }
  public void setSort(int sort) {
    this.sort = sort;
  }
  public String getCategory() {
    return category;
  }
  public void setCategory(String category) {
    this.category = category;
  }
  public int getCodeno() {
    return codeno;
  }
  public void setCodeno(int codeno) {
    this.codeno = codeno;
  }
  public int getCategoryno() {
    return categoryno;
  }
  public void setCategoryno(int categoryno) {
    this.categoryno = categoryno;
  }
  
}
