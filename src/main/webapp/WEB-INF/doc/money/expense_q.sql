/**********************************/
/* Table Name: ���� */
/**********************************/
1) ���̺� ����
DROP TABLE expense;


CREATE TABLE expense(
    expenseno                         INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '�����ȣ',
    rdate                             DATE     NOT NULL COMMENT '��¥',
    categoryno                        INT(10)    NULL  COMMENT '���⳻��ī�װ���ȣ',
    expenseitem                       VARCHAR(20)    NOT NULL COMMENT '���⳻��',
    expensemoney                      MEDIUMINT(10)    NOT NULL COMMENT '����ݾ�',
    mno                               INT(10)    NULL  COMMENT '��� ��ȣ',
  FOREIGN KEY (categoryno) REFERENCES category (categoryno),
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='����';

2) ���
INSERT INTO expense(rdate, categoryno, expenseitem, expensemoney, mno)
VALUES('20160222', '1', '�������� 2�κ�', 22000, '1');







3) ���
SELECT * FROM expense;

SELECT expenseno, rdate, categoryno, expenseitem, expensemoney, mno
FROM expense
ORDER BY expenseno DESC;



4) ��ȸ
SELECT expenseno, rdate, categoryno, expenseitem, expensemoney, mno
FROM expense
WHERE expenseno=1;

5) ����
UPDATE expense
SET rdate='', categoryno='', expenseitem='', expensemoney='', mno=''
WHERE expenseno=1;

6) ����
DELETE FROM expense
WHERE expenseno=1;


7.JOIN - Foreign ���̺��� �۾� WHERE PK = FK         
SELECT c.categoryno, c.categorysort, p.expenseno, p.rdate, p.categoryno, p.expenseitem, p.expensemoney, p.mno
FROM category c, expense p
WHERE c.categoryno = p.categoryno
ORDER BY rdate DESC

8. �� ����
SELECT expenseno, SUBSTRING(rdate, 1, 7) as rdate, categoryno, expenseitem, expensemoney, mno
FROM expense 
WHERE SUBSTRING(rdate, 1, 7) = '2016-02'
ORDER BY rdate DESC



