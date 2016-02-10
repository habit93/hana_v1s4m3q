/**********************************/
/* Table Name: �����亯 */
/**********************************/
DROP TABLE qa;

CREATE TABLE qa(
    qano                              INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '�����亯��ȣ',
    title                             VARCHAR(20)    NOT NULL COMMENT '����',
    content                           VARCHAR(200)     NOT NULL COMMENT '����',
    rdate                             DATE     NOT NULL COMMENT '�����',
    step                              MEDIUMINT(10)    DEFAULT 0     NOT NULL COMMENT '����',
    depth                             MEDIUMINT(10)    DEFAULT 0     NOT NULL COMMENT '����',
    ref                               VARCHAR(10)    NOT NULL COMMENT '����',
    itemno                            INT(10)    NULL  COMMENT '���ǹ�ȣ',
    mno                               INT(10)    NULL  COMMENT '��� ��ȣ',
  FOREIGN KEY (itemno) REFERENCES item (itemno),
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='�����亯';

���
INSERT INTO qa(title, content, rdate, grpno, indent, ansnum, itemno, mno)
VALUES ('����', '����', now(), 0, 0, 0, 1, 1);

���
SELECT qano, title, content, rdate, grpno, indent, ansnum, itemno, mno
FROM qa
ORDER BY qano DESC;

��ȸ
SELECT qano, title, content, rdate, grpno, indent, ansnum, itemno, mno
FROM qa
WHERE qano=1;

����
UPDATE qa
SET title='', content=''
WHERE qano=1;

����
DELETE FROM qa
WHERE qano=1;


   SELECT MAX(grpno) FROM qa;
   
   INSERT INTO qa(title, content, rdate, grpno, indent, ansnum, itemno, mno)
   VALUES('�����׽�Ʈ', '�����׽�Ʈ', now(), (SELECT IFNULL(MAX(grpno), 0)+1 FROM qa as grpno), 1, 1, 1, 1);
   
