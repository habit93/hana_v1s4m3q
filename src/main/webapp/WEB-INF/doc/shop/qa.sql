/**********************************/
/* Table Name: �����亯 */
/**********************************/
DROP TABLE qa;

CREATE TABLE qa(
    qano                              INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '�����亯��ȣ',
    title                             VARCHAR(20)    NOT NULL COMMENT '����',
    content                           VARCHAR(200)     NOT NULL COMMENT '����',
    itemno                            INT(10)    NULL  COMMENT '���ǹ�ȣ',
  FOREIGN KEY (itemno) REFERENCES item (itemno)
) COMMENT='�����亯';

���
INSERT INTO qa(title, content, itemno)
VALUES ('����', '����', '���ǹ�ȣ');

���
SELECT qano, title, contents, itemno
FROM qa
ORDER BY qano DESC;

��ȸ
SELECT qano, title, content, itemno
FROM qa
WHERE qano=1;

����
UPDATE qa
SET title='', content='', itemno=''
WHERE qano=1;

����
DELETE FROM qa
WHERE qano=1;