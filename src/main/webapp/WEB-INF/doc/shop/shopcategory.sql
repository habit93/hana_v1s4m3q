/**********************************/
/* Table Name: 2���з�ī�װ� */
/**********************************/
DROP TABLE shopcategory;

CREATE TABLE shopcategory(
    categoryno                        INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT 'ī�װ���ȣ',
    category                          VARCHAR(10)    NOT NULL COMMENT 'ī�װ�����',
    sort                              INT(10)    DEFAULT 1     NOT NULL COMMENT '��¼���',
    codeno                            MEDIUMINT(7)     NULL  COMMENT '�ڵ��ȣ',
  FOREIGN KEY (codeno) REFERENCES shopcode (codeno)
) COMMENT='2���з�ī�װ�';

���
INSERT INTO shopcategory(category, sort, codeno)
VALUES ('�׽�Ʈ', 1, 2);

���
SELECT categoryno, category, sort, codeno
FROM shopcategory
ORDER BY categoryno DESC;

SELECT c.codeno, c.code, t.categoryno, t.category, t.sort, t.codeno
FROM shopcode c, shopcategory t
WHERE c.codeno = t.codeno

��ȸ
SELECT category, sort, codeno
FROM shopcategory
WHERE categoryno=1;

����
UPDATE shopcategory
SET category='', sort, codeno=''
WHERE categoryno=1;

����
DELETE FROM shopcategory
WHERE categoryno=1;
