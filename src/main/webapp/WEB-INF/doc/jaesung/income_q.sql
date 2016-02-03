/**********************************/
/* Table Name: ���� */
/**********************************/
1) ���̺� ����
DROP TABLE income;


CREATE TABLE income(
    incomeno                          INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '���Թ�ȣ',
    rdate                             DATE     NOT NULL COMMENT '��¥',
    incomeitem                        VARCHAR(20)    NOT NULL COMMENT '���Գ���',
    incomemoney                       MEDIUMINT(10)    NOT NULL COMMENT '���Աݾ�',
    mno                               INT(10)    NULL  COMMENT '��� ��ȣ',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='����';


2) ���
INSERT INTO income(rdate, incomeitem, incomemoney, mno)
VALUES('20100510', '���', '12000', '1');


3) ���
SELECT * FROM income;

SELECT incomeno, rdate, incomeitem, incomemoney, mno
FROM income
ORDER BY incomeno DESC;




4) ��ȸ
SELECT incomeno, incomeitem, incomemoney, mno
FROM income
WHERE incomeno=1;



5) ����
UPDATE income
SET incomeitem='132123', incomemoney='123123'
WHERE incomeno=1;


6) ����
DELETE FROM income
WHERE incomeno=1;





