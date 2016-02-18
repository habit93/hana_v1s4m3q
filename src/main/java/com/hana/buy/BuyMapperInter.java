package com.hana.buy;

import java.util.ArrayList;

public interface BuyMapperInter {
  
  // <insert id="create" parameterType="BuyVO">
  public int create(BuyVO buyVO);
  
  // <select id="list" resultType="BuyVO" parameterType="int">
  public ArrayList<BuyVO> list(int mno);
  
  // <delete id="delete" parameterType="int">
  public int delete(int buyno);
}
