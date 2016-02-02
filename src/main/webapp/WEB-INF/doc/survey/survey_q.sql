/**********************************/
/* Table Name: 설문조사 */
/**********************************/
1.테이블 생성
DROP TABLE survey;

CREATE TABLE survey(
    surveyno                          MEDIUMINT(7)     NULL  COMMENT 'surveyno',
    title                             VARCHAR(200)     NOT NULL COMMENT 'title',
    content                           MEDIUMTEXT     NOT NULL COMMENT 'content',
    cnt                               MEDIUMINT(7)     NOT NULL COMMENT 'cnt',
    mno                               INT(10)    NULL  COMMENT '멤버 번호',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='설문조사';