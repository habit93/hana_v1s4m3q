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
/* Table Name: ���⳻��ī�װ� */
/**********************************/
CREATE TABLE category(
		categoryno                    		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '���⳻��ī�װ���ȣ',
		categorysort                  		VARCHAR(50)		 NOT NULL COMMENT '�з�',
		mno                           		INT(10)		 NULL  COMMENT '��� ��ȣ',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='���⳻��ī�װ�';

/**********************************/
/* Table Name: ���� */
/**********************************/
CREATE TABLE expense(
		expenseno                     		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '�����ȣ',
		rdate                         		DATE		 NOT NULL COMMENT '��¥',
		categoryno                    		INT(10)		 NULL  COMMENT '���⳻��ī�װ���ȣ',
		expenseitem                   		VARCHAR(20)		 NOT NULL COMMENT '���⳻��',
		expensemoney                  		MEDIUMINT(10)		 NOT NULL COMMENT '����ݾ�',
		mno                           		INT(10)		 NULL  COMMENT '��� ��ȣ',
  FOREIGN KEY (categoryno) REFERENCES category (categoryno),
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='����';

/**********************************/
/* Table Name: ���� */
/**********************************/
CREATE TABLE income(
		incomeno                      		INT(10)		 NOT NULL AUTO_INCREMENT COMMENT '���Թ�ȣ',
		rdate                         		DATE		 NOT NULL COMMENT '��¥',
		incomeitem                    		VARCHAR(20)		 NOT NULL COMMENT '���Գ���',
		incomemoney                   		MEDIUMINT(10)		 NOT NULL COMMENT '���Աݾ�',
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
		title                         		VARCHAR(25)		 NOT NULL COMMENT '�̸�',
		price                         		VARCHAR(10)		 NOT NULL COMMENT '����',
		content                       		MEDIUMTEXT		 NOT NULL COMMENT '����',
		thumb                         		VARCHAR(20)		 NULL  COMMENT '������',
		categoryno                    		INT(10)		 NULL  COMMENT 'ī�װ���ȣ',
  FOREIGN KEY (categoryno) REFERENCES shopcategory (categoryno)
) COMMENT='��ǰ';

/**********************************/
/* Table Name: �����亯 */
/**********************************/
CREATE TABLE qa(
		qano                          		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '�����亯��ȣ',
		title                         		VARCHAR(20)		 NOT NULL COMMENT '����',
		content                       		VARCHAR(200)		 NOT NULL COMMENT '����',
		passwd                        		VARCHAR(15)		 NOT NULL COMMENT '�н�����',
		rdate                         		DATE		 NOT NULL COMMENT '�����',
		grpno                         		MEDIUMINT(10)		 DEFAULT 0		 NOT NULL COMMENT '�θ�۹�ȣ',
		indent                        		SMALLINT(10)		 DEFAULT 0		 NOT NULL COMMENT '�亯����',
		ansnum                        		SMALLINT(10)		 DEFAULT 0		 NOT NULL COMMENT '�亯����',
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
		rdate                         		DATE		 NOT NULL COMMENT '�����',
		itemno                        		INT(10)		 NULL  COMMENT '���ǹ�ȣ',
		mno                           		INT(10)		 NULL  COMMENT '��� ��ȣ',
  FOREIGN KEY (itemno) REFERENCES item (itemno),
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='����';

/**********************************/
/* Table Name: ������ */
/**********************************/
CREATE TABLE schedule(
		scheduleno                    		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '�����ٹ�ȣ',
		rdate                         		DATE		 NOT NULL COMMENT '��¥',
		contents                      		VARCHAR(200)		 NOT NULL COMMENT '����',
		mno                           		INT(10)		 NULL  COMMENT '��� ��ȣ',
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='������';

/**********************************/
/* Table Name: ���� ���� */
/**********************************/
CREATE TABLE buy(
		buyno                         		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '���� ��ȣ',
		name                          		VARCHAR(20)		 NOT NULL COMMENT '���� �̸�',
		cnt                           		INT(10)		 NOT NULL COMMENT '����',
		price                         		INT		 NOT NULL COMMENT '����',
		zipcode                       		VARCHAR(10)		 NOT NULL COMMENT '�����ȣ',
		address1                      		VARCHAR(80)		 NOT NULL COMMENT '���ּ�1',
		address2                      		VARCHAR(80)		 NOT NULL COMMENT '���ּ�2',
		date                          		DATETIME		 NOT NULL COMMENT '��¥',
		thumb                         		VARCHAR(20)		 NOT NULL COMMENT '������',
		mno                           		INT(10)		 NULL  COMMENT '��� ��ȣ',
		itemno                        		INT(10)		 NULL  COMMENT '���ǹ�ȣ',
  FOREIGN KEY (mno) REFERENCES member (mno),
  FOREIGN KEY (itemno) REFERENCES item (itemno)
) COMMENT='���� ����';

/**********************************/
/* Table Name: ��α� �ڵ� */
/**********************************/
CREATE TABLE code(
		codeno                        		MEDIUMINT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '�ڵ��ȣ',
		sort                          		VARCHAR(50)		 NOT NULL COMMENT '�з�'
) COMMENT='��α� �ڵ�';

/**********************************/
/* Table Name: ��α� ī�װ� */
/**********************************/
CREATE TABLE blogcategory(
		blogcategoryno                		MEDIUMINT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '��α�ī�װ���ȣ',
		title                         		VARCHAR(50)		 NOT NULL COMMENT '����',
		orderno                       		SMALLINT(5)		 NOT NULL COMMENT '��¼���',
		visible                       		CHAR(1)		 NOT NULL COMMENT '��¸��',
		ids                           		VARCHAR(100)		 NOT NULL COMMENT '���ٰ���',
		cnt                           		MEDIUMINT(7)		 NOT NULL COMMENT '��ϵȱۼ�',
		codeno                        		MEDIUMINT(10)		 NULL  COMMENT '�ڵ��ȣ',
  FOREIGN KEY (codeno) REFERENCES code (codeno)
) COMMENT='��α� ī�װ�';

/**********************************/
/* Table Name: ��αױ� */
/**********************************/
CREATE TABLE blog(
		blogno                        		MEDIUMINT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '��α׹�ȣ',
		title                         		VARCHAR(200)		 NOT NULL COMMENT '����',
		content                       		MEDIUMTEXT		 NOT NULL COMMENT '����',
		file                          		VARCHAR(20)		 NOT NULL COMMENT '������',
		good                          		MEDIUMINT(7)		 NOT NULL COMMENT '���ƿ�',
		rdate                         		DATETIME		 NOT NULL COMMENT '�ۼ��ð�',
		cnt                           		MEDIUMINT(7)		 NOT NULL COMMENT '��ȸ��',
		replycnt                      		SMALLINT(5)		 NOT NULL COMMENT '��ۼ�',
		blogcategoryno                		MEDIUMINT(10)		 NULL  COMMENT '��α�ī�װ���ȣ',
		mno                           		INT(10)		 NULL  COMMENT '��� ��ȣ',
  FOREIGN KEY (blogcategoryno) REFERENCES blogcategory (blogcategoryno),
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='��αױ�';

/**********************************/
/* Table Name: ��α� ��� */
/**********************************/
CREATE TABLE reply(
		replyno                       		MEDIUMINT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '��۹�ȣ',
		content                       		VARCHAR(80)		 NOT NULL COMMENT '����',
		blogno                        		MEDIUMINT(10)		 NULL  COMMENT '��α׹�ȣ',
  FOREIGN KEY (blogno) REFERENCES blog (blogno)
) COMMENT='��α� ���';

/**********************************/
/* Table Name: ����īƮ */
/**********************************/
CREATE TABLE cart(
		cartno                        		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT 'īƮ ��ȣ',
		name                          		VARCHAR(20)		 NOT NULL COMMENT '�����̸�',
		cnt                           		MEDIUMINT(10)		 NOT NULL COMMENT '����',
		price                         		MEDIUMINT(10)		 NOT NULL COMMENT '����',
		thumb                         		VARCHAR(20)		 NOT NULL COMMENT '������',
		itemno                        		INT(10)		 NULL  COMMENT '���� ��ȣ',
		mno                           		INT(10)		 NULL  COMMENT '��� ��ȣ',
  FOREIGN KEY (itemno) REFERENCES item (itemno),
  FOREIGN KEY (mno) REFERENCES member (mno)
) COMMENT='����īƮ';


CREATE INDEX codeno ON blogcategory (codeno);

CREATE INDEX categoryno ON blog (categoryno);

CREATE INDEX boardno ON reply (boardno);

