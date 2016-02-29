package com.hana.blog;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("com.hana.blog.BlogDAO")
public class BlogDAO implements BlogMapperInter{
  @Autowired
  private SqlSession sqlSession; // MyBATIS 3 ¿¬°á °´Ã¼
  
  public BlogDAO(){
    System.out.println("--> BlogDAO created.");
  }
  
  public BlogMapperInter mapper(){
    BlogMapperInter mapper = sqlSession.getMapper(BlogMapperInter.class);    
    
    return mapper;
  }

  @Override
  public int create(BlogVO blogVO) {
    return mapper().create(blogVO);
  }

  @Override
  public ArrayList<BlogVO> list() {
    return mapper().list();
  }

  @Override
  public BlogVO read(int blogno) {
    return mapper().read(blogno);
  }

  @Override
  public int update(BlogVO blogVO) {
    return mapper().update(blogVO);
  }

  @Override
  public int delete(int blogno) {
    return mapper().delete(blogno);
  }

  @Override
  public ArrayList<BlogVO> list2(BlogVO blogVO) {
    return mapper().list2(blogVO);
  }

  @Override
  public int cnt_up(int blogno) {
    return mapper().cnt_up(blogno);
  }

  @Override
  public int good_up(BlogVO blogVO) {
    return mapper().good_up(blogVO);
  }
  
}

