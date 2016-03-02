package com.hana.cart;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hana.buy.BuyDAO;
import com.hana.buy.BuyVO;
import com.hana.member.MemberVO;
import com.hana.shopcategory.ShopcategoryVO;
import com.hana.shopcode.ShopcodeDAO;
import com.hana.shopcode.ShopcodeVO;

@Controller
public class CartCont {
  @Autowired
  @Qualifier("com.hana.cart.CartDAO")
  private CartDAO cartDAO;
  
  @Autowired
  @Qualifier("com.hana.buy.BuyDAO")
  private BuyDAO buyDAO;
  
  public CartCont(){
    System.out.println("--> BuyCont created.");
  }
   
  @RequestMapping(value = "/cart/cart.do", method = RequestMethod.POST)
  public ModelAndView cart(CartVO cartVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/buy/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (cartDAO.create(cartVO) == 1) {
      msgs.add("쇼핑카트에  추가했습니다..");
      links.add("<button type='button' onclick=\"location.href='../index.do'\">홈으로</button>");
    } else {
      msgs.add("게시판 등록에 실패했습니다.");
      msgs.add("죄송하지만 다시한번 시도해주세요.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
    }

    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }
  
  @RequestMapping(value = "/cart/list.do", method = RequestMethod.GET)
  public ModelAndView list(int mno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/cart/list");
    mav.addObject("list", cartDAO.list(mno));

    return mav;
  }
  
  @RequestMapping(value = "/cart/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int cartno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/cart/delete"); // /webapp/member/delete.jsp
    mav.addObject("cartno", cartno);
    
    return mav;
  }

  @RequestMapping(value = "/cart/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(CartVO cartVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/cart/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (cartDAO.delete(cartVO.getCartno()) == 1) {
      msgs.add("쇼핑카트에서 제거했습니다.");
      links.add("<button type='button' onclick=\"location.href='../index.do'\">홈</button>");
    } else {
      msgs.add("구매 취소에 실패했습니다.");
      msgs.add("죄송하지만 다시한번 시도해주세요.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='../index.do'\">홈</button>");
    }

    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }
  
  @RequestMapping(value = "/cart/buy.do", method = RequestMethod.GET)
  public ModelAndView buy(int cartno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/cart/buy");
    mav.addObject("cartVO", cartDAO.read(cartno));

    return mav;
  }
  
  @RequestMapping(value = "/cart/buy.do", method = RequestMethod.POST)
  public ModelAndView buy(BuyVO buyVO, int cartno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/buy/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (buyDAO.create(buyVO) == 1) {
      if(cartDAO.delete(cartno) == 1){
      msgs.add("구매에 성공했습니다..");
      links.add("<button type='button' onclick=\"location.href='../shopcategory/list.do'\">카테고리로 이동</button>");
      }
    } else {
      msgs.add("게시판 등록에 실패했습니다.");
      msgs.add("죄송하지만 다시한번 시도해주세요.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
    }

    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }
  
}
