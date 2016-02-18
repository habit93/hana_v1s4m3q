package com.hana.income;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IncomeCont {
  @Autowired
  @Qualifier("com.hana.income.IncomeDAO")
  private IncomeDAO incomeDAO;

  public IncomeCont(){
    System.out.println("--> IncomeCont created.");
  }
  

  
  @RequestMapping(value = "/income/create.do", method = RequestMethod.POST)
  public ModelAndView create(IncomeVO incomeVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/income/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (incomeDAO.create(incomeVO) == 1) { 
      mav.setViewName("redirect:/income/list.do"); // Ȯ���� ���!!!
 
    } else {
      msgs.add("�Է� ��Ͽ� �����߽��ϴ�.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">���</button>");

      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }

    return mav;
  }
  

  @RequestMapping(value = "/income/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/income/list");
    mav.addObject("list", incomeDAO.list());

    return mav;
  }
  

  @RequestMapping(value = "/income/update.do", method = RequestMethod.POST)
  public ModelAndView update(IncomeVO incomeVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/income/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (incomeDAO.update(incomeVO) == 1) {
      mav.setViewName("redirect:/income/list.do"); // Ȯ���� ���!!!
    } else {
      msgs.add("���� ���濡 �����߽��ϴ�.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">���</button>");

      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }

    return mav;
  }
  

  @RequestMapping(value = "/income/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int incomeno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/income/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (incomeDAO.delete(incomeno) == 1) {
      mav.setViewName("redirect:/income/list.do"); // Ȯ���� ���!!!
    } else {
      msgs.add("���� ������ �����߽��ϴ�.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">���</button>");

      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }

    return mav;
  }

  @RequestMapping(value = "/income/sumlist.do", method = RequestMethod.GET)
  public ModelAndView sumlist(String month) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/income/sumlist");
    mav.addObject("sumlist", incomeDAO.sumlist(month)); 
    
    return mav;
  }
}
