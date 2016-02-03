/**********************************/
/* Table Name: ���� */
/**********************************/
1) ���̺� ����
DROP TABLE expense;


CREATE TABLE expense(
    expenseno                         INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '�����ȣ',
    rdate                             DATE     NOT NULL COMMENT '��¥',
    sort                              VARCHAR(10)    NULL  COMMENT '�з�',
    expenseitem                       VARCHAR(20)    NOT NULL COMMENT '���⳻��',
    file1                             VARCHAR(10)    NULL  COMMENT '÷������',
    expensemoney                      MEDIUMINT(10)    NOT NULL COMMENT '����ݾ�',
    categoryno                        INT(10)    NULL  COMMENT '���⳻��ī�װ���ȣ',
    mno                               INT(10)    NULL  COMMENT '��� ��ȣ',
  FOREIGN KEY (categoryno) REFERENCES category (categoryno),
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='����';

2) ���
INSERT INTO expense(rdate, sort, expenseitem, file1, expensemoney, categoryno, mno)
VALUES('20160222', '�ĺ�', '�������� 2�κ�', 'check.jpg', 22000, '1', '1');







3) ���
SELECT * FROM expense;

SELECT expenseno, rdate, sort, expenseitem, file1, expensemoney, categoryno, mno
FROM expense
ORDER BY expenseno DESC;



4) ��ȸ
SELECT expenseno, rdate, sort, expenseitem, file1, expensemoney, categoryno, mno
FROM expense
WHERE expenseno=1;




5) ����
UPDATE expense
SET rdate='', sort='', expenseitem='', file1='', expensemoney='', categoryno='', mno=''
WHERE expenseno=1;


6) ����
DELETE FROM expense
WHERE expenseno=1;


7.JOIN - Foreign ���̺��� �۾� WHERE PK = FK            
SELECT c.categorysort, p.expenseno, p.rdate, p.sort, p.expenseitem, p.file1, p.expensemoney, p.categoryno, p.mno
FROM category c, expense p
WHERE c.categoryno = p.categoryno
ORDER BY categoryno ASC


