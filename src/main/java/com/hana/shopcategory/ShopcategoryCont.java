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
      msgs.add("게시판이 등록됬습니다.");
      links.add("<button type='button' onclick=\"location.href='./create.do'\">계속 등록</button>");
    } else {
      msgs.add("게시판 등록에 실패했습니다.");
      msgs.add("죄송하지만 다시한번 시도해주세요.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
    }

    links.add("<button type='button' onclick=\"location.href='./list.do'\">카테고리 목록</button>");

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
      mav.setViewName("redirect:/shopcategory/list.do"); // 확장자 명시!!!
    } else {
      msgs.add("코드 변경에 실패했습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");

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
      mav.setViewName("redirect:/shopcategory/list.do"); // 확장자 명시!!!
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
  /**
   * codeno 수정 GET
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
   * codeno 수정 POST
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
      msgs.add("codeno 수정에 실패했습니다.");
      msgs.add("죄송하지만 다시한번 시도해주세요.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"popup_close()\">닫기</button>");
    }
    
    mav.addObject("cnt", cnt);
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
    
    return mav;
  }
  /**
   * 출력 순서 변경
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
      msgs.add("죄송합니다, 우선순위 조정에 실패했습니다.");
      msgs.add("다시 시도 해주십시오.");
      links.add("<button type='button' onclick=\"history.back()\">뒤로가기</button>"); 
      links.add("<button type='button' onclick=\"location.href='./list.do'\">회원 목록</button>");
      
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);    
    }
    
    return mav;
  } 

}
