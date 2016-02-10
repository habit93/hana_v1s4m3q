/**********************************/
/* Table Name: ���� ��� */
/**********************************/
DROP TABLE item;
   
CREATE TABLE item(
    itemno                            INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '���ǹ�ȣ',
    title                             VARCHAR(10)    NOT NULL COMMENT '�̸�',
    price                             INT(10)    NOT NULL COMMENT '����',
    content                           VARCHAR(200)     NOT NULL COMMENT '����',
    thumb                             VARCHAR(20)    NOT NULL COMMENT '�����',
    categoryno                        INT(10)    NULL  COMMENT 'ī�װ���ȣ',
  FOREIGN KEY (categoryno) REFERENCES shopcategory (categoryno)
) COMMENT='��ǰ';

���
INSERT INTO item(title, price, content, thumb, categoryno)
VALUES ('GAP �ĵ�Ƽ', '25000', '�׽�Ʈ1', 'thubm.jpg', 1);

���
SELECT itemno, title, content, price, categoryno
FROM item
ORDER BY itemno ASC;

��ȸ
SELECT itemno, title, content, thumb, price, categoryno
FROM item
WHERE itemno=1;

����
UPDATE item
SET title='', content='', price='', thumb='', categoryno=''
WHERE itemno=1;

����
DELETE FROM item
WHERE itemno=1;