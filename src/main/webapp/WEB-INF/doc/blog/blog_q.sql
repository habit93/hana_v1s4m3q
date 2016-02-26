/**********************************/
/* Table Name: 블로그글 */
/**********************************/
1) 테이블 구조
DROP TABLE blog;

CREATE TABLE blog(
    blogno                            MEDIUMINT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '블로그번호',
    title                             VARCHAR(200)     NOT NULL COMMENT '제목',
    content                           MEDIUMTEXT     NOT NULL COMMENT '내용',
    file                              VARCHAR(20)    NOT NULL COMMENT '썸파일',
    good                              MEDIUMINT(7)     NOT NULL COMMENT '좋아요',
    rdate                             DATETIME     NOT NULL COMMENT '작성시간',
    cnt                               MEDIUMINT(7)     NOT NULL COMMENT '조회수',
    replycnt                          SMALLINT(5)    NOT NULL COMMENT '댓글수',
    blogcategoryno                    MEDIUMINT(10)    NULL  COMMENT '블로그카테고리번호',
    mno                               INT(10)    NULL  COMMENT '멤버 번호',
  FOREIGN KEY (blogcategoryno) REFERENCES blogcategory (blogcategoryno),
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='블로그글';

2) 등록

INSERT INTO blog(title, content, file, good, rdate, cnt, replycnt, blogcategoryno,mno)
VALUES('제목1', '내용1', 'thumb.jpg', 0, now(), 0, 0, 1, 1);

3) 목록
SELECT * FROM blog;

SELECT blogno, title, content, file, good, rdate, cnt, replycnt, blogcategoryno, mno
FROM blog
ORDER BY blogno DESC;

4) 조회
SELECT blogno, title, content, file, good, rdate, cnt, replycnt, blogcategoryno, mno
FROM blog
WHERE blogno=22;

5) 수정
UPDATE blog
SET title='', content='', file=''
WHERE blogno=1;


6) 삭제
DELETE FROM blog
WHERE blogno=1;


7) blog와 blogcategory의 연동
- blog 테이블을 blogcategoryno 컬럼 값으로 분류합니다.
- blogcategoryno 컬럼의 값이 1번인경우
SELECT blogno, title, content, file, good, rdate, cnt, replycnt, blogcategoryno, mno
FROM blog
WHERE blogcategoryno = 1
ORDER BY blogno DESC;
