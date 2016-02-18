package com.hana.income;

import java.util.ArrayList;


public interface IncomeMapperInter {

  public int create(IncomeVO incomeVO);
  
  public ArrayList<IncomeVO> list();
  
  public int update(IncomeVO incomeVO);
  
  public int delete(int incomeno);

  public ArrayList<IncomeVO> sumlist(String month);  
  
}


