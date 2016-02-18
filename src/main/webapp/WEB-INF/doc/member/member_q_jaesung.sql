1. ���̺� ����
DROP TABLE member;

CREATE TABLE member(
    mno                               INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '��� ��ȣ',
    id                                VARCHAR(20)    NOT NULL COMMENT '���̵�',
    passwd                            VARCHAR(20)    NOT NULL COMMENT '�н�����',
    mname                             VARCHAR(20)    NOT NULL COMMENT '�̸�',
    nickname                          VARCHAR(20)    NOT NULL COMMENT '�г���',
    birthday                          DATE     NOT NULL COMMENT '����',
    gender                            TINYINT(3)     NOT NULL COMMENT '����',
    admin                             VARCHAR(10)    DEFAULT 'N'     NOT NULL COMMENT '������',
  CONSTRAINT id UNIQUE (id)
) COMMENT='���';


2. ���

1) id �ߺ� Ȯ��
SELECT COUNT(id) as cnt
FROM member
WHERE id='user1';

 cnt
 ---
   0   �� �ߺ� ���� ����.
   
2) ���
INSERT INTO member(id, passwd, mname, nickname, birthday, gender, admin)
VALUES ('user1', '1234', '�մ���', '�г���', '2016-02-02', 0, 0);


3. ���
- �˻��� ���� �ʴ� ���, ��ü ��� ���
SELECT *
FROM member
ORDER BY mno ASC;

3. ��ȸ

1) user1 ��� ���� ����
SELECT mno, id, passwd, mname, tel, zipcode, address1, address2, mdate
FROM member
WHERE mno = 1;

   
4. ����
1) ���� ����
UPDATE member 
SET mname='�Ʒι�', tel='111-1111-1111', zipcode='00000',
      address1='��⵵', address2='���ֽ�'
WHERE mno=1;


2) �н����� �˻�
SELECT COUNT(mno) as cnt
FROM member
WHERE mno=1 AND passwd='1234';

3) �н����� ����
UPDATE member
SET passwd='0000'
WHERE mno=1;


5. ����
1) ��� ����
DELETE FROM member;

2) Ư�� ȸ�� ����
DELETE FROM member
WHERE mno=1;


6. �α���
SELECT COUNT(mno) as cnt
FROM member
WHERE id='user1' AND passwd='1234';
 cnt
 ---
   0


* ������Ʈ ����� �߰� �÷� �ȳ�: �̸���, ����, ȸ�� ����, ����, ���


