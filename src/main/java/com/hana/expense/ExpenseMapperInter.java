package com.hana.expense;

import java.util.ArrayList;



public interface ExpenseMapperInter {

  public int create(ExpenseVO categoryVO);
    
  public ArrayList<ExpenseVO> list();
  
  public int update(ExpenseVO categoryVO);
  
  public int delete(int categoryno);
}


