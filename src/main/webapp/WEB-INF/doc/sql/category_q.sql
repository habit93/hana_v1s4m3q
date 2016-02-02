/**********************************/
/* Table Name: ���⳻��ī�װ� */
/**********************************/
1.���̺� ����
DROP TABLE category;

CREATE TABLE category(
    categoryno                        INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '���⳻��ī�װ���ȣ',
    sort                              VARCHAR(50)    NOT NULL COMMENT '�з�'
) COMMENT='���⳻��ī�װ�';

2.���
INSERT INTO category(categoryno, sort)
VALUES(1, 'JAVA');

INSERT INTO category(categoryno, sort)
VALUES(2, 'JSP');

INSERT INTO category(categoryno, sort)
VALUES(3, 'Jquery');

SELECT * FROM category;

 categoryno sort
 ---------- ------
          1 JAVA
          2 JSP
          3 Jquery
          
3.���
SELECT categoryno, sort
FROM category
ORDER BY categoryno;

 categoryno sort
 ---------- ------
          1 JAVA
          2 JSP
          3 Jquery

4.��ȸ
SELECT categoryno, sort
FROM category
WHERE categoryno = 1;

 categoryno sort
 ---------- ----
          1 JAVA
          
5.����
DELETE FROM category
WHERE categoryno = 1;
