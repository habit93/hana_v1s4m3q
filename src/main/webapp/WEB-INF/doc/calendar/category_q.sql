/**********************************/
/* Table Name: ���⳻��ī�װ� */
/**********************************/
1) ���̺� ����
DROP TABLE category;

CREATE TABLE category(
    categoryno                        INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '���⳻��ī�װ���ȣ',
    sort                              VARCHAR(50)    NOT NULL COMMENT '�з�'
) COMMENT='���⳻��ī�װ�';


2) ���
INSERT INTO category(sort)
VALUES('�ĺ�');
INSERT INTO category(sort)
VALUES('ī��');
INSERT INTO category(sort)
VALUES('��ȭ��Ȱ');


3) ���
SELECT * FROM category;

SELECT categoryno, sort
FROM category
ORDER BY categoryno DESC;

4) ��ȸ
SELECT categoryno, sort
FROM category
WHERE categoryno=1;

5) ����
UPDATE category
SET sort=''
WHERE categoryno=1;

6) ����
DELETE FROM category
WHERE categoryno=1;

