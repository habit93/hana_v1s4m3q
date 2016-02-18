package com.hana.shopcategory;

import java.util.ArrayList;

public interface ShopcategoryMapperInter {

  // <insert id="create" parameterType="ShopcategoryVO">
  public int create(ShopcategoryVO shopcategoryVO);
  
  // <select id="list" resultType="ShopcategoryVO">
  public ArrayList<ShopcategoryVO> list();
  
  // <select id="update" parameterType="ShopcategoryVO">
  public int update(ShopcategoryVO shopcategoryVO);
  
  // <delete id="delete" parameterType="int">
  public int delete(int categoryno);
}
