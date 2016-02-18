[01]  �ڷ���� ����(�亯�� �Խ����� ����)

>>>>> /WebContent/WEB-INF/doc/pds5_q.sql 
------------------------------------------------------
1. �Խ��� ���̺� ���� 

DROP TABLE pds5; 

CREATE TABLE pds5 ( 
  bbsno    MEDIUMINT      NOT NULL AUTO_INCREMENT,  -- �� �Ϸ� ��ȣ 
  rname    VARCHAR(20)    NOT NULL,  -- �۾���
  email     VARCHAR(100)          NULL, -- �̸���  
  title       VARCHAR(200)  NOT NULL,  -- ����(*) 
  content  TEXT                NOT NULL,  -- �� ����, 65536�� ���� ���� 
  passwd  VARCHAR(15)    NOT NULL,  -- ��� ��ȣ 
  viewcnt  SMALLINT        DEFAULT 0, -- ��ȸ��, �⺻�� ��� 
  rdate     DATETIME        NOT NULL,  -- ��� ��¥, sysdate 
  grpno    MEDIUMINT     DEFAULT 0, -- �θ�� ��ȣ 
  indent    SMALLINT       DEFAULT 0, -- �亯���� 
  ansnum  SMALLINT       DEFAULT 0, -- �亯 ����
  url         VARCHAR(100)        NULL, -- URL, ���� �ּ�
  file1       VARCHAR(100)         NULL, -- ���ϸ� 1
  size1       BIGINT           DEFAULT 0, -- ���� ũ�� 1
  file2       VARCHAR(100)         NULL, -- ���ϸ� 2
  size2       BIGINT           DEFAULT 0, -- ���� ũ�� 2
  ip           VARCHAR(15)  NOT NULL, -- IP �ּ�, 000.000.000.000 
  PRIMARY KEY (bbsno)  
); 


2. �� �߰�(C: Create) 
INSERT INTO pds5(rname, email, title, content, passwd, viewcnt, rdate, grpno, indent, ansnum, url, file1, size1, file2, size2, ip)
VALUES('�մ���', 'email1@mail.com', '2014�� 10�� ������', '���� �� ���� ��������.', '123', 0, now(), 0, 0, 0, 
            'http://www.kma.go.kr', 'test.jpg', 100, 'small.jpg', 50, '172.16.0.1');

INSERT INTO pds5(rname, email, title, content, passwd, viewcnt, rdate, grpno, indent, ansnum, url, file1, size1, file2, size2, ip)
VALUES('�մ���', 'email1@mail.com', '2015�� 6�� ������', '���� �����Դϴ�.', '123', 0, now(), 0, 0, 0, 
            'http://www.kma.go.kr', 'mt.jpg', 100, 'mt2.jpg', 50, '172.16.0.1');

            
3. ��ü �� ���(S:Total Select List), �ֽű� ���� ��� 
   - ASC: ���� ����, DESC: ���� ���� 

SELECT bbsno, email, rname, title, content, passwd, viewcnt, rdate, grpno, indent, ansnum, url, file1, size1, file2, size2, ip 
FROM pds5
ORDER BY bbsno DESC;

 bbsno email           rname title         content       passwd viewcnt rdate                 grpno indent ansnum url                  file1    size1 file2     size2 ip
 ----- --------------- ----- ------------- ------------- ------ ------- --------------------- ----- ------ ------ -------------------- -------- ----- --------- ----- ----------
     2 email1@mail.com �մ���   2015�� 6�� ������  ���� �����Դϴ�.     123          0 2015-06-29 14:25:29.0     0      0      0 http://www.kma.go.kr mt.jpg     100 mt2.jpg      50 172.16.0.1
     1 email1@mail.com �մ���   2014�� 10�� ������ ���� �� ���� ��������. 123          0 2015-06-29 14:25:28.0     0      0      0 http://www.kma.go.kr test.jpg   100 small.jpg    50 172.16.0.1


4. ��ȸ�� ���� 
UPDATE pds5
SET viewcnt = viewcnt + 1
WHERE bbsno = 1;


5. 1���� �� ����(R:Read, PK ���) 
SELECT bbsno, email, rname, title, content, passwd, viewcnt, rdate, grpno, indent, ansnum, url, file1, size1, file2, size2, ip  
FROM pds5
WHERE bbsno = 1;
 bbsno email           rname title         content       passwd viewcnt rdate                 grpno indent ansnum url                  file1    size1 file2     size2 ip
 ----- --------------- ----- ------------- ------------- ------ ------- --------------------- ----- ------ ------ -------------------- -------- ----- --------- ----- ----------
     1 email1@mail.com �մ���   2014�� 10�� ������ ���� �� ���� ��������. 123          0 2015-06-29 14:25:28.0     0      0      0 http://www.kma.go.kr test.jpg   100 small.jpg    50 172.16.0.1


SELECT bbsno, email, rname, title, url 
FROM pds5;

 bbsno email           rname title                     url
 ----- --------------- ----- ------------------------- --------------------
     1 email1@mail.com �մ���   2014�� 10�� ������             http://www.kma.go.kr
     2 email2@mail.com �Ʒι�   2015�� ������ ���              http://www.kma.go.kr
     3 mail@mail.com   �մ���   ��, ��� ���� "���� ���� �ñ�� ������"  http://www.kma.go.kr
     4 mail@mail.com   �մ���   �Һ� ���ù����̳׿�, ��� ���� ����      http://www.kma.go.kr
     5 mail@mail.com   �մ���   WHO����� "�б�, �����簳 ���� ����ؾ�" 

     
6. �н����� �˻�
   - COUNT(): �߻��� ���ڵ��� ���� ���, ���ڵ尡 ������ 0 ���

SELECT COUNT(passwd) as cnt
FROM pds5
WHERE bbsno = 1 AND passwd='123';

 cnt
 ---
   1

   
7. �� ����(U:Update), PK�� ���ڵ带 �����ϴ� ���� ����� ������ �������� 
   �����ϴ� ���� �������� ����. 
    
1) ���ڵ� ����: ip �÷��� �������� ����.
UPDATE pds5
SET rname = '�Ʒι�', email = 'frog@mail.com', content = '�� 1.75%��1.50%�� ���� ����', url = 'http://www.daum.net'
WHERE bbsno = 1;

2) ���� Ȯ��
SELECT bbsno, rname, email, title, content, url
FROM pds5
WHERE bbsno=1; 

 bbsno rname email         title content              url
 ----- ----- ------------- ----- -------------------- -------------------
     1 �Ʒι�   frog@mail.com ���رݸ�  �� 1.75%��1.50%�� ���� ���� http://www.daum.net
     

8. �� ����(D:Delete) 
DELETE FROM pds5
WHERE bbsno=1;

           
9. �˻� �� ���(S:Search List), title �÷��� '����'�̶�  
    �ܾ �� �ִ� ���ڵ� �˻� 
    - ����� ���۽� �˻��� ������� �����ϸ� ��ü ������
      ��ü �˻����� �����ϴ�.
   
    - rname, title, content �÷� ���
  
    - �˻��� ���� �ʴ� ��� 
      SELECT bbsno, email, rname, title, content, passwd, viewcnt, rdate, grpno, indent, ansnum, url, file1, size1, file2, size2, ip 
      FROM pds5
      ORDER BY bbsno DESC;
      
    - �̸� �˻�
      SELECT bbsno, email, rname, title, content, passwd, viewcnt, rdate, grpno, indent, ansnum, url, file1, size1, file2, size2, ip 
      FROM pds5
      WHERE rname LIKE '%�մ���%'
      ORDER BY bbsno DESC;


    - �������� �˻�   
      SELECT bbsno, email, rname, title, content, passwd, viewcnt, rdate, grpno, indent, ansnum, url, file1, size1, file2, size2, ip 
      FROM pds5
      WHERE title LIKE '%���ǻ�%'
      ORDER BY bbsno DESC;


    - �������� �˻�  
      SELECT bbsno, email, rname, title, content, passwd, viewcnt, rdate, grpno, indent, ansnum, url, file1, size1, file2, size2, ip 
      FROM pds5
      WHERE content LIKE '%��ũ��%'
      ORDER BY bbsno DESC;



  
10. ����¡
   - ����� ����¡ ������ �ʼ��� �մϴ�.
   
1) �˻��� ��ü ���ڵ� ��
SELECT COUNT(*) as cnt FROM pds5 WHERE title LIKE '%�մ���%';

 cnt
 ---
   3
        
   
2) ����¡
SELECT bbsno, email, rname, title, content, passwd, viewcnt, rdate, grpno, indent, ansnum, url, ip 
FROM pds5
WHERE title LIKE '%�մ���%'
ORDER BY bbsno DESC
LIMIT 0, 5;


----------------------
11. �亯 ���� SQL
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

