package com.hana.review;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hana.blogcategory.BlogcategoryDAO;
import com.hana.blogcategory.BlogcategoryVO;
import com.hana.code.CodeDAO;
import com.hana.code.CodeVO;
import com.hana.tool.Tool;
import com.hana.tool.Upload;

@Controller
public class ReviewCont {
  @Autowired
  @Qualifier("com.hana.review.ReviewDAO")
  private ReviewDAO reviewDAO;

  
  public ReviewCont(){
    System.out.println("--> ReviewCont created.");
  }

  @RequestMapping(value = "/review/create.do", method = RequestMethod.GET)
  public ModelAndView create(int itemno,int mno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/review/create"); 
    mav.addObject("itemno", itemno);
    mav.addObject("mno", mno);

    return mav;
  }

  
  @RequestMapping(value="/review/create.do", method=RequestMethod.POST)
  public ModelAndView create(ReviewVO reviewVO){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/review/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    if (reviewDAO.create(reviewVO) == 1){ 
      mav.setViewName("redirect:/item/read.do?itemno=" + reviewVO.getItemno()); 
    }else{
      msgs.add("리뷰 등록에 실패했습니다.");
      msgs.add("다시 시도해주세요.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");      
    }
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
    return mav;
  }
  
  @RequestMapping(value = "/review/list_all.do", method = RequestMethod.GET)
  public ModelAndView list(){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/review/list");
    mav.addObject("list", reviewDAO.list_all());
    
    return mav;
  }
  
  @RequestMapping(value = "/review/list.do", method = RequestMethod.GET)
  public ModelAndView list(int itemno){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/review/list");
    mav.addObject("list", reviewDAO.list(itemno));
    
    return mav;
  }
  

  @RequestMapping(value = "/review/read.do", method = RequestMethod.GET)
  public ModelAndView read(int reviewno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/review/read");
    mav.addObject("reviewVO", reviewDAO.read(reviewno));
    
    return mav;
  }

  @RequestMapping(value="/review/update.do", method=RequestMethod.GET)
  public ModelAndView update(int reviewno){  
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/review/update");

    mav.addObject("reviewVO", reviewDAO.read(reviewno)); 

    
    return mav;

  }

  @RequestMapping(value="/review/update.do", method=RequestMethod.POST) 
  public ModelAndView update(ReviewVO reviewVO){
    ModelAndView mav = new ModelAndView();
   
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    if(reviewDAO.update(reviewVO) == 1){
      mav.setViewName("redirect:/review/read.do?reviewno=" + reviewVO.getReviewno()); 
    }else{
      msgs.add("리뷰 수정에 실패 하셨습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시 시도</button>");
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }
    
    return mav;
  }

  @RequestMapping(value = "/review/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int reviewno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/review/delete"); 
    mav.addObject("reviewno", reviewno);
    
    return mav;
  }
  
  @RequestMapping(value = "/review/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(ReviewVO reviewVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/review/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
      if(reviewDAO.delete(reviewVO.getReviewno()) ==1){
        mav.setViewName("redirect:/shopcategory/list.do"); 
    } else {
      msgs.add("리뷰 삭제에 실패했습니다.");
      links.add("<button type='button' onclick=\"history.back()\">다시시도</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">홈페이지</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do'\">목록</button>");
    }
    
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
    
    return mav;
  }
  

  
}

