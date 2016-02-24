package com.hana.blog;

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
import com.hana.blogreply.BlogreplyVO;
import com.hana.blogreply.BlogreplyDAO;
import com.hana.tool.Tool;
import com.hana.tool.Upload;


@Controller
public class BlogCont {
  @Autowired
  @Qualifier("com.hana.blog.BlogDAO")
  private BlogDAO blogDAO;

  @Autowired
  @Qualifier("com.hana.blogcategory.BlogcategoryDAO")
  private BlogcategoryDAO blogcategoryDAO;
  
  @Autowired
  @Qualifier("com.hana.blogreply.BlogreplyDAO")
  private BlogreplyDAO blogreplyDAO;
  
  public BlogCont(){
    System.out.println("--> BlogCont created.");
  }
  
  @RequestMapping(value="/blog/create.do", method=RequestMethod.GET)
  public ModelAndView create(BlogVO blogVO){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/blog/create");   // /webapp/blog/create.jsp
    mav.addObject("blogVO", blogVO);
    
    return mav;
  }

  @RequestMapping(value="/blog/create.do", method=RequestMethod.POST)
  public ModelAndView create(BlogVO blogVO, HttpServletRequest request){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/blog/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    // --------------------------------------------------
    // Thumb ���� ���� ����
    // --------------------------------------------------
    String absPath = Tool.getRealPath(request, "/blog/storage");

    String file = "";
    MultipartFile fileMF = blogVO.getFileMF();  // ������ �������� �ʾƵ� ��ü�� ������.
    if (fileMF.getSize() > 0){
      file = Upload.saveFileSpring(fileMF, absPath);
    }
    blogVO.setFile(file); // ���۵� ���ϸ� ����
    // --------------------------------------------------
    
    if (blogDAO.create(blogVO) == 1){ 
      mav.setViewName("redirect:/blog/list2.do?blogcategoryno=" + blogVO.getBlogcategoryno());
    }else{
      msgs.add("�� ��Ͽ� �����߽��ϴ�.");
      msgs.add("�ٽ� �õ����ּ���.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
    }
    
    links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
    links.add("<button type='button' onclick=\"location.href='./list2.do?blogcategoryno="+blogVO.getBlogcategoryno()+"'\">���</button>");
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
    
    return mav;
  }
  
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
   
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    BlogVO blogVO_old = blogDAO.read(blogVO.getBlogno());

    // --------------------------------------------------
    // Thumb ���� ���� ����
    // --------------------------------------------------
    String absPath = Tool.getRealPath(request, "/blog/storage");
    
    String file = "";
    MultipartFile fileMF = blogVO.getFileMF();      //������ �������� �ʾƵ� ��ü ����
      if (fileMF.getSize() > 0){
        String path = absPath + blogVO_old.getFile();
         
        Tool.deleteFile(absPath + blogVO_old.getFile()); //���� ���� ����
        file = Upload.saveFileSpring(fileMF, absPath);    //���ο� ���� ����
        blogVO.setFile(file);                                   // DBMS�� ������ ���ϸ� (���۵� ���ϸ�) ����   
      }else{
        blogVO.setFile(blogVO_old.getFile());              //������ ���ϸ� ����
      }
    // --------------------------------------------------
      
    if(blogDAO.update(blogVO) == 1){
      // ������ ��ȸ�� �ڵ� �̵�
      mav.setViewName("redirect:/blog/read.do?blogno=" + blogVO.getBlogno() + "&blogcategoryno=" + blogVO.getBlogcategoryno()); // Ȯ���� ���
    }else{
      msgs.add("�Խ��� ������ ���� �ϼ̽��ϴ�.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽ� �õ�</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do?blogcategoryno="+blogVO.getBlogcategoryno()+"'\">���</button>");
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

    // --------------------------------------------------
    // Thumb ���� ����
    // --------------------------------------------------
    BlogVO blogVO_old = blogDAO.read(blogVO.getBlogno());
    String absPath = Tool.getRealPath(request, "/blog/storage");
    Tool.deleteFile(absPath + blogVO_old.getFile());
    // --------------------------------------------------

    if (blogDAO.delete(blogVO.getBlogno()) == 1) {
      mav.setViewName("redirect:/blog/list2.do?blogcategoryno=" + blogVO.getBlogcategoryno());//Ȯ���� ���
    } else {
      msgs.add("�� ������ �����߽��ϴ�.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
      links.add("<button type='button' onclick=\"location.href='./list2.do?blogcategoryno="+blogVO.getBlogcategoryno()+"'\">���</button>");
    }
    
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
    
    return mav;
  }


}

