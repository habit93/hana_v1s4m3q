package com.hana.income;



import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("com.hana.income.IncomeDAO")
public class IncomeDAO implements IncomeMapperInter{
  @Autowired
  private SqlSession sqlSession; // MyBATIS 3 ¿¬°á °´Ã¼
  
  public IncomeDAO(){
    System.out.println("--> IncomeDAO created.");
  }
   
  public IncomeMapperInter mapper(){
    IncomeMapperInter mapper = sqlSession.getMapper(IncomeMapperInter.class);    
    
    return mapper;
  }

  @Override
  public int create(IncomeVO incomeVO) {
    return mapper().create(incomeVO); 
  }

  @Override
  public ArrayList<IncomeVO> list() {
    return mapper().list();
  }

  @Override
  public int update(IncomeVO incomeVO) {
    return mapper().update(incomeVO);
  }

  @Override
  public int delete(int incomeno) {
    return mapper().delete(incomeno);
  }

  @Override
  public ArrayList<IncomeVO> sumlist(String month) {
    return mapper().sumlist(month); 
  }

}

