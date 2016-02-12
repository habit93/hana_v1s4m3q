package com.hana.category;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class CategoryCont {
  @Autowired
  @Qualifier("com.hana.category.CategoryDAO")
  private CategoryDAO categoryDAO;

  public CategoryCont(){
    System.out.println("--> CategoryCont created.");
  }
  
  @RequestMapping(value = "/category/create.do", method = RequestMethod.POST)
  public ModelAndView create(CategoryVO categoryVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/category/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (categoryDAO.create(categoryVO) == 1) {
      mav.setViewName("redirect:/category/list.do"); // 확장자 명시!!!

    } else {
      msgs.add("코드 등록에 실패했습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");

      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }

    return mav;
  }
  
  @RequestMapping(value = "/category/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/category/list");
    mav.addObject("list", categoryDAO.list());

    return mav;
  }

  @RequestMapping(value = "/category/update.do", method = RequestMethod.POST)
  public ModelAndView update(CategoryVO categoryVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/category/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (categoryDAO.update(categoryVO) == 1) {
      mav.setViewName("redirect:/category/list.do"); // 확장자 명시!!!
    } else {
      msgs.add("지출 카테고리 변경에 실패했습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");

      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }

    return mav;
  }

  @RequestMapping(value = "/category/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int categoryno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/category/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (categoryDAO.delete(categoryno) == 1) {
      mav.setViewName("redirect:/category/list.do"); // 확장자 명시!!!
    } else {
      msgs.add("지출 카테고리 삭제에 실패했습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");

      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }
    return mav;
  }

  
}
