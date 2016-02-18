package com.hana.member;
 
public class MemberVO {
  /*
    mno                               INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '��� ��ȣ',
    id                                VARCHAR(20)    NOT NULL COMMENT '���̵�',
    passwd                            VARCHAR(20)    NOT NULL COMMENT '�н�����',
    mname                             VARCHAR(20)    NOT NULL COMMENT '�̸�',
    nickname                          VARCHAR(20)    NOT NULL COMMENT '�г���',
    birthday                          DATE     NOT NULL COMMENT '����',
    gender                            TINYINT(3)     NOT NULL COMMENT '����',
    admin                             VARCHAR(10)    DEFAULT 'N'     NOT NULL COMMENT '������',
  CONSTRAINT id UNIQUE (id)
  */
 
  /** ������ ��ȣ */
  private int mno;
  /** ���̵� */
  private String id;
  /** �н����� */
  private String passwd;
  /** ���� */
  private String mname;
  /** �г��� */
  private String nickname;
  /** ���� */
  private String birthday;
  /** ���� */
  private int gender;
  /** ������ ���� */
  private String admin;

  /** ���� �н����� */
  private String old_passwd;
  /** id ���� ���� */
  private String id_save;
  /** passwd ���� ����*/
  private String passwd_save;
  
  public int getMno() {
    return mno;
  }
  public void setMno(int mno) {
    this.mno = mno;
  }
  public String getId() {
    return id;
  }
  public void setId(String id) {
    this.id = id;
  }
  public String getPasswd() {
    return passwd;
  }
  public void setPasswd(String passwd) {
    this.passwd = passwd;
  }
  public String getMname() {
    return mname;
  }
  public void setMname(String mname) {
    this.mname = mname;
  }
  public String getNickname() {
    return nickname;
  }
  public void setNickname(String nickname) {
    this.nickname = nickname;
  }
  public String getBirthday() {
    return birthday;
  }
  public void setBirthday(String birthday) {
    this.birthday = birthday;
  }
  public int getGender() {
    return gender;
  }
  public void setGender(int gender) {
    this.gender = gender;
  }
  public String getAdmin() {
    return admin;
  }
  public void setAdmin(String admin) {
    this.admin = admin;
  }
  public String getOld_passwd() {
    return old_passwd;
  }
  public void setOld_passwd(String old_passwd) {
    this.old_passwd = old_passwd;
  }
  public String getId_save() {
    return id_save;
  }
  public void setId_save(String id_save) {
    this.id_save = id_save;
  }
  public String getPasswd_save() {
    return passwd_save;
  }
  public void setPasswd_save(String passwd_save) {
    this.passwd_save = passwd_save;
  }

  
}

