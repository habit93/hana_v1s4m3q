/**********************************/
/* Table Name: �����亯 */
/**********************************/
DROP TABLE Pds5;

CREATE TABLE Pds5(
    qano                              INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '�����亯��ȣ',
    title                             VARCHAR(20)    NOT NULL COMMENT '����',
    content                           VARCHAR(200)     NOT NULL COMMENT '����',
    passwd                            VARCHAR(15)    NOT NULL COMMENT '�н�����',
    rdate                             DATE     NOT NULL COMMENT '�����',
    grpno                             MEDIUMINT(10)    DEFAULT 0     NOT NULL COMMENT '�θ�۹�ȣ',
    indent                            SMALLINT(10)     DEFAULT 0     NOT NULL COMMENT '�亯����',
    ansnum                            SMALLINT(10)     DEFAULT 0     NOT NULL COMMENT '�亯����',
    itemno                            INT(10)    NULL  COMMENT '���ǹ�ȣ',
  FOREIGN KEY (itemno) REFERENCES item (itemno)
) COMMENT='�����亯';


���
INSERT INTO qa(title, content, passwd, rdate, grpno, indent, ansnum, itemno)
VALUES ('����', '����', now(), 0, 0, 0, 1);

���
SELECT qano, title, content, passwd, rdate, grpno, indent, ansnum, itemno
FROM Pds5
ORDER BY qano DESC;

��ȸ
SELECT qano, title, content, passwd, rdate, grpno, indent, ansnum, itemno
FROM Pds5
WHERE qano=1;

����
UPDATE Pds5
SET title='', content=''
WHERE qano=1;

����
DELETE FROM qa
WHERE qano=1;

�н����� �˻�
- COUNT(): �߻��� ���ڵ��� ���� ���, ���ڵ尡 ������ 0 ���

SELECT COUNT(passwd) as cnt
FROM pds5
WHERE bbsno = 1 AND passwd='123';


----------------------
�亯 ���� SQL
----------------------

1. �亯�� �Խ��ǿ����� �۾��� 
   - grpno: �׷� ��ȣ�� �̿�, ���ο� ���� ������ ������, ���ο� ���� ������
            ���ο� �׷��� �������� �ǹ�.
         
�� ��� ���ڵ� ����         
   DELETE FROM pds5;

�� ��ϵ� ���ڵ� ������ null �߻�
   SELECT MAX(grpno) FROM pds5;
   
   MAX(grpno)
   ----------
         NULL

�� null�̸� 0���� ����
   SELECT IFNULL(MAX(grpno), 0) FROM pds5;
   
   IFNULL(MAX(grpno), 0)
   ---------------------
                       0

�� �ִ밪 + 1
   SELECT IFNULL(MAX(grpno), 0)+1 FROM pds5;
   
   IFNULL(MAX(grpno), 0)+1
   -----------------------
                          1
                       
�� �÷��� ���� ����: as �̿�
   SELECT IFNULL(MAX(grpno), 0)+1 as grpno FROM pds5;

   grpno
   -----
       1

�� �亯�� �Խ����� �۾��� ����
   INSERT INTO pds5(rname, email, title, content, passwd, viewcnt, rdate,
                      grpno, indent, ansnum, url, ip)
   VALUES('�մ���', '2014�� 10�� ������', '���� �� ���� ��������.', now(),
               (SELECT IFNULL(MAX(grpno), 0)+1 FROM pds5 as grpno), 0, 0);

                  
�� SELECT                  
   SELECT bbsno, rname, email, grpno, indent, ansnum, url, ip 
   FROM pds5;
                  
                  
2. �亯�� ó��: public int reply(pds5DTO dto) �޼ҵ忡�� ���

   - grpno: �亯�� ���� ������ ��ϵ� ���ڵ��� grpno �� ��� 
   - indent: �亯�� ���� ������ ��ϵ� ���ڵ��� indent+1 ���
   - ansnum: �亯�� ���� ������ ��ϵ� ���ڵ��� ansnum+1 ���
     
   - ansnum �÷��� �� ����
   UPDATE pds5 
   SET ansnum = ansnum + 1 
   WHERE grpno = ? AND ansnum > ?; 
   
   - �亯 �߰�
   INSERT INTO pds5(rname, email, title, content, passwd, viewcnt, rdate, grpno, indent, ansnum, url, ip)
   VALUES('���浿', '2015��', '���� �� ���� ��������.', '123', 0, now(), ?, ?, ?, ?); 


--------------------------------------------
13. �亯 ���� SQL������ ����¡
--------------------------------------------
    - �˻��� ���� �ʴ� ��� 
      SELECT bbsno, email, rname, title, content, passwd, viewcnt, rdate, grpno, indent, ansnum, url, ip 
      FROM pds5
      ORDER BY grpno DESC, ansnum ASC
      LIMIT 0, 10;
      
    - �̸� �˻�
      SELECT bbsno, email, rname, title, content, passwd, viewcnt, rdate, grpno, indent, ansnum, url, ip 
      FROM pds5
      WHERE rname LIKE '%�մ���%'
      ORDER BY grpno DESC, ansnum ASC
      LIMIT 0, 10;

    - �������� �˻�   
      SELECT bbsno, email, rname, title, content, passwd, viewcnt, rdate, grpno, indent, ansnum, url, ip 
      FROM pds5
      WHERE title LIKE '%���ǻ�%'
      ORDER BY grpno DESC, ansnum ASC
      LIMIT 0, 10;

    - �������� �˻�  
      SELECT bbsno, email, rname, title, content, passwd, viewcnt, rdate, grpno, indent, ansnum, url, ip 
      FROM pds5
      WHERE content LIKE '%��ũ��%'
      ORDER BY grpno DESC, ansnum ASC
      LIMIT 0, 10;


------------------------------------------------------

