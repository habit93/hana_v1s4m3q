package com.hana.tool;

import java.io.File;

public class ToolTest {
  public static void main(String[] args) {
//    File src = new File("F:/hybrid2/Gallery/imgResize/festval02.jpg");
//    File dest = new File("F:/hybrid2/Gallery/imgResize/festval02_mini.jpg");
//    
//    Tool.imgResize(src, dest, 120, 80);
    
    String upDir = "F:/hybrid2/Gallery/imgResize";
    String src = "festval07_2015.jpg";
    String file2 = Tool.preview(upDir, src, 120, 80);
    System.out.println(file2 + " »ý¼ºµÊ.");
    
  }

}
