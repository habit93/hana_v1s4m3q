package com.hana.expense;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hana.category.CategoryDAO;
import com.hana.category.CategoryVO;
import com.hana.income.IncomeDAO;

@Controller
public class ExpenseCont {
  @Autowired
  @Qualifier("com.hana.expense.ExpenseDAO")
  private ExpenseDAO expenseDAO;

  @Autowired
  @Qualifier("com.hana.category.CategoryDAO")
  private CategoryDAO categoryDAO;
  
  @Autowired
  @Qualifier("com.hana.income.IncomeDAO")
  private IncomeDAO incomeDAO;
  
  public ExpenseCont(){
    System.out.println("--> ExpenseCont created.");
  }
  
  @RequestMapping(value = "/expense/create.do", method = RequestMethod.GET)
  public ModelAndView creat() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/expense/create");
    
    ArrayList<CategoryVO> category_list = categoryDAO.list();
    mav.addObject("category_list", category_list);

    return mav;
  }

  @RequestMapping(value = "/expense/create.do", method = RequestMethod.POST)
  public ModelAndView create(ExpenseVO expenseVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/expense/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (expenseDAO.create(expenseVO) == 1) {
      mav.setViewName("redirect:/expense/list.do"); // 확장자 명시!!!

    } else {
      msgs.add("지출 등록에 실패했습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");

      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }

    return mav;
  }
  
  @RequestMapping(value = "/expense/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/expense/list");
    mav.addObject("list", expenseDAO.list());
    
    ArrayList<CategoryVO> category_list = categoryDAO.list();
    mav.addObject("category_list", category_list);
    
    return mav;
  }

  @RequestMapping(value = "/expense/update.do", method = RequestMethod.POST)
  public ModelAndView update(ExpenseVO expenseVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/expense/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (expenseDAO.update(expenseVO) == 1) {
      mav.setViewName("redirect:/expense/list.do"); // 확장자 명시!!!
    } else {
      msgs.add("지출 변경에 실패했습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");

      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }
 
    return mav;
  }
  
  @RequestMapping(value = "/expense/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int expenseno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/expense/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (expenseDAO.delete(expenseno) == 1) {
      mav.setViewName("redirect:/expense/list.do"); // 확장자 명시!!!
    } else {
      msgs.add("지출 삭제에 실패했습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");

      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }

    return mav;
  }

  @RequestMapping(value = "/expense/sum.do", method = RequestMethod.GET)
  public ModelAndView sum() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/expense/sum");

    mav.addObject("ex_list", expenseDAO.list());
    mav.addObject("in_list", incomeDAO.list()); 
    
    return mav;
  }
  
  @RequestMapping(value = "/expense/sumlist.do", method = RequestMethod.GET)
  public ModelAndView sumlist(String month) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/expense/sumlist");
    mav.addObject("sumlist", expenseDAO.sumlist(month));
    
    return mav;
  }
  
  @RequestMapping(value = "/expense/summonth.do", method = RequestMethod.GET)
  public ModelAndView summonth(String month) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/expense/summonth");
    mav.addObject("sumlist1", expenseDAO.sumlist(month));
    mav.addObject("sumlist2", incomeDAO.sumlist(month));
    
    return mav;
  }


}
