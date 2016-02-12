/**********************************/
/* Table Name: ���� */
/**********************************/
DROP TABLE buy;

CREATE TABLE buy(
    buyno                             INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '���� ��ȣ',
    name                              VARCHAR(20)    NOT NULL COMMENT '���� �̸�',
    cnt                               INT(10)    NOT NULL COMMENT '����',
    price                             MEDIUMINT    NOT NULL COMMENT '����',
    zipcode                           VARCHAR(10)    NOT NULL COMMENT '���� ��ȣ',
    address1                          VARCHAR(80)    NOT NULL COMMENT '���ּ�1',
    address2                          VARCHAR(80)    NOT NULL COMMENT '���ּ�2',
    date                              DATETIME     NOT NULL COMMENT '��¥',
    thumb                             VARCHAR(20)    NOT NULL COMMENT '�����',
    mno                               INT(10)    NULL  COMMENT '��� ��ȣ',
    itemno                            INT(10)    NULL  COMMENT '���ǹ�ȣ',
  FOREIGN KEY (mno) REFERENCES member (mno),
  FOREIGN KEY (itemno) REFERENCES item (itemno)
) COMMENT='����';

���
INSERT INTO buy(name, content, mno, itemno)
VALUES ('����', '����', '���ǹ�ȣ');

���
SELECT buyno, name, cnt, price, zipcode, address1, address2, date, mno, itemno
FROM buy
ORDER BY buyno DESC;

���� ���� ��ȸ
SELECT buyno, name, cnt, price, zipcode, address1, address2, date, mno, itemno
FROM buy
WHERE mno=3;

����
UPDATE buy
SET name='', content='', mno='', itemno=''
WHERE buyno=1;

����
DELETE FROM buy
WHERE buyno=4;