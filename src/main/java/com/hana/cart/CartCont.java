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
      msgs.add("����īƮ��  �߰��߽��ϴ�..");
      links.add("<button type='button' onclick=\"location.href='../index.do'\">Ȩ����</button>");
    } else {
      msgs.add("�Խ��� ��Ͽ� �����߽��ϴ�.");
      msgs.add("�˼������� �ٽ��ѹ� �õ����ּ���.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
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
      msgs.add("����īƮ���� �����߽��ϴ�.");
      links.add("<button type='button' onclick=\"location.href='../index.do'\">Ȩ</button>");
    } else {
      msgs.add("���� ��ҿ� �����߽��ϴ�.");
      msgs.add("�˼������� �ٽ��ѹ� �õ����ּ���.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"location.href='../index.do'\">Ȩ</button>");
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
      msgs.add("���ſ� �����߽��ϴ�..");
      links.add("<button type='button' onclick=\"location.href='../shopcategory/list.do'\">ī�װ��� �̵�</button>");
      }
    } else {
      msgs.add("�Խ��� ��Ͽ� �����߽��ϴ�.");
      msgs.add("�˼������� �ٽ��ѹ� �õ����ּ���.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
    }

    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }
  
}
