package com.hana.item;

import org.springframework.web.multipart.MultipartFile;

public class ItemVO {
  
  private int itemno;
  private String title;
  private int price;
  private String content;
  private int categoryno;
  private String thumb;
  
  /* Framework에서 자동 주입되는 Thumb 파일 객체 */
  private MultipartFile fileMF;
  
  public MultipartFile getFileMF() {
    return fileMF;
  }
  public void setFileMF(MultipartFile fileMF) {
    this.fileMF = fileMF;
  }
  public String getThumb() {
    return thumb;
  }
  public void setThumb(String thumb) {
    this.thumb = thumb;
  }
  public int getItemno() {
    return itemno;
  }
  public void setItemno(int itemno) {
    this.itemno = itemno;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public int getPrice() {
    return price;
  }
  public void setPrice(int price) {
    this.price = price;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  public int getCategoryno() {
    return categoryno;
  }
  public void setCategoryno(int categoryno) {
    this.categoryno = categoryno;
  }
  
}
