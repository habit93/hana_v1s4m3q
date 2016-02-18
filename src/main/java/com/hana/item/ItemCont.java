package com.hana.item;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hana.tool.Tool;
import com.hana.tool.Upload;
 
@Controller
public class ItemCont {
  @Autowired
  @Qualifier("com.hana.item.ItemDAO")
  private ItemDAO itemDAO;
  
  
  public ItemCont(){
    System.out.println("--> ItemCont created.");
  }
  
  @RequestMapping(value = "/item/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/item/create"); // /webapp/blogcategory/create.jsp
    
    return mav;
  }
  
  @RequestMapping(value = "/item/create.do", method = RequestMethod.POST)
  public ModelAndView create(ItemVO itemVO, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/item/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    // --------------------------------------------------
    // Thumb ���� ���� ����
    // --------------------------------------------------
    String file = "";
    String absPath = Tool.getRealPath(request, "/item/storage");
    MultipartFile fileMF = itemVO.getFileMF();
    if (fileMF != null){
      if (fileMF.getSize() > 0){
        file = Upload.saveFileSpring(fileMF, absPath);
        Tool.preview(absPath, file, 450, 385);
        itemVO.setThumb(file); // ���۵� ���ϸ� ����
      }
    }
    // --------------------------------------------------
    
    if (itemDAO.create(itemVO) == 1) {
      mav.setViewName("redirect:/item/list.do?categoryno=" + itemVO.getCategoryno()); // Ȯ���� ���!!!
    } else {
      msgs.add("�Խ��� ��Ͽ� �����߽��ϴ�.");
      msgs.add("�˼������� �ٽ��ѹ� �õ����ּ���.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
    }

    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }
  /**
   * �Խ��Ǻ� ���
   * @param blogVO blogcategoryno�� ���� ������ ���
   * @return
   */
  @RequestMapping(value = "/item/list.do", method = RequestMethod.GET)
  public ModelAndView list(ItemVO itemVO){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/item/list");
    mav.addObject("list", itemDAO.list(itemVO));
    mav.addObject("itemVO", itemVO);

/*    ItemVO vo = ItemDAO.read(itemVO.getCategoryno());
    mav.addObject("title", vo.getTitle());*/
    
    return mav;
  }
  
  @RequestMapping(value = "/item/list2.do", method = RequestMethod.GET)
  public ModelAndView list2() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/item/list2");
    mav.addObject("list2", itemDAO.list2());

    return mav;
  }
  
  @RequestMapping(value = "/item/read.do", method = RequestMethod.GET)
  public ModelAndView read(int itemno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/item/read");
    mav.addObject("itemVO", itemDAO.read(itemno));
    
    return mav;
  }

  @RequestMapping(value="/item/update.do", method=RequestMethod.GET)
  public ModelAndView update(int itemno, HttpServletRequest request){  
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/item/update");
    
    mav.addObject("itemVO", itemDAO.read(itemno)); 
    
    return mav;
  }
  
  @RequestMapping(value="/item/update.do", method=RequestMethod.POST) 
  public ModelAndView update(ItemVO itemVO, HttpServletRequest request){
    ModelAndView mav = new ModelAndView();
   
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    ItemVO itemVO_old = itemDAO.read(itemVO.getItemno());
    // --------------------------------------------------
    // Thumb ���� ���� ���� ����
    // --------------------------------------------------
    String absPath = Tool.getRealPath(request, "/item/storage");
    
    String file = "";
    MultipartFile fileMF = itemVO.getFileMF();
    if (fileMF.getSize() > 0){
      Tool.deleteFile(absPath + itemVO_old.getThumb());  // ���� ���� ����
      file = Upload.saveFileSpring(fileMF, absPath); // ���ο� ���� ����
      itemVO.setThumb(file); // DBMS�� ������ ���ϸ� ����
    }else{
      itemVO.setThumb(itemVO_old.getThumb()); // ������ ���ϸ� ����
    }
   
    if(itemDAO.update(itemVO) == 1){
      mav.setViewName("redirect:/item/read.do?itemno=" + itemVO.getItemno() + "&categoryno=" + itemVO.getCategoryno()); // Ȯ���� ���
    }else{
      msgs.add("�Խ��� ������ ���� �ϼ̽��ϴ�.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽ� �õ�</button>");
      links.add("<button type='button' onclick=\"location.href='./list.do?blogcategoryno="+itemVO.getCategoryno()+"'\">���</button>");
      mav.addObject("msgs", msgs);
      mav.addObject("links", links);
    }
    
    return mav;
  }
  
  @RequestMapping(value = "/item/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int itemno, int categoryno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/item/delete"); // /webapp/member/delete.jsp
    mav.addObject("itemno", itemno);
    mav.addObject("categoryno", categoryno);
    
    return mav;
  }
  
  @RequestMapping(value = "/item/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(ItemVO itemVO,
                                        HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/item/message");

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();

    // --------------------------------------------------
    // Thumb ���� ����
    // --------------------------------------------------
    ItemVO blogVO_old = itemDAO.read(itemVO.getItemno());
    String absPath = Tool.getRealPath(request, "/item/storage");
    Tool.deleteFile(absPath + blogVO_old.getThumb());
    // --------------------------------------------------

    if (itemDAO.delete(itemVO.getItemno()) == 1) {
      mav.setViewName("redirect:/item/list.do?categoryno=" + itemVO.getCategoryno());//Ȯ���� ���
    } else {
      msgs.add("�� ������ �����߽��ϴ�.");
      links.add("<button type='button' onclick=\"history.back()\">�ٽýõ�</button>");
      links.add("<button type='button' onclick=\"location.href='./home.do'\">Ȩ������</button>");
      links.add("<button type='button' onclick=\"location.href='./list2.do?blogcategoryno="+itemVO.getItemno()+"'\">���</button>");
    }
    
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
    
    return mav;
  }

}
