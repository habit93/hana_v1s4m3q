package com.hana.shopcode;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ShopcodeCont {
  @Autowired
  @Qualifier("com.hana.shopcode.ShopcodeDAO")
  private ShopcodeDAO shopcodeDAO;
  
  public ShopcodeCont(){
    System.out.println("--> ShopcodeCont created.");
  }
  
  @RequestMapping(value = "/shopcode/create.do", method = RequestMethod.POST)
  public ModelAndView create(ShopcodeVO shopcodeVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/shopcode/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (shopcodeDAO.create(shopcodeVO) == 1) {
      mav.setViewName("redirect:/shopcode/list.do"); // 확장자 명시!!!
    } else {
      msgs.add("코드 등록에 실패했습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");

      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }

    return mav;
  }
  
  @RequestMapping(value = "/shopcode/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/shopcode/list");
    mav.addObject("list", shopcodeDAO.list());

    return mav;
  }
  
  @RequestMapping(value = "/shopcode/update.do", method = RequestMethod.POST)
  public ModelAndView update(ShopcodeVO shopcodeVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/shopcode/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (shopcodeDAO.update(shopcodeVO) == 1) {
      mav.setViewName("redirect:/shopcode/list.do"); // 확장자 명시!!!
    } else {
      msgs.add("코드 변경에 실패했습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");

      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }
    return mav;
  }
  
  @RequestMapping(value = "/shopcode/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int codeno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/shopcode/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (shopcodeDAO.delete(codeno) == 1) {
      mav.setViewName("redirect:/shopcode/list.do"); // 확장자 명시!!!
      // msgs.add("코드를 등록했습니다.");
      // links.add("<button type='button' onclick=\"location.href='./create.do'\">계속 등록</button>");
    } else {
      msgs.add("코드 삭제에 실패했습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");

      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }

    return mav;
  }
  
}
