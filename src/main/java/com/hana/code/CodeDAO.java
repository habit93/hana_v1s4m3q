package com.hana.code;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("com.hana.code.CodeDAO")
public class CodeDAO implements CodeMapperInter{
  @Autowired
  private SqlSession sqlSession; // MyBATIS 3 ���� ��ü
  
  public CodeDAO(){
    System.out.println("--> CodeDAO created.");
  }
  
  public CodeMapperInter mapper(){
    CodeMapperInter mapper = sqlSession.getMapper(CodeMapperInter.class);    
    
    return mapper;
  }

  /**
   * �ڵ� ���
   * <insert id="create" parameterType="CodeVO">
   * @param codeVO
   * @return
   */
  @Override
  public int create(CodeVO codeVO) {
    return mapper().create(codeVO);
  }

  /**
   * �ڵ� ���
   * <select id="list" resultType="CodeVO">
   * @return
   */
  @Override
  public ArrayList<CodeVO> list() {
    return mapper().list();
  }

  @Override
  public int update(CodeVO codeVO) {
    return mapper().update(codeVO);
  }

  @Override
  public int delete(int codeno) {
    return mapper().delete(codeno);
  }
  
}