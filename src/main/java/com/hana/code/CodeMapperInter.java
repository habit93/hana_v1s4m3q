package com.hana.code;

import java.util.ArrayList;

public interface CodeMapperInter {
  /**
   * �ڵ� ���
   * <insert id="create" parameterType="CodeVO">
   * @param codeVO
   * @return
   */
  public int create(CodeVO codeVO);
  
  /**
   * �ڵ� ���
   * <select id="list" resultType="CodeVO">
   * @return
   */
  public ArrayList<CodeVO> list();
  
  // <update id="update" parameterType="CodeVO">
  public int update(CodeVO codeVO);
  
  // <delete id="delete" parameterType="int">
  public int delete(int codeno);

}







