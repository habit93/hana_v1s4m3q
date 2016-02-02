/**********************************/
/* Table Name: ���� */
/**********************************/
DROP TABLE review;

CREATE TABLE review(
    reviewno                          INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '�����ȣ',
    title                             VARCHAR(20)    NOT NULL COMMENT '���� ����',
    contents                          VARCHAR(800)     NOT NULL COMMENT '���䳻��',
    itemno                              MEDIUMINT    NULL  COMMENT '���ǹ�ȣ',
  FOREIGN KEY (item) REFERENCES item (item)
) COMMENT='����';

���
INSERT INTO review(title, contents, itemno)
VALUES ('����', '����', '���ǹ�ȣ');

���
SELECT reviewno, title, contents, itemno
FROM review
ORDER BY reviewno DESC;

��ȸ
SELECT reviewno, title, content, itemno
FROM review
WHERE reviewno=1;

����
UPDATE review
SET title='', content='', itemno=''
WHERE reviewno=1;

����
DELETE FROM review
WHERE reviewno=1;