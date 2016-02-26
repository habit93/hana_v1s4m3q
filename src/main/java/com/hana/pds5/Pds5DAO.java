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
  
  public Pds5DAO(){ // 생성자, 기본값 할당
    dbopen = new DBOpen();
    dbclose = new DBClose();
  }

  /**
   * 데이터를 추가합니다.
   * @param pds5DTO 등록할 데이터 객체
   * @return 추가한 갯수 1 또는 0을 리턴
   */
  public int insert(Pds5DTO pds5DTO){
    Connection con = this.dbopen.getConnection(); // DBMS 연결 객체
    PreparedStatement pstmt = null; // SQL 실행
    ResultSet rs = null;            // SELECT 결과 저장
    String sql = "";                // SQL 저장
    int count = 0;     // INSER, UPDATE, DELETE 처리된 갯수 저장
    
    try {
      sql   =" INSERT INTO pds5(title, content, passwd, rdate, grpno, indent, ansnum, itemno)";
      sql +=" VALUES(?, ?, ?, now(), (SELECT IFNULL(MAX(grpno), 0)+1 FROM pds5 as grpno), 0, 0, ?)";
      
      pstmt = con.prepareStatement(sql);
      pstmt.setString(1, pds5DTO.getTitle());
      pstmt.setString(2, pds5DTO.getContent());
      pstmt.setString(3, pds5DTO.getPasswd());
      pstmt.setInt(4, pds5DTO.getItemno());
      
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
  public ArrayList<Pds5DTO> list(int itemno){
    Connection con = this.dbopen.getConnection(); // DBMS 연결 객체
    PreparedStatement pstmt = null;   // SQL 실행
    ResultSet rs = null;              // SELECT 결과 저장
    String sql = "";                  // SQL 저장
    int count = 0;     // INSER, UPDATE, DELETE 처리된 갯수 저장
    ArrayList<Pds5DTO> list = null;            // 레코드 목록 저장 
    
    try {
      sql  =" SELECT qano, title, content, passwd, rdate, grpno, indent, ansnum, itemno ";
      sql +=" FROM pds5";
      sql +=" WHERE itemno = ?";
      sql +=" ORDER BY grpno DESC, ansnum ASC";
      
      pstmt = con.prepareStatement(sql);
      pstmt.setInt(1, itemno);
      rs = pstmt.executeQuery(); // SELECT
      
      list = new ArrayList();         // DTO 객체 저장소
      while(rs.next() == true){
        // 레코드에서 컬럼의 값을 추출해 자바 클래스의 변수로
        // 저장합니다.
        Pds5DTO pds5DTO = new Pds5DTO();
        // System.out.println("메모리에 할당된 객체 고유 코드: " + dto.hashCode());
        
        pds5DTO.setQano(rs.getInt("qano"));
        pds5DTO.setTitle(rs.getString("title"));
        pds5DTO.setContent(rs.getString("content"));
        pds5DTO.setPasswd(rs.getString("passwd"));
        pds5DTO.setRdate(rs.getString("rdate"));
        pds5DTO.setGrpno(rs.getInt("grpno"));
        pds5DTO.setIndent(rs.getInt("indent"));
        pds5DTO.setAnsnum(rs.getInt("ansnum"));
        pds5DTO.setItemno(rs.getInt("itemno"));
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
   * 검색된 레코드의 갯수를 리턴합니다.
   * @param col 검색 컬럼
   * @param word 검색어
   * @return 검색된 레코드 갯수
   */
  public int totalRecord(String col, String word){
    Connection con = this.dbopen.getConnection(); // DBMS 연결 객체
    PreparedStatement pstmt = null;   // SQL 실행
    ResultSet rs = null;              // SELECT 결과 저장
    String sql = "";                  // SQL 저장
    int count = 0;     // INSER, UPDATE, DELETE 처리된 갯수 저장
    
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
      }else{ // 검색하지 않는 경우
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
      this.dbclose.close(con, pstmt, rs); // 데이터베이스 연결 해제
    }
    
    return count;
  }
  
  /**
   * 검색 목록을 페이지로 분리한 후 답변형태로 정렬하여 리턴합니다.
   * @param nowPage 현재 페이지, 1부터 시작
   * @param col 검색 컬럼
   * @param word 검색할 단어
   * @return 검색된 레코드를 Bbs3DTO로 변환한 목록
   */
  public ArrayList list2(int nowPage, String col, String word){
    Connection con = this.dbopen.getConnection(); // DBMS 연결 객체
    PreparedStatement pstmt = null;   // SQL 실행
    ResultSet rs = null;              // SELECT 결과 저장
    String sql = "";                  // SQL 저장
    int count = 0;     // INSER, UPDATE, DELETE 처리된 갯수 저장
    ArrayList list = null;            // 레코드 목록 저장 
    
    // ----------------------------------------------------------
    // LIMIT의 사용
    // 공식: (현재 페이지 - 1 ) * 페이지당 출력할 레코드 갯수
    // ----------------------------------------------------------
    // 1 page: (1 - 1) * 10 = 0    LIMIT 0, 10
    // 2 page: (2 - 1) * 10 = 10  LIMIT 10, 10
    // 3 page: (3 - 1) * 10 = 20  LIMIT 20, 10
    // 4 page: (4 - 1) * 10 = 30  LIMIT 30, 10
    // 5 page: (5 - 1) * 10 = 40  LIMIT 40, 10
    // ----------------------------------------------------------
    int offset = (nowPage - 1) * 10; // 첫 레코드를 기준으로 제외할 레코드 갯수
    
    try {

        sql  = " SELECT qano, title, content, passwd, rdate, grpno, indent, ansnum ";
        sql += " FROM pds5";
        sql += " ORDER BY grpno DESC, ansnum ASC";
        sql += " LIMIT " + offset + ", 10";
        
        pstmt = con.prepareStatement(sql);
      
      rs = pstmt.executeQuery(); // SELECT
      
      list = new ArrayList();         // DTO 객체 저장소
      while(rs.next() == true){
        // 레코드에서 컬럼의 값을 추출해 자바 클래스의 변수로
        // 저장합니다.
        Pds5DTO pds5DTO = new Pds5DTO();
        // System.out.println("메모리에 할당된 객체 고유 코드: " + dto.hashCode());
        
        pds5DTO.setQano(rs.getInt("qano"));
        pds5DTO.setTitle(rs.getString("title"));
        pds5DTO.setContent(rs.getString("content"));
        pds5DTO.setPasswd(rs.getString("passwd"));
        pds5DTO.setRdate(rs.getString("rdate"));
        pds5DTO.setGrpno(rs.getInt("grpno"));
        pds5DTO.setIndent(rs.getInt("indent"));
        pds5DTO.setAnsnum(rs.getInt("ansnum"));
        
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
  public int passwdCheck(int qano, String passwd){
    Connection con = this.dbopen.getConnection(); // DBMS 연결 객체
    PreparedStatement pstmt = null;   // SQL 실행
    ResultSet rs = null;              // SELECT 결과 저장
    String sql = "";                    // SQL 저장
    int count = 0;     // INSER, UPDATE, DELETE 처리된 갯수 저장
    
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
      this.dbclose.close(con, pstmt, rs); // 데이터베이스 연결 해제
    }
    
    return count;
    
  }

  /**
   * 레코드를 수정합니다.
   * @param pds5DTO 수정할 데이터 객체
   * @return 수정 성공하면 1, 실패시 0을 리턴
   */
  public int update(Pds5DTO pds5DTO){
    Connection con = this.dbopen.getConnection(); // DBMS 연결 객체
    PreparedStatement pstmt = null; // SQL 실행
    ResultSet rs = null;            // SELECT 결과 저장
    String sql = "";                 // SQL 저장
    int count = 0;     // INSER, UPDATE, DELETE 처리된 갯수 저장
    
    try {
      sql   = " UPDATE pds5";
      sql += " SET title=?, content=?";
      sql += " WHERE qano=?";
      
      pstmt = con.prepareStatement(sql);
      pstmt.setString(1, pds5DTO.getTitle());
      pstmt.setString(2, pds5DTO.getContent());
      pstmt.setInt(3, pds5DTO.getQano());
      
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
  public int delete(int qano){
    Connection con = this.dbopen.getConnection(); // DBMS 연결 객체
    PreparedStatement pstmt = null; // SQL 실행
    ResultSet rs = null;            // SELECT 결과 저장
    String sql = "";                 // SQL 저장
    int count = 0;     // INSER, UPDATE, DELETE 처리된 갯수 저장
    
    try {
      sql   = " DELETE FROM pds5";
      sql += " WHERE qano = ?";
      
      pstmt = con.prepareStatement(sql);
      pstmt.setInt(1, qano);
      
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
  public Pds5DTO read(int qano){
    Connection con = this.dbopen.getConnection(); // DBMS 연결 객체
    PreparedStatement pstmt = null;   // SQL 실행
    ResultSet rs = null;              // SELECT 결과 저장
    String sql = "";                    // SQL 저장
    int count = 0;     // INSER, UPDATE, DELETE 처리된 갯수 저장
    Pds5DTO pds5DTO = null;    // 레코드 목록 저장 
    
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
      this.dbclose.close(con, pstmt, rs); // 데이터베이스 연결 해제
    }
    
    return pds5DTO;
    
  }

  /**
   * 답변을 추가합니다.
   * @param pds5DTO 등록할 데이터 객체
   * @return 추가한 갯수 1 또는 0을 리턴
   */
  public int reply(Pds5DTO pds5DTO){
    Connection con = this.dbopen.getConnection(); // DBMS 연결 객체
    PreparedStatement pstmt = null; // SQL 실행
    ResultSet rs = null;            // SELECT 결과 저장
    String sql = "";                // SQL 저장
    int count = 0;     // INSER, UPDATE, DELETE 처리된 갯수 저장
    
    try {
      // 현재 답변을 붙이고 있는 부모글 정보를 조회함.
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
      pstmt.setInt(1, pds5DTO.getGrpno());  //  현재 답변을 달고있는 부모글 번호
      pstmt.setInt(2,  pds5DTO.getAnsnum()); // 그 부모글의 ansnum 번호
      pstmt.executeUpdate(); // 기존에 등록된 답변의 순서를 1씩 증가

      sql   =" INSERT INTO pds5(title, content, passwd, rdate, grpno, indent, ansnum, itemno )";
      sql +=" VALUES(?, ?, ?, now(), ?, ?, ?, ?)";
      pstmt = con.prepareStatement(sql);
      pstmt.setString(1, pds5DTO.getTitle());
      pstmt.setString(2, pds5DTO.getContent());
      pstmt.setString(3, pds5DTO.getPasswd());
      pstmt.setInt(4, pds5DTO.getGrpno());       // 부모글의 그룹번호 그대로 사용
      pstmt.setInt(5, pds5DTO.getIndent() + 1);   // 들여쓰기 부모보다 1 증가
      pstmt.setInt(6, pds5DTO.getAnsnum() + 1); // 답변순서 부모보다 1 증가
      pstmt.setInt(7, pds5DTO.getItemno());
      count = pstmt.executeUpdate();  // SQL 실행
      
    } catch (Exception e) {
      e.printStackTrace();
    } finally{
      this.dbclose.close(con, pstmt);
    }
    
    return count;
  }

}

