package com.hana.buy;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("com.hana.buy.BuyDAO")
public class BuyDAO implements BuyMapperInter{
  @Autowired
  private SqlSession sqlSession; // MyBATIS 3 ¿¬°á °´Ã¼
  
  public BuyDAO(){
    System.out.println("--> ShopategoryDAO created.");
  }
  
  public BuyMapperInter mapper(){
    BuyMapperInter mapper = sqlSession.getMapper(BuyMapperInter.class);    
    
    return mapper;
  }

  @Override
  public int create(BuyVO buyVO) {
    return mapper().create(buyVO);
  }

  @Override
  public ArrayList<BuyVO> list(int mno) {
    return mapper().list(mno);
  }

  @Override
  public int delete(int buyno) {
    return mapper().delete(buyno);
  }

}
