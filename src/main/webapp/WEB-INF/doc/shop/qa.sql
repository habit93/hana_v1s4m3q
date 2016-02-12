/**********************************/
/* Table Name: �����亯 */
/**********************************/
DROP TABLE qa;

CREATE TABLE qa(
    qano                              INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '�����亯��ȣ',
    title                             VARCHAR(20)    NOT NULL COMMENT '����',
    content                           VARCHAR(200)     NOT NULL COMMENT '����',
    passwd                            VARCHAR(15)    NOT NULL COMMENT '�н�����',
    rdate                             DATE     NOT NULL COMMENT '�����',
    step                              MEDIUMINT(10)    DEFAULT 0     NOT NULL COMMENT '����',
    depth                             MEDIUMINT(10)    DEFAULT 0     NOT NULL COMMENT '����',
    ref                               VARCHAR(10)    NOT NULL COMMENT '����',
    itemno                            INT(10)    NULL  COMMENT '���ǹ�ȣ',
  FOREIGN KEY (itemno) REFERENCES item (itemno)
) COMMENT='�����亯';


���
INSERT INTO qa(title, content, passwd, rdate, grpno, indent, ansnum, itemno)
VALUES ('����', '����', now(), 0, 0, 0, 1);

���
SELECT qano, title, content, passwd, rdate, grpno, indent, ansnum, itemno
FROM qa
ORDER BY qano DESC;

��ȸ
SELECT qano, title, content, passwd, rdate, grpno, indent, ansnum, itemno
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
   
   INSERT INTO qa(title, content, rdate, grpno, indent, ansnum, itemno)
   VALUES('�����׽�Ʈ', '�����׽�Ʈ', now(), (SELECT IFNULL(MAX(grpno), 0)+1 FROM qa as grpno), 1, 1, 1);
   
