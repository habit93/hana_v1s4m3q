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
  
  // <update id="update_codeno" parameterType="ShopcategoryVO">
  public int update_codeno(ShopcategoryVO shopcategoryVO);
  
  // <update id="update_orderno" parameterType="BlogcategoryVO">
  public int update_sort(ShopcategoryVO shopcategoryVO);

}
