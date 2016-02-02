/**********************************/
/* Table Name: ����īƮ */
/**********************************/
DROP TABLE cart;

CREATE TABLE cart(
    cartno                            INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT 'īƮ ��ȣ',
    itemno                            INT(10)    NULL  COMMENT '���� ��ȣ',
    mno                               INT(10)    NULL  COMMENT '��� ��ȣ',
  FOREIGN KEY (itemno) REFERENCES item (itemno),
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='����īƮ';

���
INSERT INTO cart(itemno, mno)
VALUES ('����', '����', '���ǹ�ȣ');

���
SELECT cartno, itemno, mno
FROM cart
ORDER BY cartno DESC;

��ȸ
SELECT cartno, itemno, mno
FROM cart
WHERE cartno=1;

����
UPDATE cart
SET itemno='', mno=''
WHERE cartno=1;
 
����
DELETE FROM cart
WHERE cartno=1;