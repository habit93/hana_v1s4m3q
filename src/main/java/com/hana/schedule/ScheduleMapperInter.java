package com.hana.schedule;

import java.util.ArrayList;

public interface ScheduleMapperInter {

  public int create(ScheduleVO scheduleVO);
  
  public ArrayList<ScheduleVO> list();
  
  public int update(ScheduleVO scheduleVO);
  
  public int delete(int scheduleno);
  
}


