package com.hana.schedule;



import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("com.hana.schedule.ScheduleDAO")
public class ScheduleDAO implements ScheduleMapperInter{
  @Autowired
  private SqlSession sqlSession; // MyBATIS 3 ¿¬°á °´Ã¼
  
  public ScheduleDAO(){
    System.out.println("--> ScheduleDAO created.");
  }
   
  public ScheduleMapperInter mapper(){
    ScheduleMapperInter mapper = sqlSession.getMapper(ScheduleMapperInter.class);    
    
    return mapper;
  }


  @Override
  public int create(ScheduleVO scheduleVO) {
    return mapper().create(scheduleVO);  
  }

  @Override
  public ArrayList<ScheduleVO> list() {
    return mapper().list();
  }

  @Override
  public int update(ScheduleVO scheduleVO) {
    return mapper().update(scheduleVO);
  }

  @Override
  public int delete(int scheduleno) {
    return mapper().delete(scheduleno);
  }

  
}

