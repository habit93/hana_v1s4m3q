package com.hana.blogreply;

import java.util.ArrayList;

public interface BlogreplyMapperInter {
  
  public int create(BlogreplyVO blogreplyVO);

  public ArrayList<BlogreplyVO> list(int blogno);
  /*    
  public BlogVO read(int blogreplyno);
  
  public int update(BlogreplyVO blogreplyVO);

  public int delete(int blogreplyno);
  */
  
}


