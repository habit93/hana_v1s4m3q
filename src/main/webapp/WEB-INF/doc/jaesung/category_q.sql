/**********************************/
/* Table Name: ���⳻��ī�װ� */
/**********************************/
1) ���̺� ����
DROP TABLE category;

CREATE TABLE category(
    categoryno                        INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '���⳻��ī�װ���ȣ',
    categorysort                      VARCHAR(50)    NOT NULL COMMENT '�з�'
) COMMENT='���⳻��ī�װ�';

 
2) ���
INSERT INTO category(categorysort)
VALUES('�ĺ�');
INSERT INTO category(categorysort)
VALUES('ī��');
INSERT INTO category(categorysort)
VALUES('��ȭ��Ȱ');

 
3) ���
SELECT * FROM category;

SELECT categoryno, categorysort
FROM category
ORDER BY categoryno DESC;

4) ��ȸ
SELECT categoryno, categorysort
FROM category
WHERE categoryno=1;

5) ����
UPDATE category
SET categorysort=''
WHERE categoryno=1;

6) ����
DELETE FROM category
WHERE categoryno=1;



