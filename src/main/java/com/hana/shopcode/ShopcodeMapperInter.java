package com.hana.shopcode;

import java.util.ArrayList;

public interface ShopcodeMapperInter {
  
  // <insert id="create" parameterType="ShopcodeVO">
  public int create(ShopcodeVO shopcodeVO);
  
  // <select id="list" resultType="ShopcodeVO">
  public ArrayList<ShopcodeVO> list();
  
  // <update id="update" parameterType="ShopcodeVO">
  public int update(ShopcodeVO shopcodeVO);
  
  // <delete id="delete" parameterType="int">
  public int delete(int codeno);
  
  // <select id="read" parameterType="int">
  public int read(int codeno);
}
