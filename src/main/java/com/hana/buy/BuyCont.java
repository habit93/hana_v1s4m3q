package com.hana.buy;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hana.member.MemberVO;
import com.hana.shopcategory.ShopcategoryVO;
import com.hana.shopcode.ShopcodeDAO;
import com.hana.shopcode.ShopcodeVO;

@Controller
public class BuyCont {
  @Autowired
  @Qualifier("com.hana.buy.BuyDAO")
  private BuyDAO buyDAO;

  public BuyCont(){
    System.out.println("--> BuyCont created.");
  }
  
  
  @RequestMapping(value = "/buy/buy.do", method = RequestMethod.POST)
  public ModelAndView buy(BuyVO buyVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/buy/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (buyDAO.create(buyVO) == 1) {
      msgs.add("구매에 성공했습니다.");
      links.add("<button type='button' onclick=\"location.href='../shopcategory/list.do'\">카테고리로 이동</button>");
    } else {
      msgs.add("게시판 등록에 실패했습니다.");
      msgs.add("죄송하지만 다시한번 시도해주세요.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
    }

    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }
  
  @RequestMapping(value = "/buy/list.do", method = RequestMethod.GET)
  public ModelAndView list(int mno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/buy/list");
    mav.addObject("list", buyDAO.list(mno));

    return mav;
  }
  
  @RequestMapping(value = "/buy/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int buyno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/buy/delete"); // /webapp/member/delete.jsp
    mav.addObject("buyno", buyno);
    
    return mav;
  }

  @RequestMapping(value = "/buy/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(BuyVO buyVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/buy/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (buyDAO.delete(buyVO.getBuyno()) == 1) {
      msgs.add("구매를 취소했습니다.");
      links.add("<button type='button' onclick=\"location.href='./index.do'\"></button>");
    } else {
      msgs.add("구매 취소에 실패했습니다.");
      msgs.add("죄송하지만 다시한번 시도해주세요.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
    }

    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }
}
