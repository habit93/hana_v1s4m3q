/**********************************/
/* Table Name: ��αױ� */
/**********************************/
1) ���̺� ����
DROP TABLE blog;

CREATE TABLE blog(
    blogno                            MEDIUMINT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '��α׹�ȣ',
    title                             VARCHAR(200)     NOT NULL COMMENT '����',
    content                           MEDIUMTEXT     NOT NULL COMMENT '����',
    file                              VARCHAR(20)    NOT NULL COMMENT '������',
    good                              MEDIUMINT(7)     NOT NULL COMMENT '���ƿ�',
    rdate                             DATETIME     NOT NULL COMMENT '�ۼ��ð�',
    cnt                               MEDIUMINT(7)     NOT NULL COMMENT '��ȸ��',
    replycnt                          SMALLINT(5)    NOT NULL COMMENT '��ۼ�',
    blogcategoryno                    MEDIUMINT(10)    NULL  COMMENT '��α�ī�װ���ȣ',
    mno                               INT(10)    NULL  COMMENT '��� ��ȣ',
  FOREIGN KEY (blogcategoryno) REFERENCES blogcategory (blogcategoryno),
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='��αױ�';

2) ���

INSERT INTO blog(title, content, file, good, rdate, cnt, replycnt, blogcategoryno,mno)
VALUES('����1', '����1', 'thumb.jpg', 0, now(), 0, 0, 1, 1);

3) ���
SELECT * FROM blog;

SELECT blogno, title, content, file, good, rdate, cnt, replycnt, blogcategoryno, mno
FROM blog
ORDER BY blogno DESC;

4) ��ȸ
SELECT blogno, title, content, file, good, rdate, cnt, replycnt, blogcategoryno, mno
FROM blog
WHERE blogno=22;

5) ����
UPDATE blog
SET title='', content='', file=''
WHERE blogno=1;


6) ����
DELETE FROM blog
WHERE blogno=1;


7) blog�� blogcategory�� ����
- blog ���̺��� blogcategoryno �÷� ������ �з��մϴ�.
- blogcategoryno �÷��� ���� 1���ΰ��
SELECT blogno, title, content, file, good, rdate, cnt, replycnt, blogcategoryno, mno
FROM blog
WHERE blogcategoryno = 1
ORDER BY blogno DESC;
