/**********************************/
/* Table Name: 멤버 */
/**********************************/
1.테이블 생성
DROP TABLE member;

CREATE TABLE member(
    mno                               INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '멤버 번호',
    id                                VARCHAR(20)    NOT NULL COMMENT '아이디',
    passwd                            VARCHAR(20)    NOT NULL COMMENT '패스워드',
    mname                             VARCHAR(20)    NOT NULL COMMENT '이름',
    nickname                          VARCHAR(20)    NOT NULL COMMENT '닉네임',
    birthday                          DATE     NOT NULL COMMENT '생일',
    gender                            TINYINT(3)     NOT NULL COMMENT '성별',
    admin                             INT(10)    DEFAULT 0     NOT NULL COMMENT '관리자',
  CONSTRAINT id UNIQUE (id)
) COMMENT='멤버';

2.등록
INSERT INTO member(mno, id, passwd, mname, nickname, birthday, gender, admin)
VALUES(1, 'id1', '1234', 'kys1', 'wjdiwh33', now, 'man', 'admin');