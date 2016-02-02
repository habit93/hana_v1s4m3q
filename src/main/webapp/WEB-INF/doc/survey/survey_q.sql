/**********************************/
/* Table Name: �������� */
/**********************************/
1.���̺� ����
DROP TABLE survey;

CREATE TABLE survey(
    surveyno                          MEDIUMINT(7)     NULL  COMMENT 'surveyno',
    title                             VARCHAR(200)     NOT NULL COMMENT 'title',
    content                           MEDIUMTEXT     NOT NULL COMMENT 'content',
    cnt                               MEDIUMINT(7)     NOT NULL COMMENT 'cnt',
    mno                               INT(10)    NULL  COMMENT '��� ��ȣ',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='��������';