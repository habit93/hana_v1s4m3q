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
  
  public Pds6DAO(){ // 생성자, 기본값 할당
    dbopen = new DBOpen();
    dbclose = new DBClose();
  }

  /**
   * 데이터를 추가합니다.
   * @param pds5DTO 등록할 데이터 객체
   * @return 추가한 갯수 1 또는 0을 리턴
   */
  public int insert(Pds6DTO pds6DTO){
    Connection con = this.dbopen.getConnection(); // DBMS 연결 객체
    PreparedStatement pstmt = null; // SQL 실행
    ResultSet rs = null;            // SELECT 결과 저장
    String sql = "";                // SQL 저장
    int count = 0;     // INSER, UPDATE, DELETE 처리된 갯수 저장
    
    try {
      sql   =" INSERT INTO blogreply(content, passwd, rdate, grpno, indent, ansnum, blogno, rname)";
      sql +=" VALUES( ?, ?, now(), (SELECT IFNULL(MAX(grpno), 0)+1 FROM blogreply as grpno), 0, 0, ?, ?)";
      
      pstmt = con.prepareStatement(sql);
      pstmt.setString(1, pds6DTO.getContent());
      pstmt.setString(2, pds6DTO.getPasswd());
      pstmt.setInt(3, pds6DTO.getBlogno());
      pstmt.setString(4, pds6DTO.getRname());
      count = pstmt.executeUpdate();  // SQL 실행
      
    } catch (Exception e) {
      e.printStackTrace();
    } finally{
      this.dbclose.close(con, pstmt);
    }
    
    return count;
  }

  /**
   * 전체 목록을 리턴합니다. 검색 기능 지원 안함, 페이징 기능 지원 안함
   * @return Pds5DTO 목록
   */
  public ArrayList<Pds6DTO> list(int blogno){
    Connection con = this.dbopen.getConnection(); // DBMS 연결 객체
    PreparedStatement pstmt = null;   // SQL 실행
    ResultSet rs = null;              // SELECT 결과 저장
    String sql = "";                  // SQL 저장
    int count = 0;     // INSER, UPDATE, DELETE 처리된 갯수 저장
    ArrayList<Pds6DTO> list = null;            // 레코드 목록 저장 
    
    try {
      sql  =" SELECT blogreplyno, content, passwd, rdate, grpno, indent, ansnum, blogno, rname";
      sql +=" FROM blogreply";
      sql +=" WHERE blogno = ?";
      sql +=" ORDER BY grpno DESC, ansnum ASC";
      
      pstmt = con.prepareStatement(sql);
      pstmt.setInt(1, blogno);
      rs = pstmt.executeQuery(); // SELECT
      
      list = new ArrayList();         // DTO 객체 저장소
      while(rs.next() == true){
        // 레코드에서 컬럼의 값을 추출해 자바 클래스의 변수로
        // 저장합니다.
        Pds6DTO pds5DTO = new Pds6DTO();
        // System.out.println("메모리에 할당된 객체 고유 코드: " + dto.hashCode());
        
        pds5DTO.setBlogreplyno(rs.getInt("blogreplyno"));
        pds5DTO.setContent(rs.getString("content"));
        pds5DTO.setPasswd(rs.getString("passwd"));
        pds5DTO.setRdate(rs.getString("rdate"));
        pds5DTO.setGrpno(rs.getInt("grpno"));
        pds5DTO.setIndent(rs.getInt("indent"));
        pds5DTO.setAnsnum(rs.getInt("ansnum"));
        pds5DTO.setRname(rs.getString("rname"));
        pds5DTO.setBlogno(rs.getInt("blogno"));
        list.add(pds5DTO); // 저장소(메모리, 향상된 배열)에 추가
      }
      
    } catch (Exception e) {
      e.printStackTrace();
    } finally{
      this.dbclose.close(con, pstmt, rs); // 데이터베이스 연결 해제
    }
    
    return list;
    
  }
  
  /**
   * 패스워드가 글 번호와 일치하는지 확인합니다.
   * @param qano 글 번호
   * @param passwd 패스워드
   * @return 일치하면 1, 일치하지 않으면 0을 리턴
   */
  public int passwdCheck(int blogreplyno, String passwd){
    Connection con = this.dbopen.getConnection(); // DBMS 연결 객체
    PreparedStatement pstmt = null;   // SQL 실행
    ResultSet rs = null;              // SELECT 결과 저장
    String sql = "";                    // SQL 저장
    int count = 0;     // INSER, UPDATE, DELETE 처리된 갯수 저장
    
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
      this.dbclose.close(con, pstmt, rs); // 데이터베이스 연결 해제
    }
    
    return count;
    
  }

  /**
   * 레코드를 수정합니다.
   * @param pds5DTO 수정할 데이터 객체
   * @return 수정 성공하면 1, 실패시 0을 리턴
   */
  public int update(Pds6DTO pds6DTO){
    Connection con = this.dbopen.getConnection(); // DBMS 연결 객체
    PreparedStatement pstmt = null; // SQL 실행
    ResultSet rs = null;            // SELECT 결과 저장
    String sql = "";                 // SQL 저장
    int count = 0;     // INSER, UPDATE, DELETE 처리된 갯수 저장
    
    try {
      sql   = " UPDATE blogreply";
      sql += " SET content=?";
      sql += " WHERE blogreplyno=?";
      
      pstmt = con.prepareStatement(sql);
      pstmt.setString(1, pds6DTO.getContent());
      pstmt.setInt(2, pds6DTO.getBlogreplyno());
      
      count = pstmt.executeUpdate();  // SQL 실행
    } catch (Exception e) {
      e.printStackTrace();
    } finally{
      this.dbclose.close(con, pstmt);
    }
    
    return count;
  }
  
  /**
   * 레코드를 삭제합니다.
   * @param qano 삭제할 레코드 번호
   * @return 삭제 성공시 1, 실패시 0을 리턴
   */
  public int delete(int blogreplyno){
    Connection con = this.dbopen.getConnection(); // DBMS 연결 객체
    PreparedStatement pstmt = null; // SQL 실행
    ResultSet rs = null;            // SELECT 결과 저장
    String sql = "";                 // SQL 저장
    int count = 0;     // INSER, UPDATE, DELETE 처리된 갯수 저장
    
    try {
      sql   = " DELETE FROM blogreply";
      sql += " WHERE blogreplyno = ?";
      
      pstmt = con.prepareStatement(sql);
      pstmt.setInt(1, blogreplyno);
      
      count = pstmt.executeUpdate();  // SQL 실행
      
    } catch (Exception e) {
      e.printStackTrace();
    } finally{
      this.dbclose.close(con, pstmt);
    }
    
    return count;
  }

  /** 
   * 레코드 한건을 조회합니다.
   * @return Pds5DTO 레코드 객체
   */
  public Pds6DTO read(int blogreplyno){
    Connection con = this.dbopen.getConnection(); // DBMS 연결 객체
    PreparedStatement pstmt = null;   // SQL 실행
    ResultSet rs = null;              // SELECT 결과 저장
    String sql = "";                    // SQL 저장
    int count = 0;     // INSER, UPDATE, DELETE 처리된 갯수 저장
    Pds6DTO pds5DTO = null;    // 레코드 목록 저장 
    
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
      this.dbclose.close(con, pstmt, rs); // 데이터베이스 연결 해제
    }
    
    return pds5DTO;
    
  }

  /**
   * 답변을 추가합니다.
   * @param pds5DTO 등록할 데이터 객체
   * @return 추가한 갯수 1 또는 0을 리턴
   */
  public int reply(Pds6DTO pds6DTO){
    Connection con = this.dbopen.getConnection(); // DBMS 연결 객체
    PreparedStatement pstmt = null; // SQL 실행
    ResultSet rs = null;            // SELECT 결과 저장
    String sql = "";                // SQL 저장
    int count = 0;     // INSER, UPDATE, DELETE 처리된 갯수 저장
    
    try {
      // 현재 답변을 붙이고 있는 부모글 정보를 조회함.
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
      pstmt.setInt(1, pds6DTO.getGrpno());  //  현재 답변을 달고있는 부모글 번호
      pstmt.setInt(2,  pds6DTO.getAnsnum()); // 그 부모글의 ansnum 번호
      pstmt.executeUpdate(); // 기존에 등록된 답변의 순서를 1씩 증가

      sql   =" INSERT INTO blogreply(content, passwd, rdate, grpno, indent, ansnum, blogno, rname)";
      sql +=" VALUES(?, ?, now(), ?, ?, ?, ?, ?)";
      pstmt = con.prepareStatement(sql);
      pstmt.setString(1, pds6DTO.getContent());
      pstmt.setString(2, pds6DTO.getPasswd());
      pstmt.setInt(3, pds6DTO.getGrpno());       // 부모글의 그룹번호 그대로 사용
      pstmt.setInt(4, pds6DTO.getIndent() + 1);   // 들여쓰기 부모보다 1 증가
      pstmt.setInt(5, pds6DTO.getAnsnum() + 1); // 답변순서 부모보다 1 증가
      pstmt.setInt(6, pds6DTO.getBlogno());
      pstmt.setString(7, pds6DTO.getRname());
      count = pstmt.executeUpdate();  // SQL 실행
      
    } catch (Exception e) {
      e.printStackTrace();
    } finally{
      this.dbclose.close(con, pstmt);
    }
    
    return count;
  }

}

