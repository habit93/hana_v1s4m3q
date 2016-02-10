/**********************************/
/* Table Name: ������ */
/**********************************/
1) ���̺� ����
DROP TABLE schedule;

CREATE TABLE schedule(
    scheduleno                        INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '�����ٹ�ȣ',
    rdate                             DATE     NOT NULL COMMENT '��¥',
    contents                          VARCHAR(200)     NOT NULL COMMENT '����',
    mno                               INT(10)    NULL  COMMENT '��� ��ȣ',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='������';


2) ���
INSERT INTO schedule(rdate, contents, mno)
VALUES('20160111', '100��', '1');

3) ���
SELECT * FROM schedule;

SELECT scheduleno, rdate, contents, mno
FROM schedule
ORDER BY rdate DESC;

4) ��ȸ
SELECT scheduleno, rdate, contents, mno
FROM schedule
WHERE scheduleno=1;

5) ����
UPDATE schedule
SET rdate='132123', contents='123123'
WHERE scheduleno=1;

6) ����
DELETE FROM schedule
WHERE scheduleno=1;





