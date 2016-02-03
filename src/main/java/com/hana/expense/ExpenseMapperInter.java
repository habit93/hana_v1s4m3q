package com.hana.expense;

import java.util.ArrayList;



public interface ExpenseMapperInter {

  public int create(ExpenseVO expenseVO);

  public ArrayList<ExpenseVO> list();
  
 
  public int update(ExpenseVO expenseVO);
  
  /* 
  public int delete(int expenseno);
  */
  
}


