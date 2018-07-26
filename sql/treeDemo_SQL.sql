CREATE SEQUENCE SEQ_QUSERS_ID
MINVALUE 1
MAXVALUE 9999999999999999999999999999
START WITH 1
INCREMENT BY 1;

create table Q_MENU  (
   ID                   VARCHAR2(50)                    not null,
   PID                  VARCHAR2(50),
   TEXT                 VARCHAR2(100),
   URL                  VARCHAR2(100),
   constraint PK_Q_MENU primary key (ID)
);

comment on table Q_MENU is
'�˵���';

comment on column Q_MENU.PID is
'����ID';

comment on column Q_MENU.TEXT is
'����';

comment on column Q_MENU.URL is
'��Ӧ��ַ';

create table Q_USERS  (
   ID                   NUMBER                          not null,
   LNAME                VARCHAR2(50),
   LPASS                VARCHAR2(32),
   RNAME                VARCHAR2(50),   
   constraint PK_Q_USERS primary key (ID)
);

comment on table Q_USERS is
'�û���Ҳ��ְԱ��';

comment on column Q_USERS.LNAME is
'��¼��';

comment on column Q_USERS.LPASS is
'���룬MD5����';

comment on column Q_USERS.RNAME is
'��ʵ����';



--����û���������
INSERT INTO Q_USERS(ID,LNAME,LPASS,RNAME)
VALUES(SEQ_QUSERS_ID.nextval,
'admin',
'21232f297a57a5a743894a0e4a801fc3',
'��������Ա');
COMMIT;

INSERT INTO Q_USERS(ID,LNAME,LPASS,RNAME)
VALUES(SEQ_QUSERS_ID.nextval,'roy',
'd4c285227493531d0577140a1ed03964',
'����һ');
COMMIT;

INSERT INTO Q_USERS(ID,LNAME,LPASS,RNAME)
VALUES(SEQ_QUSERS_ID.nextval,'lily',
'89f288757f4d0693c99b007855fc075e','����');
COMMIT;

--��Ӳ˵���������

--��Ŀ¼
INSERT into Q_MENU
VALUES('L1',null,'��ҵ��������ϵͳ',null);
COMMIT;

--һ���˵�
INSERT INTO Q_MENU
VALUES('L101','L1','�ճ�����',null);
INSERT into Q_MENU
VALUES('L102','L1','����״̬',null);
INSERT INTO Q_MENU
VALUES('L103','L1','��������',null);
INSERT into Q_MENU
VALUES('L104','L1','��������',null);
INSERT into Q_MENU
VALUES('L105','L1','��������',null);
INSERT into Q_MENU
VALUES('L106','L1','ϵͳ����',null);
COMMIT;

--�����˵�
INSERT INTO Q_MENU
VALUES('L10101','L101','������¼','DailyHandle/CarOut_Record.jsp');
INSERT INTO Q_MENU
VALUES('L10102','L101','���ͼ�¼','DailyHandle/Gas_Record.jsp');
INSERT INTO Q_MENU
VALUES('L10103','L101','ά�޼�¼','DailyHandle/Repair_Record.jsp');
INSERT INTO Q_MENU
VALUES('L10104','L101','��Ѽ�¼','DailyHandle/Fees_Record.jsp');
INSERT INTO Q_MENU
VALUES('L10105','L101','������¼','DailyHandle/Maintain_Record.jsp');
INSERT INTO Q_MENU
VALUES('L10106','L101','Υ�¼�¼','DailyHandle/Peccancy_Record.jsp');
INSERT INTO Q_MENU
VALUES('L10107','L101','�¹ʼ�¼','DailyHandle/Accident_Record.jsp');
INSERT INTO Q_MENU
VALUES('L10108','L101','����¼','DailyHandle/Inspection_Record.jsp');
INSERT INTO Q_MENU
VALUES('L10109','L101','���ռ�¼','DailyHandle/Insurance_Record.jsp');
COMMIT;

INSERT INTO Q_MENU
VALUES('L10201','L102','����״̬','CarState/CarState.jsp');
COMMIT;

INSERT INTO Q_MENU
VALUES('L10301','L103','��������','ExpirationReminder/Reminder.jsp');
COMMIT;

INSERT INTO Q_MENU
VALUES('L10401','L104','�������öԱ�','Report/Report_1.jsp');
INSERT INTO Q_MENU
VALUES('L10402','L104','�������÷ֲ�','Report/Report_2.jsp');
COMMIT;

INSERT INTO Q_MENU
VALUES('L10501','L105','ϵͳ�ֵ�','BasicSet/Sys_Dictionary.jsp');
INSERT INTO Q_MENU
VALUES('L10502','L105','��ʻԱ����','BasicSet/Driver_INFO.jsp');
INSERT INTO Q_MENU
VALUES('L10503','L105','������λ','BasicSet/Current_Unit.jsp');
INSERT INTO Q_MENU
VALUES('L10504','L105','��������','BasicSet/Vehicle_File.jsp');
/*INSERT INTO Q_MENU
VALUES('L10505','L105','ְԱ��Ϣ','BasicSet/Employees_INFO.jsp');*/
COMMIT;

INSERT INTO Q_MENU
VALUES('L10601','L106','��ɫ����','SysSet/Role_Management.jsp');
INSERT INTO Q_MENU
VALUES('L10602','L106','�û�����','SysSet/User_Management.jsp');
INSERT INTO Q_MENU
VALUES('L10603','L106','�޸�����','SysSet/Modify_Password.jsp');
COMMIT;