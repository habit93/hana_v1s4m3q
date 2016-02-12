/**********************************/
/* Table Name: ���⳻��ī�װ� */
/**********************************/
1) ���̺� ����
DROP TABLE category;

CREATE TABLE category(
    categoryno                        INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '���⳻��ī�װ���ȣ',
    categorysort                      VARCHAR(50)    NOT NULL COMMENT '�з�',
    mno                               INT(10)    NULL  COMMENT '��� ��ȣ',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='���⳻��ī�װ�';

 
2) ���
INSERT INTO category(categorysort, mno)
VALUES('�ĺ�', '1');
INSERT INTO category(categorysort, mno)
VALUES('ī��', '1');
INSERT INTO category(categorysort, mno)
VALUES('��ȭ��Ȱ', '1');

 
3) ���
SELECT * FROM category;

SELECT categoryno, categorysort, mno
FROM category
ORDER BY categoryno DESC;

4) ��ȸ
SELECT categoryno, categorysort, mno
FROM category
WHERE categoryno=1;

5) ����
UPDATE category
SET categorysort=''
WHERE categoryno=1;

6) ����
DELETE FROM category
WHERE categoryno=1;



