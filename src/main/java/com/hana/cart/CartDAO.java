package com.hana.cart;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("com.hana.cart.CartDAO")
public class CartDAO implements CartMapperInter{
  @Autowired
  private SqlSession sqlSession; // MyBATIS 3 ¿¬°á °´Ã¼
  
  public CartDAO(){
    System.out.println("--> ShopategoryDAO created.");
  }
  
  public CartMapperInter mapper(){
    CartMapperInter mapper = sqlSession.getMapper(CartMapperInter.class);    
    
    return mapper;
  }

  @Override
  public int create(CartVO cartVO) {
    return mapper().create(cartVO);
  }

  @Override
  public ArrayList<CartVO> list(int mno) {
    return mapper().list(mno);
  }

  @Override
  public int delete(int cartno) {
    return mapper().delete(cartno);
  }

  @Override
  public CartVO read(int cartno) {
    return mapper().read(cartno);
  }


}
