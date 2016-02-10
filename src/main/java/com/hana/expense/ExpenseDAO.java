package com.hana.expense;



import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("com.hana.expense.ExpenseDAO")
public class ExpenseDAO implements ExpenseMapperInter{
  @Autowired
  private SqlSession sqlSession; // MyBATIS 3 ¿¬°á °´Ã¼
  
  public ExpenseDAO(){
    System.out.println("--> ExpenseDAO created.");
  }
   
  public ExpenseMapperInter mapper(){
    ExpenseMapperInter mapper = sqlSession.getMapper(ExpenseMapperInter.class);    
    
    return mapper;
  }

  @Override
  public int create(ExpenseVO expenseVO) {
    return mapper().create(expenseVO); 
  }
  
  @Override
  public ArrayList<ExpenseVO> list() {
    return mapper().list();
  }
  
  @Override
  public int update(ExpenseVO expenseVO) {
    return mapper().update(expenseVO);
  }

  @Override
  public int delete(int expenseno) {
    return mapper().delete(expenseno);
  }

  @Override
  public ArrayList<ExpenseVO> sumlist(String month) {
    return mapper().sumlist(month);
  }

  
  

}

