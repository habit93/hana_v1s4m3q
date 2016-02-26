package com.hana.pds5;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.hana.tool.DBClose;
import com.hana.tool.DBOpen;


public class Pds5DAO {
  DBOpen dbopen = null;
  DBClose dbclose = null;
  
  public Pds5DAO(){ // ������, �⺻�� �Ҵ�
    dbopen = new DBOpen();
    dbclose = new DBClose();
  }

  /**
   * �����͸� �߰��մϴ�.
   * @param pds5DTO ����� ������ ��ü
   * @return �߰��� ���� 1 �Ǵ� 0�� ����
   */
  public int insert(Pds5DTO pds5DTO){
    Connection con = this.dbopen.getConnection(); // DBMS ���� ��ü
    PreparedStatement pstmt = null; // SQL ����
    ResultSet rs = null;            // SELECT ��� ����
    String sql = "";                // SQL ����
    int count = 0;     // INSER, UPDATE, DELETE ó���� ���� ����
    
    try {
      sql   =" INSERT INTO pds5(title, content, passwd, rdate, grpno, indent, ansnum, itemno)";
      sql +=" VALUES(?, ?, ?, now(), (SELECT IFNULL(MAX(grpno), 0)+1 FROM pds5 as grpno), 0, 0, ?)";
      
      pstmt = con.prepareStatement(sql);
      pstmt.setString(1, pds5DTO.getTitle());
      pstmt.setString(2, pds5DTO.getContent());
      pstmt.setString(3, pds5DTO.getPasswd());
      pstmt.setInt(4, pds5DTO.getItemno());
      
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
  public ArrayList<Pds5DTO> list(int itemno){
    Connection con = this.dbopen.getConnection(); // DBMS ���� ��ü
    PreparedStatement pstmt = null;   // SQL ����
    ResultSet rs = null;              // SELECT ��� ����
    String sql = "";                  // SQL ����
    int count = 0;     // INSER, UPDATE, DELETE ó���� ���� ����
    ArrayList<Pds5DTO> list = null;            // ���ڵ� ��� ���� 
    
    try {
      sql  =" SELECT qano, title, content, passwd, rdate, grpno, indent, ansnum, itemno ";
      sql +=" FROM pds5";
      sql +=" WHERE itemno = ?";
      sql +=" ORDER BY grpno DESC, ansnum ASC";
      
      pstmt = con.prepareStatement(sql);
      pstmt.setInt(1, itemno);
      rs = pstmt.executeQuery(); // SELECT
      
      list = new ArrayList();         // DTO ��ü �����
      while(rs.next() == true){
        // ���ڵ忡�� �÷��� ���� ������ �ڹ� Ŭ������ ������
        // �����մϴ�.
        Pds5DTO pds5DTO = new Pds5DTO();
        // System.out.println("�޸𸮿� �Ҵ�� ��ü ���� �ڵ�: " + dto.hashCode());
        
        pds5DTO.setQano(rs.getInt("qano"));
        pds5DTO.setTitle(rs.getString("title"));
        pds5DTO.setContent(rs.getString("content"));
        pds5DTO.setPasswd(rs.getString("passwd"));
        pds5DTO.setRdate(rs.getString("rdate"));
        pds5DTO.setGrpno(rs.getInt("grpno"));
        pds5DTO.setIndent(rs.getInt("indent"));
        pds5DTO.setAnsnum(rs.getInt("ansnum"));
        pds5DTO.setItemno(rs.getInt("itemno"));
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
   * �˻��� ���ڵ��� ������ �����մϴ�.
   * @param col �˻� �÷�
   * @param word �˻���
   * @return �˻��� ���ڵ� ����
   */
  public int totalRecord(String col, String word){
    Connection con = this.dbopen.getConnection(); // DBMS ���� ��ü
    PreparedStatement pstmt = null;   // SQL ����
    ResultSet rs = null;              // SELECT ��� ����
    String sql = "";                  // SQL ����
    int count = 0;     // INSER, UPDATE, DELETE ó���� ���� ����
    
    try {
      if (col.equals("rname")){
        sql  = " SELECT COUNT(*) as cnt";
        sql += " FROM pds5";
        sql += " WHERE rname LIKE ?";
        
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, "%"+word+"%");
      }else if (col.equals("title")){
        sql  = " SELECT COUNT(*) as cnt";
        sql += " FROM pds5";
        sql += " WHERE title LIKE ?";
        
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, "%"+word+"%");        
      }else if (col.equals("content")){
        sql  = " SELECT COUNT(*) as cnt";
        sql += " FROM pds5";
        sql += " WHERE content LIKE ?";
        
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, "%"+word+"%");         
      }else if (col.equals("email")){
        sql  = " SELECT COUNT(*) as cnt";
        sql += " FROM pds5";
        sql += " WHERE email LIKE ?";
        
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, "%"+word+"%");         
      }else{ // �˻����� �ʴ� ���
        sql  = " SELECT COUNT(*) as cnt";
        sql += " FROM pds5";
        sql += " ORDER BY bbsno DESC"; 
        
        pstmt = con.prepareStatement(sql);
      }
      
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
   * �˻� ����� �������� �и��� �� �亯���·� �����Ͽ� �����մϴ�.
   * @param nowPage ���� ������, 1���� ����
   * @param col �˻� �÷�
   * @param word �˻��� �ܾ�
   * @return �˻��� ���ڵ带 Bbs3DTO�� ��ȯ�� ���
   */
  public ArrayList list2(int nowPage, String col, String word){
    Connection con = this.dbopen.getConnection(); // DBMS ���� ��ü
    PreparedStatement pstmt = null;   // SQL ����
    ResultSet rs = null;              // SELECT ��� ����
    String sql = "";                  // SQL ����
    int count = 0;     // INSER, UPDATE, DELETE ó���� ���� ����
    ArrayList list = null;            // ���ڵ� ��� ���� 
    
    // ----------------------------------------------------------
    // LIMIT�� ���
    // ����: (���� ������ - 1 ) * �������� ����� ���ڵ� ����
    // ----------------------------------------------------------
    // 1 page: (1 - 1) * 10 = 0    LIMIT 0, 10
    // 2 page: (2 - 1) * 10 = 10  LIMIT 10, 10
    // 3 page: (3 - 1) * 10 = 20  LIMIT 20, 10
    // 4 page: (4 - 1) * 10 = 30  LIMIT 30, 10
    // 5 page: (5 - 1) * 10 = 40  LIMIT 40, 10
    // ----------------------------------------------------------
    int offset = (nowPage - 1) * 10; // ù ���ڵ带 �������� ������ ���ڵ� ����
    
    try {

        sql  = " SELECT qano, title, content, passwd, rdate, grpno, indent, ansnum ";
        sql += " FROM pds5";
        sql += " ORDER BY grpno DESC, ansnum ASC";
        sql += " LIMIT " + offset + ", 10";
        
        pstmt = con.prepareStatement(sql);
      
      rs = pstmt.executeQuery(); // SELECT
      
      list = new ArrayList();         // DTO ��ü �����
      while(rs.next() == true){
        // ���ڵ忡�� �÷��� ���� ������ �ڹ� Ŭ������ ������
        // �����մϴ�.
        Pds5DTO pds5DTO = new Pds5DTO();
        // System.out.println("�޸𸮿� �Ҵ�� ��ü ���� �ڵ�: " + dto.hashCode());
        
        pds5DTO.setQano(rs.getInt("qano"));
        pds5DTO.setTitle(rs.getString("title"));
        pds5DTO.setContent(rs.getString("content"));
        pds5DTO.setPasswd(rs.getString("passwd"));
        pds5DTO.setRdate(rs.getString("rdate"));
        pds5DTO.setGrpno(rs.getInt("grpno"));
        pds5DTO.setIndent(rs.getInt("indent"));
        pds5DTO.setAnsnum(rs.getInt("ansnum"));
        
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
  public int passwdCheck(int qano, String passwd){
    Connection con = this.dbopen.getConnection(); // DBMS ���� ��ü
    PreparedStatement pstmt = null;   // SQL ����
    ResultSet rs = null;              // SELECT ��� ����
    String sql = "";                    // SQL ����
    int count = 0;     // INSER, UPDATE, DELETE ó���� ���� ����
    
    try {
      sql  =" SELECT COUNT(passwd) as cnt";
      sql +=" FROM pds5";
      sql +=" WHERE qano = ? AND passwd = ?";
      
      pstmt = con.prepareStatement(sql);
      pstmt.setInt(1, qano);
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
  public int update(Pds5DTO pds5DTO){
    Connection con = this.dbopen.getConnection(); // DBMS ���� ��ü
    PreparedStatement pstmt = null; // SQL ����
    ResultSet rs = null;            // SELECT ��� ����
    String sql = "";                 // SQL ����
    int count = 0;     // INSER, UPDATE, DELETE ó���� ���� ����
    
    try {
      sql   = " UPDATE pds5";
      sql += " SET title=?, content=?";
      sql += " WHERE qano=?";
      
      pstmt = con.prepareStatement(sql);
      pstmt.setString(1, pds5DTO.getTitle());
      pstmt.setString(2, pds5DTO.getContent());
      pstmt.setInt(3, pds5DTO.getQano());
      
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
  public int delete(int qano){
    Connection con = this.dbopen.getConnection(); // DBMS ���� ��ü
    PreparedStatement pstmt = null; // SQL ����
    ResultSet rs = null;            // SELECT ��� ����
    String sql = "";                 // SQL ����
    int count = 0;     // INSER, UPDATE, DELETE ó���� ���� ����
    
    try {
      sql   = " DELETE FROM pds5";
      sql += " WHERE qano = ?";
      
      pstmt = con.prepareStatement(sql);
      pstmt.setInt(1, qano);
      
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
  public Pds5DTO read(int qano){
    Connection con = this.dbopen.getConnection(); // DBMS ���� ��ü
    PreparedStatement pstmt = null;   // SQL ����
    ResultSet rs = null;              // SELECT ��� ����
    String sql = "";                    // SQL ����
    int count = 0;     // INSER, UPDATE, DELETE ó���� ���� ����
    Pds5DTO pds5DTO = null;    // ���ڵ� ��� ���� 
    
    try {
      sql  =" SELECT qano, title, content, passwd, rdate, grpno, indent, ansnum ";
      sql +=" FROM pds5";
      sql +=" WHERE qano = ?";
      
      pstmt = con.prepareStatement(sql);
      pstmt.setInt(1, qano);
      
      rs = pstmt.executeQuery(); // SELECT
      
      if(rs.next() == true){
        pds5DTO = new Pds5DTO();
        
        pds5DTO.setQano(rs.getInt("qano"));
        pds5DTO.setTitle(rs.getString("title"));
        pds5DTO.setContent(rs.getString("content"));
        pds5DTO.setPasswd(rs.getString("passwd"));
        pds5DTO.setRdate(rs.getString("rdate"));
        pds5DTO.setGrpno(rs.getInt("grpno"));
        pds5DTO.setIndent(rs.getInt("indent"));
        pds5DTO.setAnsnum(rs.getInt("ansnum"));
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
  public int reply(Pds5DTO pds5DTO){
    Connection con = this.dbopen.getConnection(); // DBMS ���� ��ü
    PreparedStatement pstmt = null; // SQL ����
    ResultSet rs = null;            // SELECT ��� ����
    String sql = "";                // SQL ����
    int count = 0;     // INSER, UPDATE, DELETE ó���� ���� ����
    
    try {
      // ���� �亯�� ���̰� �ִ� �θ�� ������ ��ȸ��.
      Pds5DTO _pds5DTO = read(pds5DTO.getQano());
      int grpno = _pds5DTO.getGrpno();
      int indent = _pds5DTO.getIndent();
      int ansnum = _pds5DTO.getAnsnum();
      
      pds5DTO.setGrpno(grpno);
      pds5DTO.setIndent(indent);
      pds5DTO.setAnsnum(ansnum);
      
      sql   = " UPDATE pds5";
      sql += " SET ansnum = ansnum + 1";
      sql += " WHERE grpno = ? AND ansnum > ?";
      pstmt = con.prepareStatement(sql);
      pstmt.setInt(1, pds5DTO.getGrpno());  //  ���� �亯�� �ް��ִ� �θ�� ��ȣ
      pstmt.setInt(2,  pds5DTO.getAnsnum()); // �� �θ���� ansnum ��ȣ
      pstmt.executeUpdate(); // ������ ��ϵ� �亯�� ������ 1�� ����

      sql   =" INSERT INTO pds5(title, content, passwd, rdate, grpno, indent, ansnum, itemno )";
      sql +=" VALUES(?, ?, ?, now(), ?, ?, ?, ?)";
      pstmt = con.prepareStatement(sql);
      pstmt.setString(1, pds5DTO.getTitle());
      pstmt.setString(2, pds5DTO.getContent());
      pstmt.setString(3, pds5DTO.getPasswd());
      pstmt.setInt(4, pds5DTO.getGrpno());       // �θ���� �׷��ȣ �״�� ���
      pstmt.setInt(5, pds5DTO.getIndent() + 1);   // �鿩���� �θ𺸴� 1 ����
      pstmt.setInt(6, pds5DTO.getAnsnum() + 1); // �亯���� �θ𺸴� 1 ����
      pstmt.setInt(7, pds5DTO.getItemno());
      count = pstmt.executeUpdate();  // SQL ����
      
    } catch (Exception e) {
      e.printStackTrace();
    } finally{
      this.dbclose.close(con, pstmt);
    }
    
    return count;
  }

}

