/**********************************/
/* Table Name: ���� */
/**********************************/
DROP TABLE calendar;

CREATE TABLE calendar(
    calendarno                        INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '�����ٹ�ȣ',
    rdate                             DATE     NOT NULL COMMENT '��¥',
    label       VARCHAR(20)  NOT NULL, -- �޷¿� ��µ� ���̺�
    title       VARCHAR(100) NOT NULL, -- ����(*) 
    contents                          VARCHAR(200)     NOT NULL COMMENT '����',
    mno                               INT(10)    NULL  COMMENT '��� ��ȣ',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='������';


INSERT INTO calendar(rdate, label, title, contents, mno)
VALUES('2015-02-16', '����', '���� �ȳ��Դϴ�.', '���� �����Դϴ�.',  '1');

-- ��ü ���
SELECT calendarno, rdate, label, title, contents, mno
FROM calendar
ORDER BY calendarno DESC;

-- Ư�� ��¥�� ���
SELECT calendarno, rdate, label
FROM calendar
WHERE rdate = '2015-02-16';

SELECT calendarno, rdate, label
FROM calendar
WHERE substring(rdate, 1, 7) = '2015-02'; -- 2����

-- ��ȸ
SELECT calendarno, rdate, label, title, contents, mno
FROM calendar
WHERE calendarno = 1;

-- ����
UPDATE calendar
SET rdate='', label='', title='', contents=''
WHERE calendarno = 1;

-- ����
DELETE FROM calendar
WHERE calendarno = 1;
