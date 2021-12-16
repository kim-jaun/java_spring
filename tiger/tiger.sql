-- id tiger, password 1234
drop table member;
create table member(MB_num number(10) primary key, MB_id VARCHAR2(50) , MB_pw VARCHAR2(20),
 MB_name VARCHAR2(20), MB_regNum VARCHAR2(15),MB_nickName VARCHAR2(30),
 MB_tel VARCHAR2(20),MB_gender CHAR(1), MB_regDate DATE,MB_car CHAR(1), 
 MB_driverConfirm CHAR(1), MB_img VARCHAR2(300), MB_del CHAR(1));
 
 create table apply (AP_num number(10) primary key,AP_picture VARCHAR2(300),
 MB_num number(10) references member(MB_num));
 
 create table vehicle (VH_num number(10) primary key, VH_carNum VARCHAR2(15),
  VH_carName VARCHAR2(50),VH_carYear NUMERIC(4), VH_carType VARCHAR2(1),
  VH_km VARCHAR2(10),VH_insu VARCHAR2(1), VH_carPicture VARCHAR2(300),
  VH_del CHAR(1), MB_num number(10)  references member(MB_num));
  
create table carpool (CP_num number(10) primary key,
CP_regDate DATE, CP_startPoint VARCHAR2(100),
CP_endPoint VARCHAR2(100), CP_startDate DATE,
CP_startTime DATE, CP_duration number(3),
CP_fee number(5), CP_passNum number(2),CP_passNumNow number(2),
CP_genderType CHAR(1),CP_option VARCHAR2(100),
CP_comment VARCHAR2(1000), CP_del CHAR(1),
MB_num number(10)  references member(MB_num));

create table report(RP_num number(10) primary key,
RP_reason CHAR(1), RP_del CHAR(1),MB_num number(10),
MB_numR number(10),CP_num number(10) references carpool(CP_num));

create table review (RV_num number(10) primary key,
 RV_writer number(10),RV_reader number(10),RV_star number(1),
 RV_content VARCHAR2(1000),RSV_num number(10) );
 
create table notice(NT_num number(10) primary key,
 NT_title VARCHAR2(100), NT_regDate DATE, NT_content VARCHAR2(1000),
 NT_del CHAR(1), MB_num number(10) );
 
create table qna (QA_num number(10) primary key,
 QA_title VARCHAR2(100), QA_regDate DATE, QA_content VARCHAR2(1000),
 QA_fileName VARCHAR2(300),QA_ref number(10),QA_refStep number(1),
 QA_reflevel number(1), QA_del CHAR(1),
 MB_num number(10)  references member(MB_num));

create table reservation (RSV_num number(10) primary key,
 RSV_confirm CHAR(1), RSV_mConfirm CHAR(1),
 CP_num number(10) references carpool(CP_num),
 MB_num number(10) references member(MB_num));
 
create table message (MSG_num number(10) primary key,
  MSG_regDate DATE, MSG_content VARCHAR2(1000),MSG_delS CHAR(1),
  MSG_delR CHAR(1), MB_numS number(10), MB_numR number(10));
  
create table favorite(FV_num number(10) primary key,
 MB_numG number(10), 
 MB_numT number(10));
 