package com.hana.category;



import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("com.hana.category.CategoryDAO")
public class CategoryDAO implements CategoryMapperInter{
  @Autowired
  private SqlSession sqlSession; // MyBATIS 3 ¿¬°á °´Ã¼
  
  public CategoryDAO(){
    System.out.println("--> CategoryDAO created.");
  }
   
  public CategoryMapperInter mapper(){
    CategoryMapperInter mapper = sqlSession.getMapper(CategoryMapperInter.class);    
    
    return mapper;
  }

  

  @Override
  public int create(CategoryVO categoryVO) {
    return mapper().create(categoryVO);
  }

  @Override
  public ArrayList<CategoryVO> list() {
    return mapper().list();
  }

  @Override
  public int update(CategoryVO categoryVO) {
    return mapper().update(categoryVO);
  }

  @Override
  public int delete(int categoryno) {
    return mapper().delete(categoryno);
  }
  
  
  
}

