package com.hana.expense;



import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("com.hana.category.CategoryDAO")
public class ExpenseDAO implements ExpenseMapperInter{
  @Autowired
  private SqlSession sqlSession; // MyBATIS 3 ¿¬°á °´Ã¼
  
  public ExpenseDAO(){
    System.out.println("--> CategoryDAO created.");
  }
   
  public ExpenseMapperInter mapper(){
    ExpenseMapperInter mapper = sqlSession.getMapper(ExpenseMapperInter.class);    
    
    return mapper;
  }

  

  @Override
  public int create(ExpenseVO categoryVO) {
    return mapper().create(categoryVO);
  }

  @Override
  public ArrayList<ExpenseVO> list() {
    return mapper().list();
  }

  @Override
  public int update(ExpenseVO categoryVO) {
    return mapper().update(categoryVO);
  }

  @Override
  public int delete(int categoryno) {
    return mapper().delete(categoryno);
  }
  
  
  
}

