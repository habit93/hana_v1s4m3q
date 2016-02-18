package com.hana.member;
 
public class MemberVO {
  /*
    mno                               INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '멤버 번호',
    id                                VARCHAR(20)    NOT NULL COMMENT '아이디',
    passwd                            VARCHAR(20)    NOT NULL COMMENT '패스워드',
    mname                             VARCHAR(20)    NOT NULL COMMENT '이름',
    nickname                          VARCHAR(20)    NOT NULL COMMENT '닉네임',
    birthday                          DATE     NOT NULL COMMENT '생일',
    gender                            TINYINT(3)     NOT NULL COMMENT '성별',
    admin                             VARCHAR(10)    DEFAULT 'N'     NOT NULL COMMENT '관리자',
  CONSTRAINT id UNIQUE (id)
  */
 
  /** 관리자 번호 */
  private int mno;
  /** 아이디 */
  private String id;
  /** 패스워드 */
  private String passwd;
  /** 성명 */
  private String mname;
  /** 닉네임 */
  private String nickname;
  /** 생일 */
  private String birthday;
  /** 성별 */
  private int gender;
  /** 관리자 성명 */
  private String admin;

  /** 기존 패스워드 */
  private String old_passwd;
  /** id 저장 여부 */
  private String id_save;
  /** passwd 저장 여부*/
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

