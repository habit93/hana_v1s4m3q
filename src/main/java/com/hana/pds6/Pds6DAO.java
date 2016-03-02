package com.hana.pds6;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.hana.tool.DBClose;
import com.hana.tool.DBOpen;


public class Pds6DAO {
  DBOpen dbopen = null;
  DBClose dbclose = null;
  
  public Pds6DAO(){ // ������, �⺻�� �Ҵ�
    dbopen = new DBOpen();
    dbclose = new DBClose();
  }

  /**
   * �����͸� �߰��մϴ�.
   * @param pds5DTO ����� ������ ��ü
   * @return �߰��� ���� 1 �Ǵ� 0�� ����
   */
  public int insert(Pds6DTO pds6DTO){
    Connection con = this.dbopen.getConnection(); // DBMS ���� ��ü
    PreparedStatement pstmt = null; // SQL ����
    ResultSet rs = null;            // SELECT ��� ����
    String sql = "";                // SQL ����
    int count = 0;     // INSER, UPDATE, DELETE ó���� ���� ����
    
    try {
      sql   =" INSERT INTO blogreply(content, passwd, rdate, grpno, indent, ansnum, blogno, rname)";
      sql +=" VALUES( ?, ?, now(), (SELECT IFNULL(MAX(grpno), 0)+1 FROM blogreply as grpno), 0, 0, ?, ?)";
      
      pstmt = con.prepareStatement(sql);
      pstmt.setString(1, pds6DTO.getContent());
      pstmt.setString(2, pds6DTO.getPasswd());
      pstmt.setInt(3, pds6DTO.getBlogno());
      pstmt.setString(4, pds6DTO.getRname());
      count = pstmt.executeUpdate();  // SQL ����
      
    } catch (Exception e) {
      e.printStackTrace();
    } finally{
      this.dbclose.close(con, pstmt);
    }
    
    return count;
  }

  /**
   * ��ü ����� �����մϴ�. �˻� ��� ���� ����, ����¡ ��� ���� ����
   * @return Pds5DTO ���
   */
  public ArrayList<Pds6DTO> list(int blogno){
    Connection con = this.dbopen.getConnection(); // DBMS ���� ��ü
    PreparedStatement pstmt = null;   // SQL ����
    ResultSet rs = null;              // SELECT ��� ����
    String sql = "";                  // SQL ����
    int count = 0;     // INSER, UPDATE, DELETE ó���� ���� ����
    ArrayList<Pds6DTO> list = null;            // ���ڵ� ��� ���� 
    
    try {
      sql  =" SELECT blogreplyno, content, passwd, rdate, grpno, indent, ansnum, blogno, rname";
      sql +=" FROM blogreply";
      sql +=" WHERE blogno = ?";
      sql +=" ORDER BY grpno DESC, ansnum ASC";
      
      pstmt = con.prepareStatement(sql);
      pstmt.setInt(1, blogno);
      rs = pstmt.executeQuery(); // SELECT
      
      list = new ArrayList();         // DTO ��ü �����
      while(rs.next() == true){
        // ���ڵ忡�� �÷��� ���� ������ �ڹ� Ŭ������ ������
        // �����մϴ�.
        Pds6DTO pds5DTO = new Pds6DTO();
        // System.out.println("�޸𸮿� �Ҵ�� ��ü ���� �ڵ�: " + dto.hashCode());
        
        pds5DTO.setBlogreplyno(rs.getInt("blogreplyno"));
        pds5DTO.setContent(rs.getString("content"));
        pds5DTO.setPasswd(rs.getString("passwd"));
        pds5DTO.setRdate(rs.getString("rdate"));
        pds5DTO.setGrpno(rs.getInt("grpno"));
        pds5DTO.setIndent(rs.getInt("indent"));
        pds5DTO.setAnsnum(rs.getInt("ansnum"));
        pds5DTO.setRname(rs.getString("rname"));
        pds5DTO.setBlogno(rs.getInt("blogno"));
        list.add(pds5DTO); // �����(�޸�, ���� �迭)�� �߰�
      }
      
    } catch (Exception e) {
      e.printStackTrace();
    } finally{
      this.dbclose.close(con, pstmt, rs); // �����ͺ��̽� ���� ����
    }
    
    return list;
    
  }
  
  /**
   * �н����尡 �� ��ȣ�� ��ġ�ϴ��� Ȯ���մϴ�.
   * @param qano �� ��ȣ
   * @param passwd �н�����
   * @return ��ġ�ϸ� 1, ��ġ���� ������ 0�� ����
   */
  public int passwdCheck(int blogreplyno, String passwd){
    Connection con = this.dbopen.getConnection(); // DBMS ���� ��ü
    PreparedStatement pstmt = null;   // SQL ����
    ResultSet rs = null;              // SELECT ��� ����
    String sql = "";                    // SQL ����
    int count = 0;     // INSER, UPDATE, DELETE ó���� ���� ����
    
    try {
      sql  =" SELECT COUNT(passwd) as cnt";
      sql +=" FROM blogreply";
      sql +=" WHERE blogreplyno = ? AND passwd = ?";
      
      pstmt = con.prepareStatement(sql);
      pstmt.setInt(1, blogreplyno);
      pstmt.setString(2, passwd);
      
      rs = pstmt.executeQuery(); // SELECT
      
      if(rs.next() == true){
        count = rs.getInt("cnt");
      }
      
    } catch (Exception e) {
      e.printStackTrace();
    } finally{
      this.dbclose.close(con, pstmt, rs); // �����ͺ��̽� ���� ����
    }
    
    return count;
    
  }

  /**
   * ���ڵ带 �����մϴ�.
   * @param pds5DTO ������ ������ ��ü
   * @return ���� �����ϸ� 1, ���н� 0�� ����
   */
  public int update(Pds6DTO pds6DTO){
    Connection con = this.dbopen.getConnection(); // DBMS ���� ��ü
    PreparedStatement pstmt = null; // SQL ����
    ResultSet rs = null;            // SELECT ��� ����
    String sql = "";                 // SQL ����
    int count = 0;     // INSER, UPDATE, DELETE ó���� ���� ����
    
    try {
      sql   = " UPDATE blogreply";
      sql += " SET content=?";
      sql += " WHERE blogreplyno=?";
      
      pstmt = con.prepareStatement(sql);
      pstmt.setString(1, pds6DTO.getContent());
      pstmt.setInt(2, pds6DTO.getBlogreplyno());
      
      count = pstmt.executeUpdate();  // SQL ����
    } catch (Exception e) {
      e.printStackTrace();
    } finally{
      this.dbclose.close(con, pstmt);
    }
    
    return count;
  }
  
  /**
   * ���ڵ带 �����մϴ�.
   * @param qano ������ ���ڵ� ��ȣ
   * @return ���� ������ 1, ���н� 0�� ����
   */
  public int delete(int blogreplyno){
    Connection con = this.dbopen.getConnection(); // DBMS ���� ��ü
    PreparedStatement pstmt = null; // SQL ����
    ResultSet rs = null;            // SELECT ��� ����
    String sql = "";                 // SQL ����
    int count = 0;     // INSER, UPDATE, DELETE ó���� ���� ����
    
    try {
      sql   = " DELETE FROM blogreply";
      sql += " WHERE blogreplyno = ?";
      
      pstmt = con.prepareStatement(sql);
      pstmt.setInt(1, blogreplyno);
      
      count = pstmt.executeUpdate();  // SQL ����
      
    } catch (Exception e) {
      e.printStackTrace();
    } finally{
      this.dbclose.close(con, pstmt);
    }
    
    return count;
  }

  /** 
   * ���ڵ� �Ѱ��� ��ȸ�մϴ�.
   * @return Pds5DTO ���ڵ� ��ü
   */
  public Pds6DTO read(int blogreplyno){
    Connection con = this.dbopen.getConnection(); // DBMS ���� ��ü
    PreparedStatement pstmt = null;   // SQL ����
    ResultSet rs = null;              // SELECT ��� ����
    String sql = "";                    // SQL ����
    int count = 0;     // INSER, UPDATE, DELETE ó���� ���� ����
    Pds6DTO pds5DTO = null;    // ���ڵ� ��� ���� 
    
    try {
      sql  =" SELECT blogreplyno, content, passwd, rdate, grpno, indent, ansnum, blogno, rname";
      sql +=" FROM blogreply";
      sql +=" WHERE blogreplyno = ?";
      
      pstmt = con.prepareStatement(sql);
      pstmt.setInt(1, blogreplyno);
      
      rs = pstmt.executeQuery(); // SELECT
      
      if(rs.next() == true){
        pds5DTO = new Pds6DTO();
        
        pds5DTO.setBlogreplyno(rs.getInt("blogreplyno"));
        pds5DTO.setContent(rs.getString("content"));
        pds5DTO.setPasswd(rs.getString("passwd"));
        pds5DTO.setRdate(rs.getString("rdate"));
        pds5DTO.setGrpno(rs.getInt("grpno"));
        pds5DTO.setIndent(rs.getInt("indent"));
        pds5DTO.setAnsnum(rs.getInt("ansnum"));
        pds5DTO.setBlogno(rs.getInt("blogno"));
      }
      
    } catch (Exception e) {
      e.printStackTrace();
    } finally{
      this.dbclose.close(con, pstmt, rs); // �����ͺ��̽� ���� ����
    }
    
    return pds5DTO;
    
  }

  /**
   * �亯�� �߰��մϴ�.
   * @param pds5DTO ����� ������ ��ü
   * @return �߰��� ���� 1 �Ǵ� 0�� ����
   */
  public int reply(Pds6DTO pds6DTO){
    Connection con = this.dbopen.getConnection(); // DBMS ���� ��ü
    PreparedStatement pstmt = null; // SQL ����
    ResultSet rs = null;            // SELECT ��� ����
    String sql = "";                // SQL ����
    int count = 0;     // INSER, UPDATE, DELETE ó���� ���� ����
    
    try {
      // ���� �亯�� ���̰� �ִ� �θ�� ������ ��ȸ��.
      Pds6DTO _pds6DTO = read(pds6DTO.getBlogreplyno());
      int grpno = _pds6DTO.getGrpno();
      int indent = _pds6DTO.getIndent();
      int ansnum = _pds6DTO.getAnsnum();
      
      pds6DTO.setGrpno(grpno);
      pds6DTO.setIndent(indent);
      pds6DTO.setAnsnum(ansnum);
      
      sql   = " UPDATE blogreply";
      sql += " SET ansnum = ansnum + 1";
      sql += " WHERE grpno = ? AND ansnum > ?";
      pstmt = con.prepareStatement(sql);
      pstmt.setInt(1, pds6DTO.getGrpno());  //  ���� �亯�� �ް��ִ� �θ�� ��ȣ
      pstmt.setInt(2,  pds6DTO.getAnsnum()); // �� �θ���� ansnum ��ȣ
      pstmt.executeUpdate(); // ������ ��ϵ� �亯�� ������ 1�� ����

      sql   =" INSERT INTO blogreply(content, passwd, rdate, grpno, indent, ansnum, blogno, rname)";
      sql +=" VALUES(?, ?, now(), ?, ?, ?, ?, ?)";
      pstmt = con.prepareStatement(sql);
      pstmt.setString(1, pds6DTO.getContent());
      pstmt.setString(2, pds6DTO.getPasswd());
      pstmt.setInt(3, pds6DTO.getGrpno());       // �θ���� �׷��ȣ �״�� ���
      pstmt.setInt(4, pds6DTO.getIndent() + 1);   // �鿩���� �θ𺸴� 1 ����
      pstmt.setInt(5, pds6DTO.getAnsnum() + 1); // �亯���� �θ𺸴� 1 ����
      pstmt.setInt(6, pds6DTO.getBlogno());
      pstmt.setString(7, pds6DTO.getRname());
      count = pstmt.executeUpdate();  // SQL ����
      
    } catch (Exception e) {
      e.printStackTrace();
    } finally{
      this.dbclose.close(con, pstmt);
    }
    
    return count;
  }

}

