/**********************************/
/* Table Name: ���⳻��ī�װ� */
/**********************************/
CREATE TABLE category(
		categoryno                    		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '���⳻��ī�װ���ȣ',
		sort                          		VARCHAR(50)		 NOT NULL COMMENT '�з�'
) COMMENT='���⳻��ī�װ�';

/**********************************/
/* Table Name: ��� */
/**********************************/
CREATE TABLE member(
		mno                           		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '��� ��ȣ',
		id                            		VARCHAR(20)		 NOT NULL COMMENT '���̵�',
		passwd                        		VARCHAR(20)		 NOT NULL COMMENT '�н�����',
		mname                         		VARCHAR(20)		 NOT NULL COMMENT '�̸�',
		nickname                      		VARCHAR(20)		 NOT NULL COMMENT '�г���',
		birthday                      		DATE		 NOT NULL COMMENT '����',
		gender                        		TINYINT(3)		 NOT NULL COMMENT '����',
		admin                         		INT(10)		 DEFAULT 0		 NOT NULL COMMENT '������',
  CONSTRAINT id UNIQUE (id)
) COMMENT='���';
   
/**********************************/
/* Table Name: ���� */
/**********************************/
CREATE TABLE expense(
		expenseno                     		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '�����ȣ',
		sort                          		VARCHAR(10)		 NULL  COMMENT '�з�',
		expenseitem                   		VARCHAR(20)		 NOT NULL COMMENT '���⳻��',
		file1                         		VARCHAR(10)		 NULL  COMMENT '÷������',
		expensemoney                  		MEDIUMINT(10)		 NOT NULL COMMENT '����ݾ�',
		categoryno                    		INT(10)		 NULL  COMMENT '���⳻��ī�װ���ȣ',
		calenderno                    		INT(10)		 NULL  COMMENT '�޷� ��ȣ',
		mno                           		INT(10)		 NULL  COMMENT '��� ��ȣ',
  FOREIGN KEY (categoryno) REFERENCES category (categoryno),
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='����';

/**********************************/
/* Table Name: ���� */
/**********************************/
CREATE TABLE income(
		incomeno                      		INT(10)		 NOT NULL AUTO_INCREMENT COMMENT '���Թ�ȣ',
		incomeitem                    		VARCHAR(20)		 NOT NULL COMMENT '���Գ���',
		incomemoney                   		MEDIUMINT(10)		 NOT NULL COMMENT '���Աݾ�',
		calenderno                    		INT(10)		 NULL  COMMENT '�޷� ��ȣ',
		mno                           		INT(10)		 NULL  COMMENT '��� ��ȣ',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='����';

/**********************************/
/* Table Name: ����1���з��ڵ� */
/**********************************/
CREATE TABLE shopcode(
		codeno                        		MEDIUMINT(7)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '�ڵ��ȣ',
		code                          		VARCHAR(50)		 NOT NULL COMMENT '�ڵ峻��'
) COMMENT='����1���з��ڵ�';

/**********************************/
/* Table Name: 2���з�ī�װ� */
/**********************************/
CREATE TABLE shopcategory(
		categoryno                    		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT 'ī�װ���ȣ',
		category                      		VARCHAR(10)		 NOT NULL COMMENT 'ī�װ�����',
		codeno                        		MEDIUMINT(7)		 NULL  COMMENT '�ڵ��ȣ',
  FOREIGN KEY (codeno) REFERENCES shopcode (codeno)
) COMMENT='2���з�ī�װ�';

/**********************************/
/* Table Name: ��ǰ */
/**********************************/
CREATE TABLE item(
		itemno                        		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '���ǹ�ȣ',
		title                         		VARCHAR(10)		 NOT NULL COMMENT '�̸�',
		price                         		VARCHAR(10)		 NOT NULL COMMENT '����',
		contents                      		VARCHAR(200)		 NOT NULL COMMENT '����',
		categoryno                    		MEDIUMINT(10)		 NULL  COMMENT 'ī�װ���ȣ',
  FOREIGN KEY (categoryno) REFERENCES shopcategory (categoryno)
) COMMENT='��ǰ';

/**********************************/
/* Table Name: �����亯 */
/**********************************/
CREATE TABLE QA(
		qano                          		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '�����亯��ȣ',
		title                         		VARCHAR(20)		 NOT NULL COMMENT '����',
		content                       		VARCHAR(200)		 NOT NULL COMMENT '����',
		itemno                        		INT(10)		 NULL  COMMENT '���ǹ�ȣ',
  FOREIGN KEY (itemno) REFERENCES item (itemno)
) COMMENT='�����亯';

/**********************************/
/* Table Name: ���� */
/**********************************/
CREATE TABLE review(
		reviewno                      		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '�����ȣ',
		title                         		VARCHAR(20)		 NOT NULL COMMENT '��������',
		contents                      		VARCHAR(800)		 NOT NULL COMMENT '���䳻��',
		item                          		MEDIUMINT		 NULL  COMMENT '���ǹ�ȣ',
		itemno                        		INT(10)		 NULL  COMMENT '���ǹ�ȣ',
  FOREIGN KEY (itemno) REFERENCES item (itemno)
) COMMENT='����';

/**********************************/
/* Table Name: ������ */
/**********************************/
CREATE TABLE schedule(
		scheduleno                    		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '�����ٹ�ȣ',
		contents                      		VARCHAR(200)		 NOT NULL COMMENT '����',
		icon                          		VARCHAR(50)		 NOT NULL COMMENT '������',
		calenderno                    		INT(10)		 NULL  COMMENT '�޷� ��ȣ',
		mno                           		INT(10)		 NULL  COMMENT '��� ��ȣ',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='������';

/**********************************/
/* Table Name: ���� ���� */
/**********************************/
CREATE TABLE buy(
		buyno                         		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '���� ��ȣ',
		name                          		VARCHAR(20)		 NOT NULL COMMENT '���� �̸�',
		content                       		VARCHAR(200)		 NOT NULL COMMENT '���� ����',
		mno                           		INT(10)		 NULL  COMMENT '��� ��ȣ',
		itemno                        		INT(10)		 NULL  COMMENT '���ǹ�ȣ',
  FOREIGN KEY (mno) REFERENCES member (mno),
  FOREIGN KEY (itemno) REFERENCES item (itemno)
) COMMENT='���� ����';

/**********************************/
/* Table Name: �Խ��� �ڵ� */
/**********************************/
CREATE TABLE code(
		codeno                        		MEDIUMINT(7)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT 'codeno',
		sort                          		VARCHAR(50)		 NOT NULL COMMENT 'sort'
) COMMENT='�Խ��� �ڵ�';

/**********************************/
/* Table Name: �Խ��� ī�װ� */
/**********************************/
CREATE TABLE blogcategory(
		blogcategoryno                		MEDIUMINT(7)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT 'blogcategoryno',
		title                         		VARCHAR(50)		 NOT NULL COMMENT 'title',
		orderno                       		SMALLINT(5)		 NOT NULL COMMENT 'orderno',
		visible                       		CHAR(1)		 NOT NULL COMMENT 'visible',
		ids                           		VARCHAR(100)		 NOT NULL COMMENT 'ids',
		cnt                           		MEDIUMINT(7)		 NOT NULL COMMENT 'cnt',
		codeno                        		MEDIUMINT(7)		 NULL  COMMENT 'codeno',
  FOREIGN KEY (codeno) REFERENCES code (codeno)
) COMMENT='�Խ��� ī�װ�';

/**********************************/
/* Table Name: �Խ��Ǳ� */
/**********************************/
CREATE TABLE board(
		boardno                       		MEDIUMINT(7)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT 'boardno',
		title                         		VARCHAR(200)		 NOT NULL COMMENT 'title',
		content                       		MEDIUMTEXT		 NOT NULL COMMENT 'content',
		good                          		MEDIUMINT(7)		 NOT NULL COMMENT 'good',
		rdate                         		DATETIME		 NOT NULL COMMENT 'rdate',
		cnt                           		MEDIUMINT(7)		 NOT NULL COMMENT 'cnt',
		replycnt                      		SMALLINT(5)		 NOT NULL COMMENT 'replycnt',
		blogcategoryno                		MEDIUMINT(7)		 NULL  COMMENT 'blogcategoryno',
		mno                           		INT(10)		 NULL  COMMENT '��� ��ȣ',
  FOREIGN KEY (blogcategoryno) REFERENCES blogcategory (blogcategoryno),
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='�Խ��Ǳ�';

/**********************************/
/* Table Name: ��� */
/**********************************/
CREATE TABLE reply(
		replyno                       		MEDIUMINT(7)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT 'replyno',
		content                       		MEDIUMTEXT		 NOT NULL COMMENT 'content',
		boardno                       		MEDIUMINT(7)		 NULL  COMMENT 'boardno',
  FOREIGN KEY (boardno) REFERENCES board (boardno)
) COMMENT='���';

/**********************************/
/* Table Name: �������� */
/**********************************/
CREATE TABLE survey(
		surveyno                      		MEDIUMINT(7)		 NULL  COMMENT 'surveyno',
		title                         		VARCHAR(200)		 NOT NULL COMMENT 'title',
		content                       		MEDIUMTEXT		 NOT NULL COMMENT 'content',
		cnt                           		MEDIUMINT(7)		 NOT NULL COMMENT 'cnt',
		mno                           		INT(10)		 NULL  COMMENT '��� ��ȣ',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='��������';

/**********************************/
/* Table Name: ����īƮ */
/**********************************/
CREATE TABLE cart(
		cartno                        		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT 'īƮ ��ȣ',
		itemno                        		INT(10)		 NULL  COMMENT '���� ��ȣ',
		mno                           		INT(10)		 NULL  COMMENT '��� ��ȣ',
  FOREIGN KEY (itemno) REFERENCES item (itemno),
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='����īƮ';


CREATE INDEX codeno ON blogcategory (codeno);

CREATE INDEX categoryno ON board (categoryno);

CREATE INDEX boardno ON reply (boardno);

