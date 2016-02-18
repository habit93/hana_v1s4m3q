package com.hana.blogcategory;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("com.hana.blogcategory.BlogcategoryDAO")
public class BlogcategoryDAO implements BlogcategoryMapperInter{
  @Autowired
  private SqlSession sqlSession; // MyBATIS 3 ���� ��ü
  
  public BlogcategoryDAO(){
    System.out.println("--> BlogcategoryDAO created.");
  }
  
  public BlogcategoryMapperInter mapper(){
    BlogcategoryMapperInter mapper = sqlSession.getMapper(BlogcategoryMapperInter.class);    
    
    return mapper;
  }

  /**
   * ��α� ī�װ��� ����մϴ�.
   * <insert id="create" parameterType="BlogcategoryVO">
   * @param blogcategoryVO
   * @return
   */
  @Override
  public int create(BlogcategoryVO blogcategoryVO) {
    return mapper().create(blogcategoryVO);
  }

  @Override
  public ArrayList<BlogcategoryVO> list() {
    return mapper().list();
  }

  @Override
  public int update(BlogcategoryVO blogcategoryVO) {
    return mapper().update(blogcategoryVO);
  }
  
  @Override
  public BlogcategoryVO read(int blogcategoryno) {
    return mapper().read(blogcategoryno);
  }
  
  @Override
  public int delete(int blogcategoryno) {
    return mapper().delete(blogcategoryno);
  }

  /**
   * �׷��ȣ�� �����մϴ�.
   */
  @Override
  public int update_codeno(BlogcategoryVO blogcategoryVO) {
    return mapper().update_codeno(blogcategoryVO);
  }

  /**
   * ��� ������ �����մϴ�.
   */
  @Override
  public int update_orderno(BlogcategoryVO blogcategoryVO) {
    return mapper().update_orderno(blogcategoryVO);
  }

  /**
   * ��� ����� ����
   */
  @Override
  public int update_visible(BlogcategoryVO blogcategoryVO) {
    return mapper().update_visible(blogcategoryVO);
  }


  

}



