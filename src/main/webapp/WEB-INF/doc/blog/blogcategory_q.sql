/**********************************/
/* Table Name: ��α� ī�װ� */
/**********************************/
1. ���̺� ����
DROP TABLE blogcategory;

CREATE TABLE blogcategory(
    blogcategoryno                    MEDIUMINT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '��α�ī�װ���ȣ',
    title                             VARCHAR(50)    NOT NULL COMMENT '����',
    orderno                           SMALLINT(5)    NOT NULL COMMENT '��¼���',
    visible                           CHAR(1)    NOT NULL COMMENT '��¸��',
    ids                               VARCHAR(100)     NOT NULL COMMENT '���ٰ���',
    cnt                               MEDIUMINT(7)     NOT NULL COMMENT '��ϵȱۼ�',
    codeno                            MEDIUMINT(10)    NULL  COMMENT '�ڵ��ȣ',
  FOREIGN KEY (codeno) REFERENCES code (codeno)
) COMMENT='��α� ī�װ�';

2. ���
INSERT INTO blogcategory(codeno, title, orderno, visible, ids, cnt)
VALUES(2, '������ ������', 1, 'Y', 'admin', 0);

INSERT INTO blogcategory(codeno, title, orderno, visible, ids, cnt)
VALUES(2, '����ص� �ɱ��?', 2, 'Y', 'admin', 0);

INSERT INTO blogcategory(codeno, title, orderno, visible, ids, cnt)
VALUES(2, '����� ���� ��', 3, 'Y', 'admin', 0);

INSERT INTO blogcategory(codeno, title, orderno, visible, ids, cnt)
VALUES(2, 'ȭ������ �ݼ���', 4, 'Y', 'admin', 0);


3. ���
SELECT blogcategoryno, codeno, title, orderno, visible, ids, cnt
FROM blogcategory
ORDER BY codeno, orderno;

 blogcategoryno codeno title orderno visible ids   cnt
 -------------- ------ ----- ------- ------- ----- ---
              1      1 JAVA        1 Y       admin   0
              2      1 JAVA        1 Y       admin   0
              3      1 JSP         1 Y       admin   0
              4      2 �޾縲         1 Y       admin   0
              5      2 ķ��          1 Y       admin   0

4. ��ȸ
SELECT blogcategoryno, codeno, title, orderno, visible, ids, cnt
FROM blogcategory
WHERE blogcategoryno = 1;


5. ����
1) �׷�, ����, ����, ���, ���ٰ���, �ۼ��� ����
UPDATE blogcategory
SET codeno='', title = 'Y', orderno=1, visible='Y', ids=''
WHERE blogcategoryno=1;

6. ���� ���
DELETE FROM blogcategory
WHERE blogcategoryno=1;

7. ���� ��� Upgrade
1) ��α� ī�װ� ����
UPDATE blogcategory
SET codeno = 20
WHERE blogcategoryno=1;

2) ��� ������ ����
UPDATE blogcategory
SET orderno = orderno
WHERE blogcategoryno=1;

3) visible �÷��� �Ӽ��� �����ϼ���.
UPDATE blogcategory
SET visible = 'Y'
WHERE blogcategoryno=1;

8.code, blogcategory JOIN
- Foreign ���̺��� �۾� WHERE PK = FK            
SELECT c.sort, t.blogcategoryno, t.codeno, t.title, t.orderno, t.visible, t.ids, t.cnt
FROM code c, blogcategory t
WHERE c.codeno = t.codeno
ORDER BY codeno, orderno;

 sort blogcategoryno codeno title orderno visible ids   cnt
 ---- -------------- ------ ----- ------- ------- ----- ---
 ����                2      1 JSP         1 Y       admin   0
 ����                1      1 JAVA        1 Y       admin   0
 ����                4      2 ķ��          1 Y       admin   0
 ����                3      2 �޾縲         1 Y       admin   0
 ��Ÿ                5      3 Q/A         1 Y       admin   0


