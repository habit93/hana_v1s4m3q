/**********************************/
/* Table Name: ���� ���� */
/**********************************/
DROP TABLE buy;

CREATE TABLE buy(
    buyno                             INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '���� ��ȣ',
    name                              VARCHAR(20)    NOT NULL COMMENT '���� �̸�',
    content                           VARCHAR(200)     NOT NULL COMMENT '���� ����',
    mno                               INT(10)    NULL  COMMENT '��� ��ȣ',
    itemno                            INT(10)    NULL  COMMENT '���ǹ�ȣ',
  FOREIGN KEY (mno) REFERENCES member (mno),
  FOREIGN KEY (itemno) REFERENCES item (itemno)
) COMMENT='���� ����';

���
INSERT INTO buy(name, content, mno, itemno)
VALUES ('����', '����', '���ǹ�ȣ');

���
SELECT buyno, name, content, mno, itemno
FROM buy
ORDER BY buyno DESC;

��ȸ
SELECT buyno, name, content, mno, itemno
FROM buy
WHERE buyno=1;

����
UPDATE buy
SET name='', content='', mno='', itemno=''
WHERE buyno=1;

����
DELETE FROM buy
WHERE buyno=1;