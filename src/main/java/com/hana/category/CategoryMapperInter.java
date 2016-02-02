package com.hana.category;

import java.util.ArrayList;



public interface CategoryMapperInter {

  public int create(CategoryVO categoryVO);
    
  public ArrayList<CategoryVO> list();
  
  public int update(CategoryVO categoryVO);
  
  public int delete(int categoryno);
}


