package com.hana.blogcategory;

import java.util.ArrayList;

public interface BlogcategoryMapperInter {
  /**
   * 블로그 카테고리를 등록합니다.
   * <insert id="create" parameterType="BlogcategoryVO">
   * @param blogcategoryVO
   * @return
   */
  public int create(BlogcategoryVO blogcategoryVO);
  
  // <select id="list" resultType="BlogcategoryVO">
  public ArrayList<BlogcategoryVO> list();
  
  // <select id="read" resultType="BlogcategoryVO" parameterType="int">
  public BlogcategoryVO read(int blogcategoryno);
  
  // <update id="update" parameterType="BlogcategoryVO">
  public int update(BlogcategoryVO blogcategoryVO);
  
  // <delete id="delete" parameterType="int">
  public int delete(int blogcategoryno); 
  
  // <update id="update_grp" parameterType="BlogcategoryVO">
  public int update_codeno(BlogcategoryVO blogcategoryVO); 
  
  // <update id="update_orderno" parameterType="BlogcategoryVO">
  public int update_orderno(BlogcategoryVO blogcategoryVO);
  
  // <update id="update_visible" parameterType="BlogcategoryVO">
  public int update_visible(BlogcategoryVO blogcategoryVO);
  
}








