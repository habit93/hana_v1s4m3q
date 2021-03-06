package com.hana.review;

import java.util.ArrayList;

public interface ReviewMapperInter {
  
  public int create(ReviewVO reviewVO);
  
  public ArrayList<ReviewVO> list(int itemno); 

  public ArrayList<ReviewVO> list_all(); 

  public ReviewVO read(int reviewno);

  public int update(ReviewVO reviewVO);

  public int delete(int reviewno);

  
}


