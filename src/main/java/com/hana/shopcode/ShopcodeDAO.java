package com.hana.shopcode;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("com.hana.shopcode.ShopcodeDAO")
public class ShopcodeDAO implements ShopcodeMapperInter{
  @Autowired
  private SqlSession sqlSession; // MyBATIS 3 ¿¬°á °´Ã¼
  
  public ShopcodeDAO(){
    System.out.println("--> ShopcodeDAO created.");
  }
  
  public ShopcodeMapperInter mapper(){
    ShopcodeMapperInter mapper = sqlSession.getMapper(ShopcodeMapperInter.class);    
    
    return mapper;
  }

  @Override
  public int create(ShopcodeVO shopcodeVO) {
    return mapper().create(shopcodeVO);
  }

  @Override
  public ArrayList<ShopcodeVO> list() {
    return mapper().list();
  }

  @Override
  public int update(ShopcodeVO shopcodeVO) {
    return mapper().update(shopcodeVO);
  }

  @Override
  public int delete(int codeno) {
    return mapper().delete(codeno);
  }

  @Override
  public int read(int codeno) {
    return mapper().read(codeno);
  }
  
}
