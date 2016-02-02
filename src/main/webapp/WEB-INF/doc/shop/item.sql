/**********************************/
/* Table Name: ���� ��� */
/**********************************/
DROP TABLE item;
   
CREATE TABLE item(
    itemno                            INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '���ǹ�ȣ',
    title                             VARCHAR(10)    NOT NULL COMMENT '�̸�',
    contents                          VARCHAR(200)     NOT NULL COMMENT '����',
    price                             VARCHAR(10)    NOT NULL COMMENT '����',
    categoryno                        MEDIUMINT(10)    NULL  COMMENT 'ī�װ���ȣ',
  FOREIGN KEY (categoryno) REFERENCES shopcategory (categoryno)
) COMMENT='���� ���';

���
INSERT INTO item(title, content, price, categoryno)
VALUES ('����', '����', '����', '���ǹ�ȣ');

���
SELECT itemno, title, contents, price, categoryno
FROM item
ORDER BY itemno DESC;

��ȸ
SELECT itemno, title, content, price, categoryno
FROM item
WHERE itemno=1;

����
UPDATE item
SET title='', content='', price='', categoryno=''
WHERE itemno=1;

����
DELETE FROM item
WHERE itemno=1;