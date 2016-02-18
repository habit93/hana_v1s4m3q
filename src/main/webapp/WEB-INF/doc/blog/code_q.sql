/**********************************/
/* Table Name: 블로그 코드 */
/**********************************/
1. 테이블 생성
DROP TABLE code;

CREATE TABLE code(
    codeno                            MEDIUMINT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '코드번호',
    sort                              VARCHAR(50)    NOT NULL COMMENT '분류'
) COMMENT='블로그 코드';

2. 등록
INSERT INTO code(sort)
VALUES ('개발');

INSERT INTO code(sort)
VALUES ('여행');
      
3. 목록
SELECT * FROM code;

1) 전체 목록
SELECT codeno, sort
FROM code
ORDER BY codeno ASC;

 codeno sort
 ------ ----
      1 개발
      2 여행

4. 수정
UPDATE code
SET sort='AAA'
WHERE codeno=1;

5. 삭제
DELETE FROM code
WHERE codeno=1;

