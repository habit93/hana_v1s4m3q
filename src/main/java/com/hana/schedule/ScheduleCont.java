package com.hana.schedule;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ScheduleCont {
  @Autowired
  @Qualifier("com.hana.schedule.ScheduleDAO")
  private ScheduleDAO scheduleDAO;

  public ScheduleCont(){
    System.out.println("--> ScheduleCont created.");
  }
  

  
  @RequestMapping(value = "/schedule/create.do", method = RequestMethod.POST)
  public ModelAndView create(ScheduleVO scheduleVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/schedule/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (scheduleDAO.create(scheduleVO) == 1) { 
      mav.setViewName("redirect:/schedule/list.do"); // 확장자 명시!!!
 
    } else {
      msgs.add("스케줄 등록에 실패했습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");

      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }

    return mav;
  }
  

  @RequestMapping(value = "/schedule/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/schedule/list");
    mav.addObject("list", scheduleDAO.list());

    return mav;
  }
  
  
  @RequestMapping(value = "/schedule/update.do", method = RequestMethod.POST)
  public ModelAndView update(ScheduleVO scheduleVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/schedule/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (scheduleDAO.update(scheduleVO) == 1) {
      mav.setViewName("redirect:/schedule/list.do"); // 확장자 명시!!!
    } else {
      msgs.add("스케줄 변경에 실패했습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");

      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }

    return mav;
  }
  

  @RequestMapping(value = "/schedule/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int scheduleno) { 
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/schedule/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (scheduleDAO.delete(scheduleno) == 1) {
      mav.setViewName("redirect:/schedule/list.do"); // 확장자 명시!!!
    } else {
      msgs.add("스케줄 삭제에 실패했습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");

      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    } 

    return mav;
  }

  
}
