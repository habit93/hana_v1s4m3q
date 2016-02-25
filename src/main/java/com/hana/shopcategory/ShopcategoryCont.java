package com.hana.shopcategory;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hana.item.ItemDAO;
import com.hana.shopcode.ShopcodeDAO;
import com.hana.shopcode.ShopcodeVO;

@Controller
public class ShopcategoryCont {
  @Autowired
  @Qualifier("com.hana.shopcategory.ShopcategoryDAO")
  private ShopcategoryDAO shopcategoryDAO;
  
  @Autowired
  @Qualifier("com.hana.shopcode.ShopcodeDAO")
  private ShopcodeDAO shopcodeDAO;
  
  @Autowired
  @Qualifier("com.hana.item.ItemDAO")
  private ItemDAO itemDAO;
  
  public ShopcategoryCont(){
    System.out.println("--> ShopcategoryCont created.");
  }
  
  @RequestMapping(value = "/shopcategory/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/shopcategory/create"); // /webapp/blogcategory/create.jsp
    
    ArrayList<ShopcodeVO> code_list = shopcodeDAO.list();
    mav.addObject("code_list", code_list);
    
    return mav;
  }
  
  @RequestMapping(value = "/shopcategory/create.do", method = RequestMethod.POST)
  public ModelAndView create(ShopcategoryVO shopcategoryVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/shopcategory/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (shopcategoryDAO.create(shopcategoryVO) == 1) {
      msgs.add("�Խ����� ��ω���ϴ�.");
      links.add("<button type='button' onclick=\"location.href='./create.do'\">��� ���</button>");
    } else {
      msgs.add("�Խ��� ��Ͽ� �����߽��ϴ�.");
      msgs.add("�˼������� �ٽ��ѹ� �õ����ּ���.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
    }

    links.add("<button type='button' onclick=\"location.href='./list.do'\">ī�װ� ���</button>");

    // request.setAttribute("msgs", msgs);
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }
  
  @RequestMapping(value = "/shopcategory/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/shopcategory/list");
    mav.addObject("list", shopcategoryDAO.list());
    
    return mav;
  }
  
  @RequestMapping(value = "/shopcategory/update.do", method = RequestMethod.POST)
  public ModelAndView update(ShopcategoryVO shopcategoryVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/shopcategory/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (shopcategoryDAO.update(shopcategoryVO) == 1) {
      mav.setViewName("redirect:/shopcategory/list.do"); // Ȯ���� ���!!!
    } else {
      msgs.add("�ڵ� ���濡 �����߽��ϴ�.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">���</button>");

      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }
    return mav;
  }
  
  @RequestMapping(value = "/shopcategory/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int categoryno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/shopcategory/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (shopcategoryDAO.delete(categoryno) == 1) {
      mav.setViewName("redirect:/shopcategory/list.do"); // Ȯ���� ���!!!
      // msgs.add("�ڵ带 ����߽��ϴ�.");
      // links.add("<button type='button' onclick=\"location.href='./create.do'\">��� ���</button>");
    } else {
      msgs.add("�ڵ� ������ �����߽��ϴ�.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">���</button>");

      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }
    return mav;
  }
  /**
   * codeno ���� GET
   * @return
   */
  @RequestMapping(value="/shopcategory/codeno_update.do", method=RequestMethod.GET)
  public ModelAndView codeno_update(){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/shopcategory/codeno_update"); // /webapp/blogcategory/create.jsp
    
    ArrayList<ShopcodeVO> shopcode_list = shopcodeDAO.list();
    mav.addObject("shopcode_list", shopcode_list);
    
    return mav;
  }

  /**
   * codeno ���� POST
   * @param memberVO
   * @return
   */
  @RequestMapping(value="/shopcategory/codeno_update.do", method=RequestMethod.POST)
  public ModelAndView codeno_update(ShopcategoryVO shopcategoryVO){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/shopcategory/popup_message");
    
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    int cnt = shopcategoryDAO.update_codeno(shopcategoryVO);
    
    if(cnt != 1 ){
      msgs.add("codeno ������ �����߽��ϴ�.");
      msgs.add("�˼������� �ٽ��ѹ� �õ����ּ���.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"popup_close()\">�ݱ�</button>");
    }
    
    mav.addObject("cnt", cnt);
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
    
    return mav;
  }
  /**
   * ��� ���� ����
   * @param blogcategoryVO
   * @return
   */
  @RequestMapping(value="/shopcategory/update_sort.do", method=RequestMethod.GET)
  public ModelAndView update_orderno(ShopcategoryVO shopcategoryVO){  
    ModelAndView mav = new ModelAndView();                  

    if (shopcategoryDAO.update_sort(shopcategoryVO) == 1) {
      mav.setViewName("redirect:/shopcategory/list.do");
    } else {
      ArrayList<String> msgs = new ArrayList<String>();
      ArrayList<String> links = new ArrayList<String>();

      mav.setViewName("/blogcategory/message");
      msgs.add("�˼��մϴ�, �켱���� ������ �����߽��ϴ�.");
      msgs.add("�ٽ� �õ� ���ֽʽÿ�.");
      links.add("<button type='button' onclick=\"history.back()\">�ڷΰ���</button>"); 
      links.add("<button type='button' onclick=\"location.href='./list.do'\">ȸ�� ���</button>");
      
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);    
    }
    
    return mav;
  } 

}
