package com.hana.blogreply;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class BlogreplyCont {
  @Autowired
  @Qualifier("com.hana.blogreply.BlogreplyDAO")
  private BlogreplyDAO blogreplyDAO;
  
  public BlogreplyCont(){
    System.out.println("--> BlogreplyCont created.");
  }

  @RequestMapping(value="/blogreply/create.do", method=RequestMethod.POST)
  public ModelAndView create(BlogreplyVO blogreplyVO){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/blog/message");
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    if (blogreplyDAO.create(blogreplyVO) == 1){
    /* mav.setViewName("redirect:/blog/read.do?blogno=" + blogreplyVO.getBlogno() + "&blogcategoryno=" + blogreplyVO.getBlogcategoryno()); // 확장자 명시
*/   }else{
      msgs.add("댓글 등록에 실패했습니다.");
      msgs.add("다시 시도해주세요.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='../blog/read.do?blogno="+blogreplyVO.getBlogno()+"'\">취소</button>");
 
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }
        
    return mav;
  }
 /* 
  @RequestMapping(value = "/blog/list.do", method = RequestMethod.GET)
  public ModelAndView list(){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/blog/list");
    mav.addObject("list", blogDAO.list());
    
    return mav;
  }
  
  
  @RequestMapping(value = "/blog/list2.do", method = RequestMethod.GET)
  public ModelAndView list2(BlogVO blogVO){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/blog/list2");
    mav.addObject("list", blogDAO.list2(blogVO));
    mav.addObject("blogVO", blogVO);

    BlogcategoryVO vo = blogcategoryDAO.read(blogVO.getBlogcategoryno());
    mav.addObject("title", vo.getTitle());
    
    return mav;
  }
  
  @RequestMapping(value = "/blog/read.do", method = RequestMethod.GET)
  public ModelAndView read(int blogno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/blog/read");
    mav.addObject("blogVO", blogDAO.read(blogno));
 
    
    return mav;
  }
  
  @RequestMapping(value = "/blog/read2.do", method = RequestMethod.GET)
  public ModelAndView read(int blogno, int blogcategoryno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/blog/read");
    mav.addObject("blogVO", blogDAO.read(blogno));
    
    BlogcategoryVO vo = blogcategoryDAO.read(blogcategoryno);
    mav.addObject("title", vo.getTitle());

    return mav;
  }

  @RequestMapping(value="/blog/update.do", 
      method=RequestMethod.GET)
  public ModelAndView update(int blogno){  
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/blog/update");
    
    BlogVO blogVO = blogDAO.read(blogno);
    mav.addObject("blogVO", blogDAO.read(blogno)); 
    
    BlogcategoryVO vo = blogcategoryDAO.read(blogVO.getBlogcategoryno());
    mav.addObject("title", vo.getTitle());
    
    return mav;

  }

  @RequestMapping(value="/blog/update.do", method=RequestMethod.POST) 
  public ModelAndView update(BlogVO blogVO, HttpServletRequest request){
    ModelAndView mav = new ModelAndView();
   
    BlogVO blogVO_old = blogDAO.read(blogVO.getBlogno());
    
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 
    if(blogDAO.update(blogVO) == 1){
      // 수정후 조회로 자동 이동
      mav.setViewName("redirect:/blog/read.do?blogno=" + blogVO.getBlogno() + "&blogcategoryno=" + blogVO.getBlogcategoryno()); // 확장자 명시
    }else{
      msgs.add("게시판 수정에 실패 하셨습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시 시도</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do?blogcategoryno="+blogVO.getBlogcategoryno()+"'\">목록</button>");
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }
    
    return mav;
  }

  @RequestMapping(value = "/blog/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int blogno, int blogcategoryno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/blog/delete"); // /webapp/member/delete.jsp
    mav.addObject("blogno", blogno);
    mav.addObject("blogcategoryno", blogcategoryno);
    
    BlogcategoryVO vo = blogcategoryDAO.read(blogcategoryno);
    mav.addObject("title", vo.getTitle());
    
    return mav;
  }
  
  @RequestMapping(value = "/blog/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(BlogVO blogVO,
                                        HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/blog/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

  

    if (blogDAO.delete(blogVO.getBlogno()) == 1) {
      mav.setViewName("redirect:/blog/list2.do?blogcategoryno=" + blogVO.getBlogcategoryno());//확장자 명시
    } else {
      msgs.add("글 삭제에 실패했습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
      links.add("<button type='button' onclick=\"location.href='./list2.do?blogcategoryno="+blogVO.getBlogcategoryno()+"'\">목록</button>");
    }
    
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
    
    return mav;
  }

*/
}

