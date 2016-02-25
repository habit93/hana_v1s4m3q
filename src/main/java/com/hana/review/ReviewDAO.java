package com.hana.review;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("com.hana.review.ReviewDAO")
public class ReviewDAO implements ReviewMapperInter{
  @Autowired
  private SqlSession sqlSession; // MyBATIS 3 ¿¬°á °´Ã¼
  
  public ReviewDAO(){
    System.out.println("--> ReviewDAO created.");
  }
  
  public ReviewMapperInter mapper(){
    ReviewMapperInter mapper = sqlSession.getMapper(ReviewMapperInter.class);    
    
    return mapper;
  }

  @Override
  public int create(ReviewVO reviewVO) {
    return mapper().create(reviewVO);
  }

  @Override
  public ArrayList<ReviewVO> list(int itemno) {
    return mapper().list(itemno);
  }

  @Override
  public ReviewVO read(int reviewno) {
    return mapper().read(reviewno);
  }

  @Override
  public int update(ReviewVO reviewVO) {
    return mapper().update(reviewVO);
  }

  @Override
  public int delete(int reviewno) {
    return mapper().delete(reviewno);
  }

  @Override
  public ArrayList<ReviewVO> list_all() {
    return mapper().list_all();
  }
  
}

