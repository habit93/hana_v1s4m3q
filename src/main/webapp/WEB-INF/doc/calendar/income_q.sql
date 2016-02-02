/**********************************/
/* Table Name: ���� */
/**********************************/
1) ���̺� ����
DROP TABLE income;


CREATE TABLE income(
    incomeno                          INT(10)    NOT NULL AUTO_INCREMENT COMMENT '���Թ�ȣ',
    incomeitem                        VARCHAR(20)    NOT NULL COMMENT '���Գ���',
    incomemoney                       MEDIUMINT(10)    NOT NULL COMMENT '���Աݾ�',
    mno                               INT(10)    NULL  COMMENT '��� ��ȣ',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='����';


2) ���
INSERT INTO income(incomeitem, incomemoney, mno)
VALUES('����� ���', '12000', '1');




SELECT * FROM income;


3) ���
SELECT * FROM income;

SELECT incomeno, incomeitem, incomemoney, mno
FROM income
ORDER BY mno DESC;




4) ��ȸ
SELECT incomeno, incomeitem, incomemoney, mno
FROM income
WHERE mno=1;



5) ����
UPDATE income
SET incomeitem='', incomemoney=''
WHERE mno=1;


6) ����
DELETE FROM income
WHERE mno=1;





