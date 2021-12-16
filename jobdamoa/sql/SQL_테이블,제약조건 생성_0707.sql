-- ������� ���̺� ����
CREATE TABLE announcement
(
    ann_num    NUMBER NOT NULL,
    com_num    NUMBER NOT NULL,
    ann_job    VARCHAR2(20) NOT NULL,
    ann_type    VARCHAR2(20) NOT NULL,
    ann_career    VARCHAR2(20) NOT NULL,
    ann_recruit_period    VARCHAR2(50) NOT NULL,
    ann_location    VARCHAR2(20) NOT NULL,
    ann_title    VARCHAR2(100) NOT NULL,
    ann_view    NUMBER NOT NULL,
    ann_del    CHAR(1) DEFAULT 'n' NOT NULL,
    ann_min    NUMBER NOT NULL,
    ann_max    NUMBER NOT NULL,
    ann_contents    VARCHAR2(1000) NOT NULL,
    ann_qualification    VARCHAR2(1000) NOT NULL,
    ann_prime    VARCHAR2(1000) NOT NULL,
    ann_regdate    DATE DEFAULT sysdate NOT NULL
);
-- ������� PK �ε��� ����
CREATE UNIQUE INDEX idx_ann_pk ON announcement
( ann_num );
-- ������� PK ����
ALTER TABLE announcement
 ADD CONSTRAINT ann_pk PRIMARY KEY ( ann_num )
 USING INDEX idx_ann_pk;
-- ������� ������� �������� ����
ALTER TABLE announcement
 ADD CONSTRAINT ann_type_ck CHECK ( ann_type IN ('regular','contract','intern','rest') );
-- ������� ��� �������� ����
ALTER TABLE announcement
 ADD CONSTRAINT ann_career_ck CHECK ( ann_career IN ('new','old','okay') );
-- ������� �Խù� �������� �������� ����(�ʱⰪ n)
ALTER TABLE announcement
 ADD CONSTRAINT ann_del_ck CHECK ( ann_del IN ('y','n') );

-- ���ȸ�� ���̺� ����
CREATE TABLE company
(
    com_num    NUMBER NOT NULL,
    com_id    VARCHAR2(20) NOT NULL,
    com_password    VARCHAR2(20) NOT NULL,
    com_join_date    DATE DEFAULT sysdate NOT NULL,
    com_email    VARCHAR2(30) NOT NULL,
    com_business_num    VARCHAR2(30) NOT NULL,
    com_name    VARCHAR2(20) NOT NULL,
    com_homepage    VARCHAR2(50),
    com_emp_num    NUMBER NOT NULL,
    com_sales    NUMBER NOT NULL,
    com_invalid    CHAR(1) DEFAULT 'n' NOT NULL,
    com_address    VARCHAR2(50) NOT NULL,
    com_pno    VARCHAR2(20) NOT NULL,
    user_dist    CHAR(1) DEFAULT '1' NOT NULL
);
-- ���ȸ�� PK �ε��� ����
CREATE UNIQUE INDEX idx_company_pk ON company
( com_num );
-- ���ȸ�� PK ����
ALTER TABLE company
 ADD CONSTRAINT com_pk PRIMARY KEY ( com_num )
 USING INDEX idx_company_pk;
-- ���ȸ�� UK �ε��� ����
CREATE UNIQUE INDEX idx_company_uk ON company
( com_id ); 
-- ���ȸ�� UK ���� (ID)
ALTER TABLE company
 ADD CONSTRAINT company_uk UNIQUE ( com_id )
 USING INDEX idx_company_uk;
-- ���ȸ�� Ż�𿩺� �������� ����(�ʱⰪ n)
ALTER TABLE company
 ADD CONSTRAINT com_invalid_ck CHECK ( com_invalid IN ('y','n') );

-- ���ã�� ���̺� ����
CREATE TABLE favorites
(
    fav_num    NUMBER NOT NULL,
    mem_num    NUMBER NOT NULL,
    ann_num    NUMBER NOT NULL
);
-- ���ã�� pk �ε��� ����
CREATE UNIQUE INDEX idx_fav_pk ON favorites
( fav_num );
-- ���ã�� pk ����
ALTER TABLE favorites
 ADD CONSTRAINT fav_pk PRIMARY KEY ( fav_num )
 USING INDEX idx_fav_pk;

-- ������ ���̺� ����
CREATE TABLE manager
(
    manager_id    VARCHAR2(20) NOT NULL,
    manager_password    VARCHAR2(20) NOT NULL,
    user_dist    CHAR(1) DEFAULT '2' NOT NULL,
    manager_num    NUMBER NOT NULL
);
-- ������ pk �ε��� ����
CREATE UNIQUE INDEX idx_manager_pk ON manager
( manager_num );
-- ������ pk ����
ALTER TABLE manager
 ADD CONSTRAINT manager_pk PRIMARY KEY ( manager_num )
 USING INDEX idx_manager_pk;
-- ������ uk �ε��� ����
CREATE UNIQUE INDEX idx_manager_uk ON manager
( manager_id );
-- ������ uk ����
ALTER TABLE manager
 ADD CONSTRAINT manager_UK UNIQUE ( manager_id )
 USING INDEX idx_manager_uk;

-- ȸ�� ���̺� ����
CREATE TABLE member
(
    mem_num    NUMBER NOT NULL,
    mem_id    VARCHAR2(20) NOT NULL,
    mem_password    VARCHAR2(20) NOT NULL,
    mem_nickname    VARCHAR2(20) NOT NULL,
    mem_join_date    DATE DEFAULT sysdate NOT NULL,
    mem_email    VARCHAR2(30) NOT NULL,
    mem_invalid    CHAR(1) DEFAULT 'n' NOT NULL,
    user_dist    CHAR(1) DEFAULT '0' NOT NULL
);
-- ȸ�� pk �ε��� ����
CREATE UNIQUE INDEX idx_mem_pk ON member
( mem_num );
-- ȸ�� pk ����
ALTER TABLE member
 ADD CONSTRAINT mem_pk PRIMARY KEY ( mem_num )
 USING INDEX idx_mem_pk;
-- ȸ�� uk �ε��� ����
CREATE UNIQUE INDEX idx_mem_uk ON member
( mem_id );
-- ȸ�� uk ����
ALTER TABLE member
 ADD CONSTRAINT mem_uk UNIQUE ( mem_id )
 USING INDEX idx_mem_uk;
-- ȸ�� Ż�𿩺�?�������� ����(�ʱⰪ n)
ALTER TABLE member
 ADD CONSTRAINT mem_invalid_ck CHECK ( mem_invalid IN ('y','n') );

-- ���ã��_��ũ�� ���̺� ����
CREATE TABLE scrap
(
    scrap_num    NUMBER NOT NULL,
    mem_num    NUMBER NOT NULL,
    scrap_title    VARCHAR2(100) NOT NULL,
    scrap_company    VARCHAR2(20) NOT NULL,
    scrap_location    VARCHAR2(20) NOT NULL,
    scrap_career    VARCHAR2(20) NOT NULL,
    scrap_link    VARCHAR2(100) NOT NULL
);
-- ���ã��_��ũ�� pk �ε��� ����
CREATE UNIQUE INDEX idx_scrap_pk ON scrap
( scrap_num );
-- ���ã��_��ũ�� pk ����
ALTER TABLE scrap
 ADD CONSTRAINT scrap_pk PRIMARY KEY ( scrap_num )
 USING INDEX idx_scrap_pk;