package com.hana.blog;

import java.util.ArrayList;

public interface BlogMapperInter {
  
  public int create(BlogVO blogVO);
  
  public ArrayList<BlogVO> list(); 
  
  public BlogVO read(int blogno);
  
  public int update(BlogVO blogVO);

  public int delete(int blogno);
  
  public ArrayList<BlogVO> list2(BlogVO blogVO); 

  public int cnt_up(int blogno);
}


