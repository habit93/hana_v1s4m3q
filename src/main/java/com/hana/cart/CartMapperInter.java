package com.hana.cart;

import java.util.ArrayList;

public interface CartMapperInter {
  
  // <insert id="create" parameterType="CartVO">
  public int create(CartVO cartVO);
  
  // <select id="list" resultType="CartVO" parameterType="int">
  public ArrayList<CartVO> list(int mno);
  
  // <delete id="delete" parameterType="int">
  public int delete(int cartno);
  
  //  <select id="read" resultType="CartVO" parameterType="int">
  public CartVO read(int cartno);
}
