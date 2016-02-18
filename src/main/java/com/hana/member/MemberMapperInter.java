package com.hana.member;

import java.util.ArrayList;
import java.util.Map;

public interface MemberMapperInter {
  /**
   * ���ڵ带 ����մϴ�.
   * <insert id="create" parameterType="MemberVO">
   * @param vo ����� ������ ��ü
   * @return ��ϵ� ���ڵ� ��
   */
  public int create(MemberVO memberVO);
  
  /**
   * �ߺ� ���̵� �˻��մϴ�.
   * <select id='checkId' resultType='int' parameterType='String'>
   * @param id ���̵�
   * @return 0: �ߺ� �ƴ�, 1: �ߺ�
   */
  public int checkId(String id);
  
  /**
   * ȸ�� ��ü ���
   * <select id="list" resultType="MemberVO">
   * @return ȸ�� ���
   */
  public ArrayList<MemberVO> list();
  
  /**
   * ȸ�� ���� ��ȸ
   * <select id="read" resultType="MemberVO" parameterType="int">
   * @param mno
   * @return
   */
  public MemberVO read(int mno); 
  
  
  /**
   * ȸ���� �����մϴ�.
   * <update id="update" parameterType="MemberVO"> 
   * @param memberVO
   * @return ������ ���ڵ� ����
   */
  public int update(MemberVO memberVO);
  
  // <select id="passwdCheck" resultType="int" parameterType="Map">
  public int passwdCheck(Map map);
  
  //   <update id="update_passwd" parameterType="MemberVO">
  public int update_admin(MemberVO memberVO);
  
  //   <delete id="delete" parameterType="int">
  public int delete(int mno); 
  
  // <select id="login" resultType="int" parameterType="MemberVO">
  public int login(MemberVO memberVO);

  // <select id="mno" resultType='MemberVO' parameterType="String"> 
  public MemberVO mno(String id);
}



