/**********************************/
/* Table Name: ��α� �ڵ� */
/**********************************/
1. ���̺� ����
DROP TABLE code;

CREATE TABLE code(
    codeno                            MEDIUMINT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '�ڵ��ȣ',
    sort                              VARCHAR(50)    NOT NULL COMMENT '�з�'
) COMMENT='��α� �ڵ�';

2. ���
INSERT INTO code(sort)
VALUES ('����');

INSERT INTO code(sort)
VALUES ('����');
      
3. ���
SELECT * FROM code;

1) ��ü ���
SELECT codeno, sort
FROM code
ORDER BY codeno ASC;

 codeno sort
 ------ ----
      1 ����
      2 ����

4. ����
UPDATE code
SET sort='AAA'
WHERE codeno=1;

5. ����
DELETE FROM code
WHERE codeno=1;

