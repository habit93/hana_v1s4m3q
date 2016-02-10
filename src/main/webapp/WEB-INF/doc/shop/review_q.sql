/**********************************/
/* Table Name: ���� */
/**********************************/
DROP TABLE review;

CREATE TABLE review(
    reviewno                          INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '�����ȣ',
    title                             VARCHAR(20)    NOT NULL COMMENT '��������',
    contents                          VARCHAR(800)     NOT NULL COMMENT '���䳻��',
    rdate                             DATE     NOT NULL COMMENT '�����',
    itemno                            INT(10)    NULL  COMMENT '���ǹ�ȣ',
    mno                               INT(10)    NULL  COMMENT '��� ��ȣ',
  FOREIGN KEY (itemno) REFERENCES item (itemno),
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='����';

���
INSERT INTO review(title, contents, rdate, itemno, mno)
VALUES ('���� ����', '���� ���', now(), 1, 1);

���
SELECT reviewno, title, contents, rdate, itemno, mno
FROM review
ORDER BY reviewno DESC;

��ȸ
SELECT reviewno, title, contents, rdate, itemno, mno
FROM review
WHERE reviewno=1;

����
UPDATE review
SET title='', content=''
WHERE reviewno=1;

����
DELETE FROM review
WHERE reviewno=1;