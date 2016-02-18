package com.hana.item;

import java.util.ArrayList;

public interface ItemMapperInter {

  // <insert id="create" parameterType="ItemVO">
  public int create(ItemVO itemVO);
  
  // <select id="list" resultType="ItemVO" parameterType="int">
  public ArrayList<ItemVO> list(ItemVO itemVO);
  
  // <select id="list2" resultType="ItemVO">
  public ArrayList<ItemVO> list2();
  
  // <select id="read" resultType="ItemVO" parameterType="int">
  public ItemVO read(int itemno);
  
  // <update id="update" parameterType="ItemVO">
  public int update(ItemVO itemVO);
  
  // <delete id="delete" parameterType="int">
  public int delete(int itemno);
}
