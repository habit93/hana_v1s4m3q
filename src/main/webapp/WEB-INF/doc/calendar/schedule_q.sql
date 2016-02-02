/**********************************/
/* Table Name: ������ */
/**********************************/
1) ���̺� ����
DROP TABLE schedule;

CREATE TABLE schedule(
    scheduleno                        INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '�����ٹ�ȣ',
    title                             VARCHAR(20)    NOT NULL COMMENT '����',
    contents                          VARCHAR(200)     NOT NULL COMMENT '����',
    icon                              VARCHAR(50)    NOT NULL COMMENT '������',
    mno                               INT(10)    NULL  COMMENT '��� ��ȣ',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='������';


2) ���

INSERT INTO schedule(title, contents, icon, mno)
VALUES('����', 'birthday.jpg', '1');







3) ���
SELECT * FROM schedule;


SELECT scheduleno, contents, icon, mno
FROM schedule
ORDER BY mno DESC;



4) ��ȸ
SELECT scheduleno, contents, icon, mno
FROM schedule
WHERE mno=1;



5) ����
UPDATE schedule
SET contents='', icon=''
WHERE mno=1;


6) ����
DELETE FROM schedule
WHERE mno=1;





