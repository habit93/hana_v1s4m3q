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
      msgs.add("게시판이 등록됐습니다.");
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
  
  /**
   * 전체 목록을 출력합니다.
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
      mav.setViewName("redirect:/blogcategory/list.do"); // 확장자 명시!!
    }else{
      mav.setViewName("redirect:/blogcategory/list.do"); // 확장자 명시!!
      msgs.add("회원 정보 수정에 실패하였습니다.");
      links.add("<button type'button' onclick=\"location.href='./list.do'\">목록</button>");
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
      mav.setViewName("redirect:/blogcategory/list.do");//확장자 명시
    } else {
      msgs.add("게시판 코드 삭제에 실패했습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");
    }

    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }
  
  /**
   * codeno 수정 GET
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
   * codeno 수정 POST
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
  @RequestMapping(value="/blogcategory/update_orderno.do", method=RequestMethod.GET)
  public ModelAndView update_orderno(BlogcategoryVO blogcategoryVO){  
    ModelAndView mav = new ModelAndView();                  

    if (blogcategoryDAO.update_orderno(blogcategoryVO) == 1) {
      mav.setViewName("redirect:/blogcategory/list.do");
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
  
  /**
   * 출력모드(visible)변환
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
    
    mav.setViewName("redirect:/blogcategory/list.do"); //확장자 명시!!!
    
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
    
    return mav;
  }
  
  
  
  
  
  
  
  
  
  
  
}

