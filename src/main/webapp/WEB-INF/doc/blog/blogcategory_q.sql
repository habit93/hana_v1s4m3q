/**********************************/
/* Table Name: 블로그 카테고리 */
/**********************************/
1. 테이블 생성
DROP TABLE blogcategory;

CREATE TABLE blogcategory(
    blogcategoryno                    MEDIUMINT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '블로그카테고리번호',
    title                             VARCHAR(50)    NOT NULL COMMENT '제목',
    orderno                           SMALLINT(5)    NOT NULL COMMENT '출력순서',
    visible                           CHAR(1)    NOT NULL COMMENT '출력모드',
    ids                               VARCHAR(100)     NOT NULL COMMENT '접근계정',
    cnt                               MEDIUMINT(7)     NOT NULL COMMENT '등록된글수',
    codeno                            MEDIUMINT(10)    NULL  COMMENT '코드번호',
  FOREIGN KEY (codeno) REFERENCES code (codeno)
) COMMENT='블로그 카테고리';

2. 등록
INSERT INTO blogcategory(codeno, title, orderno, visible, ids, cnt)
VALUES(2, '지금은 연애중', 1, 'Y', 'admin', 0);

INSERT INTO blogcategory(codeno, title, orderno, visible, ids, cnt)
VALUES(2, '사랑해도 될까요?', 2, 'Y', 'admin', 0);

INSERT INTO blogcategory(codeno, title, orderno, visible, ids, cnt)
VALUES(2, '헤어진 다음 날', 3, 'Y', 'admin', 0);

INSERT INTO blogcategory(codeno, title, orderno, visible, ids, cnt)
VALUES(2, '화성남과 금성녀', 4, 'Y', 'admin', 0);


3. 목록
SELECT blogcategoryno, codeno, title, orderno, visible, ids, cnt
FROM blogcategory
ORDER BY codeno, orderno;

 blogcategoryno codeno title orderno visible ids   cnt
 -------------- ------ ----- ------- ------- ----- ---
              1      1 JAVA        1 Y       admin   0
              2      1 JAVA        1 Y       admin   0
              3      1 JSP         1 Y       admin   0
              4      2 휴양림         1 Y       admin   0
              5      2 캠핑          1 Y       admin   0

4. 조회
SELECT blogcategoryno, codeno, title, orderno, visible, ids, cnt
FROM blogcategory
WHERE blogcategoryno = 1;


5. 변경
1) 그룹, 제목, 순서, 모드, 접근계정, 글수의 변경
UPDATE blogcategory
SET codeno='', title = 'Y', orderno=1, visible='Y', ids=''
WHERE blogcategoryno=1;

6. 삭제 기능
DELETE FROM blogcategory
WHERE blogcategoryno=1;

7. 변경 기능 Upgrade
1) 블로그 카테고리 변경
UPDATE blogcategory
SET codeno = 20
WHERE blogcategoryno=1;

2) 출력 순서의 변경
UPDATE blogcategory
SET orderno = orderno
WHERE blogcategoryno=1;

3) visible 컬럼의 속성을 변경하세요.
UPDATE blogcategory
SET visible = 'Y'
WHERE blogcategoryno=1;

8.code, blogcategory JOIN
- Foreign 테이블에서 작업 WHERE PK = FK            
SELECT c.sort, t.blogcategoryno, t.codeno, t.title, t.orderno, t.visible, t.ids, t.cnt
FROM code c, blogcategory t
WHERE c.codeno = t.codeno
ORDER BY codeno, orderno;

 sort blogcategoryno codeno title orderno visible ids   cnt
 ---- -------------- ------ ----- ------- ------- ----- ---
 개발                2      1 JSP         1 Y       admin   0
 개발                1      1 JAVA        1 Y       admin   0
 여행                4      2 캠핑          1 Y       admin   0
 여행                3      2 휴양림         1 Y       admin   0
 기타                5      3 Q/A         1 Y       admin   0


