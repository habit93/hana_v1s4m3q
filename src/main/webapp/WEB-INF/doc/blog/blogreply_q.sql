/**********************************/
/* Table Name: ��α׳��� */
/**********************************/
1) ���̺� ����
DROP TABLE blogreply;
 
/**********************************/
/* Table Name: ��α� ��� */
/**********************************/
CREATE TABLE blogreply(
    blogreplyno                       MEDIUMINT    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '��α� ��� ��ȣ',
    content                           VARCHAR(80)     NOT NULL COMMENT '����',
    rdate                             DATETIME     NOT NULL COMMENT '�����',
    blogno                            MEDIUMINT    NOT NULL COMMENT '��α� ��ȣ',
    indent                            MEDIUMINT    DEFAULT 0     NOT NULL COMMENT '�亯����',
    ansnum                            SMALLINT     DEFAULT 0     NOT NULL COMMENT '�亯����',
  FOREIGN KEY (blogno) REFERENCES blog (blogno)
) COMMENT='��α� ���';
 
 
2) ���
SELECT * FROM blog ORDER BY blogno DESC;
 

INSERT INTO blogreply(content, rdate, blogno, indent, ansnum)
VALUES('����1', now(), 4, 0, (SELECT IFNULL(MAX(ansnum), 0)+1 FROM blogreply as ansnum));



SELECT * FROM blogreply;

 
3) ���
SELECT blogreplyno, content, rdate, blogno, indent, ansnum
FROM blogreply
ORDER BY blogreplyno DESC;
 

-- Ư�� ��α��� ���
SELECT blogreplyno, content, rdate, blogno, indent, ansnum
FROM blogreply
-- Ư�� ��α��� ���
SELECT blogreplyno, content, rdate, blogno, indent, ansnum
FROM blogreply
WHERE blogno = 19
ORDER BY ansnum ASC;
 

4) ��ȸ
SELECT blogreplyno, content, rdate, blogno, indent, ansnum
FROM blogreply
WHERE blogreplyno = 1;
 
 
 
5) ����
UPDATE blogreply
SET content=''
WHERE blogreplyno=1;
 
 
6) ����
DELETE FROM blogreply
WHERE blogreplyno=1;
 
 
7) �亯
-- �ܰ� 1, ������� ���� ������ �о��.
SELECT blogno, indent, ansnum
FROM blogreply
WHERE blogreplyno =1;
 
-- �ܰ� 2
UPDATE blogreply
SET ansnum = ansnum + 1
WHERE blogreplyno = 1 AND ����� ansnum > 0
 
-- JAVA: indent = indent + 1;
--          ansnum = ����� ansnum + 1
 
 
-- �ܰ� 3: indent, ansnum �÷��� ���� ������.
INSERT INTO blogreply(content, rdate, blogno, indent, ansnum)
VALUES('�մ���', '1234', 'mail@mail.com', '����1', now(), 19, 1, 1);
 
 