/**********************************/
/* Table Name: ����1���з��ڵ� */
/**********************************/
DROP TABLE shopcode;

CREATE TABLE shopcode(
    codeno                            MEDIUMINT(7)     NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '�ڵ��ȣ',
    code                              VARCHAR(50)    NOT NULL COMMENT '�ڵ峻��'
) COMMENT='����1���з��ڵ�';

���
INSERT INTO shopcode(code)
VALUES ('�Ƿ�');
INSERT INTO shopcode(code)
VALUES ('�����');

���
SELECT codeno, code
FROM shopcode
ORDER BY codeno DESC;

��ȸ
SELECT codeno, code
FROM shopcode
WHERE codeno=1;

����
UPDATE shopcode
SET code=''
WHERE codeno=1;

����
DELETE FROM shopcode
WHERE codeno=1;