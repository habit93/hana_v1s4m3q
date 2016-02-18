package com.hana.calendar;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.hana.tool.DBClose;
import com.hana.tool.DBOpen;

public class CalendarDAO {
  /** ���̺� �̸� */
  private String table_name = "calendar";

  private DBOpen dbopen = null;
  private DBClose dbclose = null;

  /**
   * �⺻ ������
   */
  public CalendarDAO() {
    dbopen = new DBOpen();
    dbclose = new DBClose();
  }

  /**
   * �Ѱ��� �����͸� �߰��մϴ�.
   * @param dto ������ ��ü
   * @return 1: �߰� ����, 2: �߰� ����
   * @throws SQLException
   *           DBMS Error
   */
  public int create(CalendarDTO dto) throws SQLException {
    Connection con = dbopen.getConnection(); 
    PreparedStatement pstmt = null; // SQL ���� ��ü
    ResultSet rs = null; // SELECT ��� ���� ��ü
    int count = 0;

    StringBuffer sql = new StringBuffer();

    // MySQL
    sql.append(" INSERT INTO " + table_name + "(rdate, label, title, contents, mno)");
    sql.append(" VALUES(?, ?, ?, ?, ?)");

    pstmt = con.prepareStatement(sql.toString());
    pstmt.setString(1, dto.getRdate());
    pstmt.setString(2, dto.getLabel());
    pstmt.setString(3, dto.getTitle());
    pstmt.setString(4, dto.getContents());
    pstmt.setInt(5, dto.getMno());

    // �߰��� ���ڵ��� 1�� retVal ������ ����
    count = pstmt.executeUpdate();

    dbclose.close(con, pstmt, rs);

    return count; // 1 or 0
  }

  /**
   * �������� �׷��ȣ�� ���ؼ� ��ü ����� �����ɴϴ�.
   * @throws SQLException
   */
  public ArrayList list() throws SQLException {
    Connection con = dbopen.getConnection();
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    StringBuffer sql = null;
    ArrayList list = null; // dto ����� ����

    list = new ArrayList();

    sql = new StringBuffer();

    sql.append(" SELECT calendarno, rdate, label, title, contents, mno ");
    sql.append(" FROM " + table_name);
    sql.append(" ORDER BY calendarno DESC;");

    pstmt = con.prepareStatement(sql.toString());
    
    rs = pstmt.executeQuery(); // SELECT ���� ����

    while (rs.next() == true) {
      CalendarDTO dto = new CalendarDTO();

      dto.setCalendarno(rs.getInt("calendarno"));// DBMS --> JAVA
      dto.setRdate(rs.getString("rdate"));
      dto.setLabel(rs.getString("label"));
      dto.setTitle(rs.getString("title"));
      dto.setContents(rs.getString("contents"));
      dto.setMno(rs.getInt("mno"));

      list.add(dto);

    }

    dbclose.close(con, pstmt, rs);

    return list;
  }

  /**
   * �޷� ��¥�� �ش��ϴ� ���ڵ带 �����մϴ�.
   * 
   * @param pdsgrpno
   *          �׷��ȣ
   * @return �˻� ���
   * @throws SQLException
   */
  public ArrayList listLabel(String date) throws SQLException {
    Connection con = dbopen.getConnection();
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    StringBuffer sql = sql = new StringBuffer();
    ArrayList list = new ArrayList();

    sql.append(" SELECT calendarno, rdate, label");
    sql.append(" FROM " + table_name);
    sql.append(" WHERE rdate=?");  // 2013-10-15
    
    pstmt = con.prepareStatement(sql.toString());
    pstmt.setString(1, date);

    rs = pstmt.executeQuery(); // SELECT ���� ����
    
    while (rs.next() == true) {
      CalendarDTO dto = new CalendarDTO();

      dto.setCalendarno(rs.getInt("calendarno"));// DBMS --> JAVA
      dto.setRdate(rs.getString("rdate")); // �޷� ��¿� ��¥
      dto.setLabel(rs.getString("label")); // ����� ���ڿ�

      list.add(dto);

    }

    dbclose.close(con, pstmt, rs);

    return list;
  }
  
  /**
   * �۹�ȣ�� �̿��Ͽ� ���� �����ɴϴ�.
   */
  public CalendarDTO read(int calendarno) throws SQLException {
    Connection con = dbopen.getConnection();
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    StringBuffer sql = null;

    CalendarDTO dto = null;

    sql = new StringBuffer();

    sql.append(" SELECT calendarno, rdate, label, title, contents, mno ");
    sql.append(" FROM " + table_name);
    sql.append(" WHERE calendarno=?");
    
    pstmt = con.prepareStatement(sql.toString());
    pstmt.setInt(1, calendarno); // ù��° ?ǥ�� �۹�ȣ�� �Ҵ�

    rs = pstmt.executeQuery();

    if (rs.next()) { // ���ڵ� �����͸� ù��° ���ڵ�� �̵�
      dto = new CalendarDTO();

      dto.setCalendarno(rs.getInt("calendarno"));// DBMS --> JAVA
      dto.setRdate(rs.getString("rdate"));
      dto.setLabel(rs.getString("label"));
      dto.setTitle(rs.getString("title"));
      dto.setContents(rs.getString("contents"));
      dto.setMno(rs.getInt("mno"));

    }

    dbclose.close(con, pstmt, rs);

    return dto;
  }

  /**
   * ���� �����մϴ�.
   * 
   * @param dto
   *          �� ��ü
   * @return 1: ���������� ����, 0: ���� ����
   */
  public int update(CalendarDTO dto) throws SQLException {
    Connection con = dbopen.getConnection();
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    StringBuffer sql = null;

    int cnt = 0; // ������ ���ڵ� ���� ����

    sql = new StringBuffer();
    sql.append(" UPDATE " + table_name);
    sql.append(" SET rdate=?, label=?, title=?, contents=?");
    sql.append(" WHERE calendarno = ?");

    pstmt = con.prepareStatement(sql.toString());
    pstmt.setString(1, dto.getRdate());
    pstmt.setString(2, dto.getLabel());
    pstmt.setString(3, dto.getTitle());
    pstmt.setString(4, dto.getContents());
    pstmt.setInt(5, dto.getCalendarno());

    cnt = pstmt.executeUpdate();

    dbclose.close(con, pstmt);

    return cnt;
  }

  /**
   * �ϳ��� �����͸� �����մϴ�.
   * 
   * @return �������� ������ true�� ���д� false�� �����մϴ�.
   */
  public int delete(int calendarno) throws SQLException {
    Connection con = dbopen.getConnection();
    PreparedStatement pstmt = null;
    StringBuffer sql = null;

    int cnt = 0;

    sql = new StringBuffer();
    sql.append(" DELETE FROM " + table_name);
    sql.append(" WHERE calendarno = ?");

    pstmt = con.prepareStatement(sql.toString());
    pstmt.setInt(1, calendarno);

    // ������ ���ڵ��� �� ����
    cnt = pstmt.executeUpdate();

    dbclose.close(con, pstmt);

    return cnt;

  }
}


