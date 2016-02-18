package com.hana.tool;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBOpen {
/*  public Connection getConnection(){
    Connection con = null; // 메모리가 할당되지 않음.
    
    try{
      InitialContext ctx = new InitialContext();
      DataSource pool = (DataSource)ctx.lookup("java:comp/env/jdbc/mysql/root");
      con = pool.getConnection(); 
      System.out.println("--> DataSource Connection 요청됨.");
    }catch(Exception e){
      e.printStackTrace();
    }
    
    return con;
  }*/
  

 public Connection getConnection(){
    Connection con = null; // 메모리가 할당되지 않음.
    
    try{
      String jdbc = "org.gjt.mm.mysql.Driver"; // MySQL 연결 Drvier 
      String url = "jdbc:mysql://localhost:3306/web?useUnicode=true&characterEncoding=euckr"; 
      String user = "root"; 
      String pass = "1234";
      
      Class.forName(jdbc); // memory로 드라이버 클래스를 로딩함.
      con = DriverManager.getConnection(url, user, pass); // MySQL 연결
      
    }catch(Exception e){
      e.printStackTrace();
    }
    
    return con;
  }

}
