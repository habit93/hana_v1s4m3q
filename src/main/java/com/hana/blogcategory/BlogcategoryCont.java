package com.hana.blogcategory;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hana.code.CodeDAO;
import com.hana.code.CodeVO;

@Controller
public class BlogcategoryCont {
  @Autowired
  @Qualifier("com.hana.blogcategory.BlogcategoryDAO")
  private BlogcategoryDAO blogcategoryDAO;

  @Autowired
  @Qualifier("com.hana.code.CodeDAO")
  private CodeDAO codeDAO;
  
  public BlogcategoryCont(){
    System.out.println("--> BlogcategoryCont created.");
  }
  
  @RequestMapping(value = "/blogcategory/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/blogcategory/create"); 
    
    ArrayList<CodeVO> code_list = codeDAO.list();
    mav.addObject("code_list", code_list);
    
    return mav;
  }

  @RequestMapping(value = "/blogcategory/create.do", method = RequestMethod.POST)
  public ModelAndView create(BlogcategoryVO blogcategoryVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/blogcategory/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (blogcategoryDAO.create(blogcategoryVO) == 1) {
      msgs.add("�Խ����� ��ϵƽ��ϴ�.");
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
  
  /**
   * ��ü ����� ����մϴ�.
   * @return
   */
  @RequestMapping(value = "/blogcategory/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/blogcategory/list");
    mav.addObject("list", blogcategoryDAO.list());
    // request.setAttribute("list", blogcategoryDAO.list());
    
    return mav;
  }
  
  @RequestMapping(value="/blogcategory/update.do", method=RequestMethod.POST)
  public ModelAndView update(BlogcategoryVO blogcategoryVO){
    ModelAndView mav = new ModelAndView();
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
  
    if (blogcategoryDAO.update(blogcategoryVO) == 1){
      mav.setViewName("redirect:/blogcategory/list.do"); // Ȯ���� ���!!
    }else{
      mav.setViewName("redirect:/blogcategory/list.do"); // Ȯ���� ���!!
      msgs.add("ȸ�� ���� ������ �����Ͽ����ϴ�.");
      links.add("<button type'button' onclick=\"location.href='./list.do'\">���</button>");
    }
  
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
  
    return mav;
  }
  
  @RequestMapping(value = "/blogcategory/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int blogcategoryno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/blogcategory/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    if (blogcategoryDAO.delete(blogcategoryno) == 1) {
      mav.setViewName("redirect:/blogcategory/list.do");//Ȯ���� ���
    } else {
      msgs.add("�Խ��� �ڵ� ������ �����߽��ϴ�.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">���</button>");
    }

    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }
  
  /**
   * codeno ���� GET
   * @return
   */
  @RequestMapping(value="/blogcategory/codeno_update.do", method=RequestMethod.GET)
  public ModelAndView codeno_update(){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/blogcategory/codeno_update");
    
    ArrayList<CodeVO> code_list = codeDAO.list();
    mav.addObject("code_list", code_list);
    
    return mav;
  }

  /**
   * codeno ���� POST
   * @param memberVO
   * @return
   */
  @RequestMapping(value="/blogcategory/codeno_update.do", method=RequestMethod.POST)
  public ModelAndView codeno_update(BlogcategoryVO blogcategoryVO){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/blogcategory/popup_message");
    
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    int cnt = blogcategoryDAO.update_codeno(blogcategoryVO);
    
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
  @RequestMapping(value="/blogcategory/update_orderno.do", method=RequestMethod.GET)
  public ModelAndView update_orderno(BlogcategoryVO blogcategoryVO){  
    ModelAndView mav = new ModelAndView();                  

    if (blogcategoryDAO.update_orderno(blogcategoryVO) == 1) {
      mav.setViewName("redirect:/blogcategory/list.do");
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
  
  /**
   * ��¸��(visible)��ȯ
   * @param blogcategoryVO
   * @return
   */
  @RequestMapping(value="/blogcategory/update_visible.do", method=RequestMethod.POST)
  public ModelAndView update_visible(BlogcategoryVO blogcategoryVO){
    ModelAndView mav = new ModelAndView();
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    if (blogcategoryVO.getVisible().equals("Y")){
      blogcategoryVO.setVisible("N");
    }else{
      blogcategoryVO.setVisible("Y");
    }
    
    blogcategoryDAO.update_visible(blogcategoryVO);
    
    mav.setViewName("redirect:/blogcategory/list.do"); //Ȯ���� ���!!!
    
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
    
    return mav;
  }
  
  
  
  
  
  
  
  
  
  
  
}

