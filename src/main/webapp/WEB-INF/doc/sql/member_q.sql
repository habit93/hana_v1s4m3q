/**********************************/
/* Table Name: ��� */
/**********************************/
1.���̺� ����
DROP TABLE member;

CREATE TABLE member(
    mno                               INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '��� ��ȣ',
    id                                VARCHAR(20)    NOT NULL COMMENT '���̵�',
    passwd                            VARCHAR(20)    NOT NULL COMMENT '�н�����',
    mname                             VARCHAR(20)    NOT NULL COMMENT '�̸�',
    nickname                          VARCHAR(20)    NOT NULL COMMENT '�г���',
    birthday                          DATE     NOT NULL COMMENT '����',
    gender                            TINYINT(3)     NOT NULL COMMENT '����',
    admin                             INT(10)    DEFAULT 0     NOT NULL COMMENT '������',
  CONSTRAINT id UNIQUE (id)
) COMMENT='���';

2.���
INSERT INTO member(mno, id, passwd, mname, nickname, birthday, gender, admin)
VALUES(1, 'id1', '1234', 'kys1', 'wjdiwh33', now, 'man', 'admin');