package com.hana.blogreply;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("com.hana.blogreply.BlogreplyDAO")
public class BlogreplyDAO implements BlogreplyMapperInter{
  @Autowired
  private SqlSession sqlSession; // MyBATIS 3 ¿¬°á °´Ã¼
  
  public BlogreplyDAO(){
    System.out.println("--> BlogreplyDAO created.");
  }
  
  public BlogreplyMapperInter mapper(){
    BlogreplyMapperInter mapper = sqlSession.getMapper(BlogreplyMapperInter.class);    
    
    return mapper;
  }

  @Override
  public int create(BlogreplyVO blogreplyVO) {
    return mapper().create(blogreplyVO);
  }

  @Override
  public ArrayList<BlogreplyVO> list(int blogno) {
    return mapper().list(blogno);
  }
  /*
  @Override
  public BlogVO read(int blogreplyno) {
    return mapper().read(blogreplyno);
  }

  @Override
  public int update(BlogreplyVO blogreplyVO) {
    return mapper().update(blogreplyVO);
  }

  @Override
  public int delete(int blogreplyno) {
    return mapper().delete(blogreplyno);
  }
*/

  
}

