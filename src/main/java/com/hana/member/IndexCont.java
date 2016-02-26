package com.hana.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hana.blog.BlogDAO;
import com.hana.item.ItemDAO;

@Controller
public class IndexCont {
  @Autowired
  @Qualifier("com.hana.blog.BlogDAO")
  private BlogDAO blogDAO;
  @Autowired
  @Qualifier("com.hana.item.ItemDAO")
  private ItemDAO itemDAO;
  public IndexCont(){
    System.out.println("--> IndexCont created.");
  }
  
  @RequestMapping(value = "/index.do", method = RequestMethod.GET)
  public ModelAndView index() {
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("/index"); // /webapp/index.jsp
    mav.addObject("list", blogDAO.list());
    mav.addObject("list2", itemDAO.list_all());
    return mav;
  }

}
