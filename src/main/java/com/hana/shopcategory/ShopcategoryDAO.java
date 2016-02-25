package com.hana.shopcategory;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("com.hana.shopcategory.ShopcategoryDAO")
public class ShopcategoryDAO implements ShopcategoryMapperInter{
  @Autowired
  private SqlSession sqlSession; // MyBATIS 3 ¿¬°á °´Ã¼
  
  public ShopcategoryDAO(){
    System.out.println("--> ShopategoryDAO created.");
  }
  
  public ShopcategoryMapperInter mapper(){
    ShopcategoryMapperInter mapper = sqlSession.getMapper(ShopcategoryMapperInter.class);    
    
    return mapper;
  }

  @Override
  public int create(ShopcategoryVO shopcategoryVO) {
    return mapper().create(shopcategoryVO);
  }

  @Override
  public ArrayList<ShopcategoryVO> list() {
    return mapper().list();
  }

  @Override
  public int update(ShopcategoryVO shopcategoryVO) {
    return mapper().update(shopcategoryVO);
  }

  @Override
  public int delete(int categoryno) {
    return mapper().delete(categoryno);
  }

  @Override
  public int update_codeno(ShopcategoryVO shopcategoryVO) {
    return mapper().update_codeno(shopcategoryVO);
  }

  @Override
  public int update_sort(ShopcategoryVO shopcategoryVO) {
    return mapper().update_sort(shopcategoryVO);
  }

}
