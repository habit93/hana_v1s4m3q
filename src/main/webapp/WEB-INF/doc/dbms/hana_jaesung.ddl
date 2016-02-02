/**********************************/
/* Table Name: 지출내역카테고리 */
/**********************************/
CREATE TABLE category(
		categoryno                    		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '지출내역카테고리번호',
		sort                          		VARCHAR(50)		 NOT NULL COMMENT '분류'
) COMMENT='지출내역카테고리';

/**********************************/
/* Table Name: 지출 */
/**********************************/
CREATE TABLE expense(
		expenseno                     		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '지출번호',
		sort                          		VARCHAR(10)		 NULL  COMMENT '분류',
		expenseitem                   		VARCHAR(20)		 NOT NULL COMMENT '지출내용',
		file1                         		VARCHAR(10)		 NULL  COMMENT '첨부파일',
		expensemoney                  		MEDIUMINT(10)		 NOT NULL COMMENT '지출금액',
		categoryno                    		INT(10)		 NULL  COMMENT '지출내역카테고리번호',
		mno                           		INT(10)		 NULL  COMMENT '멤버 번호',
  FOREIGN KEY (categoryno) REFERENCES category (categoryno),
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='지출';

/**********************************/
/* Table Name: 수입 */
/**********************************/
CREATE TABLE income(
		incomeno                      		INT(10)		 NOT NULL AUTO_INCREMENT COMMENT '수입번호',
		incomeitem                    		VARCHAR(20)		 NOT NULL COMMENT '수입내용',
		incomemoney                   		MEDIUMINT(10)		 NOT NULL COMMENT '수입금액',
		mno                           		INT(10)		 NULL  COMMENT '멤버 번호',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='수입';

/**********************************/
/* Table Name: 스케줄 */
/**********************************/
CREATE TABLE schedule(
		scheduleno                    		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '스케줄번호',
		title                         		VARCHAR(20)		 NOT NULL COMMENT '제목',
		contents                      		VARCHAR(200)		 NOT NULL COMMENT '내용',
		icon                          		VARCHAR(50)		 NOT NULL COMMENT '아이콘',
		mno                           		INT(10)		 NULL  COMMENT '멤버 번호',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='스케줄';


CREATE INDEX codeno ON blogcategory (codeno);

CREATE INDEX categoryno ON board (categoryno);

CREATE INDEX boardno ON reply (boardno);

