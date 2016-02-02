/**********************************/
/* Table Name: 2���з�ī�װ� */
/**********************************/
DROP TABLE shopcategory;

CREATE TABLE shopcategory(
    categoryno                        INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT 'ī�װ���ȣ',
    category                          VARCHAR(10)    NOT NULL COMMENT 'ī�װ�����',
    codeno                            MEDIUMINT(10)    NULL  COMMENT '�ڵ��ȣ',
  FOREIGN KEY (codeno) REFERENCES shopcode (codeno)
) COMMENT='2���з�ī�װ�';

���
INSERT INTO shopcategory(category, codeno)
VALUES ('����', '����');

���
SELECT category, codeno
FROM shopcategory
ORDER BY categoryno DESC;

��ȸ
SELECT category, codeno
FROM shopcategory
WHERE categoryno=1;

����
UPDATE shopcategory
SET category='', codeno=''
WHERE categoryno=1;

����
DELETE FROM shopcategory
WHERE categoryno=1;