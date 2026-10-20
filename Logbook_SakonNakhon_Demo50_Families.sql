/* ข้อมูลสมมุติ 50 ครัวเรือนในจังหวัดสกลนคร พร้อมสมาชิกครอบครัว */
/* ใช้กับโครงสร้าง dbo.Beneficiaries และ dbo.HouseholdMembers ของ LogbookSqlServer */
/* รันซ้ำได้: ใช้ Notes marker DEMO_SAKON_20261020 ป้องกันข้อมูลชุดนี้ซ้ำ */
USE [LogbookDb];
GO
SET NOCOUNT ON;
SET XACT_ABORT ON;
IF OBJECT_ID(N'dbo.Beneficiaries',N'U') IS NULL THROW 50001,N'ไม่พบ dbo.Beneficiaries กรุณาสร้างตารางตามโครงสร้างโปรเจกต์ก่อน',1;
IF OBJECT_ID(N'dbo.HouseholdMembers',N'U') IS NULL THROW 50002,N'ไม่พบ dbo.HouseholdMembers กรุณาสร้างตารางตามโครงสร้างโปรเจกต์ก่อน',1;
BEGIN TRANSACTION;
DECLARE @Map TABLE (DemoKey NVARCHAR(30) PRIMARY KEY, BeneficiaryId INT);

IF NOT EXISTS (SELECT 1 FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_001%')
BEGIN
    INSERT INTO dbo.Beneficiaries (CitizenId,FullName,Age,Vulnerability,Subdistrict,District,Province,Agency,AnnualBudget,HouseholdIncome,HouseholdMembers,AssistanceStatus,Notes,CreatedAt,UpdatedAt)
    VALUES (NULL,N'สมชาย ใจดี',67,N'ผู้สูงอายุ',N'ธาตุเชิงชุม',N'เมืองสกลนคร',N'สกลนคร',N'หน่วยงานพัฒนาสังคมจังหวัดสกลนคร',128000000,4200,2,N'รอประเมิน',N'DEMO_SAKON_001 | ข้อมูลสมมุติเพื่อทดสอบระบบเท่านั้น',SYSDATETIME(),SYSDATETIME());
END;
INSERT INTO @Map (DemoKey,BeneficiaryId) SELECT N'DEMO_SAKON_001',Id FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_001%';

IF NOT EXISTS (SELECT 1 FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_002%')
BEGIN
    INSERT INTO dbo.Beneficiaries (CitizenId,FullName,Age,Vulnerability,Subdistrict,District,Province,Agency,AnnualBudget,HouseholdIncome,HouseholdMembers,AssistanceStatus,Notes,CreatedAt,UpdatedAt)
    VALUES (NULL,N'สายบัว คำภูมี',72,N'ผู้พิการ',N'งิ้วด่อน',N'เมืองสกลนคร',N'สกลนคร',N'หน่วยงานพัฒนาสังคมจังหวัดสกลนคร',128000000,2800,3,N'อยู่ระหว่างช่วยเหลือ',N'DEMO_SAKON_002 | ข้อมูลสมมุติเพื่อทดสอบระบบเท่านั้น',SYSDATETIME(),SYSDATETIME());
END;
INSERT INTO @Map (DemoKey,BeneficiaryId) SELECT N'DEMO_SAKON_002',Id FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_002%';

IF NOT EXISTS (SELECT 1 FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_003%')
BEGIN
    INSERT INTO dbo.Beneficiaries (CitizenId,FullName,Age,Vulnerability,Subdistrict,District,Province,Agency,AnnualBudget,HouseholdIncome,HouseholdMembers,AssistanceStatus,Notes,CreatedAt,UpdatedAt)
    VALUES (NULL,N'บุญมี พรมสาขา',59,N'ครัวเรือนรายได้น้อย',N'ธาตุนาเวง',N'เมืองสกลนคร',N'สกลนคร',N'หน่วยงานพัฒนาสังคมจังหวัดสกลนคร',128000000,3500,3,N'ดำเนินการแล้ว',N'DEMO_SAKON_003 | ข้อมูลสมมุติเพื่อทดสอบระบบเท่านั้น',SYSDATETIME(),SYSDATETIME());
END;
INSERT INTO @Map (DemoKey,BeneficiaryId) SELECT N'DEMO_SAKON_003',Id FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_003%';

IF NOT EXISTS (SELECT 1 FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_004%')
BEGIN
    INSERT INTO dbo.Beneficiaries (CitizenId,FullName,Age,Vulnerability,Subdistrict,District,Province,Agency,AnnualBudget,HouseholdIncome,HouseholdMembers,AssistanceStatus,Notes,CreatedAt,UpdatedAt)
    VALUES (NULL,N'น้อย ไชยบุตร',81,N'ผู้ป่วยติดเตียง',N'ฮางโฮง',N'เมืองสกลนคร',N'สกลนคร',N'หน่วยงานพัฒนาสังคมจังหวัดสกลนคร',128000000,1800,2,N'รอประเมิน',N'DEMO_SAKON_004 | ข้อมูลสมมุติเพื่อทดสอบระบบเท่านั้น',SYSDATETIME(),SYSDATETIME());
END;
INSERT INTO @Map (DemoKey,BeneficiaryId) SELECT N'DEMO_SAKON_004',Id FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_004%';

IF NOT EXISTS (SELECT 1 FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_005%')
BEGIN
    INSERT INTO dbo.Beneficiaries (CitizenId,FullName,Age,Vulnerability,Subdistrict,District,Province,Agency,AnnualBudget,HouseholdIncome,HouseholdMembers,AssistanceStatus,Notes,CreatedAt,UpdatedAt)
    VALUES (NULL,N'ประเสริฐ อินทร์แปลง',46,N'ผู้สูงอายุ',N'ดงมะไฟ',N'เมืองสกลนคร',N'สกลนคร',N'หน่วยงานพัฒนาสังคมจังหวัดสกลนคร',128000000,5200,4,N'อยู่ระหว่างช่วยเหลือ',N'DEMO_SAKON_005 | ข้อมูลสมมุติเพื่อทดสอบระบบเท่านั้น',SYSDATETIME(),SYSDATETIME());
END;
INSERT INTO @Map (DemoKey,BeneficiaryId) SELECT N'DEMO_SAKON_005',Id FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_005%';

IF NOT EXISTS (SELECT 1 FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_006%')
BEGIN
    INSERT INTO dbo.Beneficiaries (CitizenId,FullName,Age,Vulnerability,Subdistrict,District,Province,Agency,AnnualBudget,HouseholdIncome,HouseholdMembers,AssistanceStatus,Notes,CreatedAt,UpdatedAt)
    VALUES (NULL,N'มาลี ศรีสุข',38,N'ผู้พิการ',N'ท่าแร่',N'เมืองสกลนคร',N'สกลนคร',N'หน่วยงานพัฒนาสังคมจังหวัดสกลนคร',128000000,6500,4,N'ดำเนินการแล้ว',N'DEMO_SAKON_006 | ข้อมูลสมมุติเพื่อทดสอบระบบเท่านั้น',SYSDATETIME(),SYSDATETIME());
END;
INSERT INTO @Map (DemoKey,BeneficiaryId) SELECT N'DEMO_SAKON_006',Id FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_006%';

IF NOT EXISTS (SELECT 1 FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_007%')
BEGIN
    INSERT INTO dbo.Beneficiaries (CitizenId,FullName,Age,Vulnerability,Subdistrict,District,Province,Agency,AnnualBudget,HouseholdIncome,HouseholdMembers,AssistanceStatus,Notes,CreatedAt,UpdatedAt)
    VALUES (NULL,N'คำปุ่น พรมดี',76,N'ครัวเรือนรายได้น้อย',N'พรรณา',N'พรรณานิคม',N'สกลนคร',N'หน่วยงานพัฒนาสังคมจังหวัดสกลนคร',128000000,2100,2,N'รอประเมิน',N'DEMO_SAKON_007 | ข้อมูลสมมุติเพื่อทดสอบระบบเท่านั้น',SYSDATETIME(),SYSDATETIME());
END;
INSERT INTO @Map (DemoKey,BeneficiaryId) SELECT N'DEMO_SAKON_007',Id FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_007%';

IF NOT EXISTS (SELECT 1 FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_008%')
BEGIN
    INSERT INTO dbo.Beneficiaries (CitizenId,FullName,Age,Vulnerability,Subdistrict,District,Province,Agency,AnnualBudget,HouseholdIncome,HouseholdMembers,AssistanceStatus,Notes,CreatedAt,UpdatedAt)
    VALUES (NULL,N'อุดม แสงคำ',54,N'ผู้ป่วยติดเตียง',N'ช้างมิ่ง',N'พรรณานิคม',N'สกลนคร',N'หน่วยงานพัฒนาสังคมจังหวัดสกลนคร',128000000,4000,3,N'อยู่ระหว่างช่วยเหลือ',N'DEMO_SAKON_008 | ข้อมูลสมมุติเพื่อทดสอบระบบเท่านั้น',SYSDATETIME(),SYSDATETIME());
END;
INSERT INTO @Map (DemoKey,BeneficiaryId) SELECT N'DEMO_SAKON_008',Id FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_008%';

IF NOT EXISTS (SELECT 1 FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_009%')
BEGIN
    INSERT INTO dbo.Beneficiaries (CitizenId,FullName,Age,Vulnerability,Subdistrict,District,Province,Agency,AnnualBudget,HouseholdIncome,HouseholdMembers,AssistanceStatus,Notes,CreatedAt,UpdatedAt)
    VALUES (NULL,N'บุญส่ง คำหล้า',63,N'ผู้สูงอายุ',N'นาหัวบ่อ',N'พรรณานิคม',N'สกลนคร',N'หน่วยงานพัฒนาสังคมจังหวัดสกลนคร',128000000,3000,4,N'ดำเนินการแล้ว',N'DEMO_SAKON_009 | ข้อมูลสมมุติเพื่อทดสอบระบบเท่านั้น',SYSDATETIME(),SYSDATETIME());
END;
INSERT INTO @Map (DemoKey,BeneficiaryId) SELECT N'DEMO_SAKON_009',Id FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_009%';

IF NOT EXISTS (SELECT 1 FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_010%')
BEGIN
    INSERT INTO dbo.Beneficiaries (CitizenId,FullName,Age,Vulnerability,Subdistrict,District,Province,Agency,AnnualBudget,HouseholdIncome,HouseholdMembers,AssistanceStatus,Notes,CreatedAt,UpdatedAt)
    VALUES (NULL,N'ราตรี วงศ์จันทร์',43,N'ผู้พิการ',N'ไร่',N'พรรณานิคม',N'สกลนคร',N'หน่วยงานพัฒนาสังคมจังหวัดสกลนคร',128000000,5800,5,N'รอประเมิน',N'DEMO_SAKON_010 | ข้อมูลสมมุติเพื่อทดสอบระบบเท่านั้น',SYSDATETIME(),SYSDATETIME());
END;
INSERT INTO @Map (DemoKey,BeneficiaryId) SELECT N'DEMO_SAKON_010',Id FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_010%';

IF NOT EXISTS (SELECT 1 FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_011%')
BEGIN
    INSERT INTO dbo.Beneficiaries (CitizenId,FullName,Age,Vulnerability,Subdistrict,District,Province,Agency,AnnualBudget,HouseholdIncome,HouseholdMembers,AssistanceStatus,Notes,CreatedAt,UpdatedAt)
    VALUES (NULL,N'ทองดี บุญมี',70,N'ครัวเรือนรายได้น้อย',N'วาริช',N'วาริชภูมิ',N'สกลนคร',N'หน่วยงานพัฒนาสังคมจังหวัดสกลนคร',128000000,2400,2,N'อยู่ระหว่างช่วยเหลือ',N'DEMO_SAKON_011 | ข้อมูลสมมุติเพื่อทดสอบระบบเท่านั้น',SYSDATETIME(),SYSDATETIME());
END;
INSERT INTO @Map (DemoKey,BeneficiaryId) SELECT N'DEMO_SAKON_011',Id FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_011%';

IF NOT EXISTS (SELECT 1 FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_012%')
BEGIN
    INSERT INTO dbo.Beneficiaries (CitizenId,FullName,Age,Vulnerability,Subdistrict,District,Province,Agency,AnnualBudget,HouseholdIncome,HouseholdMembers,AssistanceStatus,Notes,CreatedAt,UpdatedAt)
    VALUES (NULL,N'สุภาพ แก้วคำ',49,N'ผู้ป่วยติดเตียง',N'ปลาโหล',N'วาริชภูมิ',N'สกลนคร',N'หน่วยงานพัฒนาสังคมจังหวัดสกลนคร',128000000,3900,3,N'ดำเนินการแล้ว',N'DEMO_SAKON_012 | ข้อมูลสมมุติเพื่อทดสอบระบบเท่านั้น',SYSDATETIME(),SYSDATETIME());
END;
INSERT INTO @Map (DemoKey,BeneficiaryId) SELECT N'DEMO_SAKON_012',Id FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_012%';

IF NOT EXISTS (SELECT 1 FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_013%')
BEGIN
    INSERT INTO dbo.Beneficiaries (CitizenId,FullName,Age,Vulnerability,Subdistrict,District,Province,Agency,AnnualBudget,HouseholdIncome,HouseholdMembers,AssistanceStatus,Notes,CreatedAt,UpdatedAt)
    VALUES (NULL,N'คำสิงห์ พรมมา',61,N'ผู้สูงอายุ',N'คำบ่อ',N'วาริชภูมิ',N'สกลนคร',N'หน่วยงานพัฒนาสังคมจังหวัดสกลนคร',128000000,3100,4,N'รอประเมิน',N'DEMO_SAKON_013 | ข้อมูลสมมุติเพื่อทดสอบระบบเท่านั้น',SYSDATETIME(),SYSDATETIME());
END;
INSERT INTO @Map (DemoKey,BeneficiaryId) SELECT N'DEMO_SAKON_013',Id FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_013%';

IF NOT EXISTS (SELECT 1 FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_014%')
BEGIN
    INSERT INTO dbo.Beneficiaries (CitizenId,FullName,Age,Vulnerability,Subdistrict,District,Province,Agency,AnnualBudget,HouseholdIncome,HouseholdMembers,AssistanceStatus,Notes,CreatedAt,UpdatedAt)
    VALUES (NULL,N'ดวงใจ ศรีอุบล',35,N'ผู้พิการ',N'สว่าง',N'สว่างแดนดิน',N'สกลนคร',N'หน่วยงานพัฒนาสังคมจังหวัดสกลนคร',128000000,6200,4,N'อยู่ระหว่างช่วยเหลือ',N'DEMO_SAKON_014 | ข้อมูลสมมุติเพื่อทดสอบระบบเท่านั้น',SYSDATETIME(),SYSDATETIME());
END;
INSERT INTO @Map (DemoKey,BeneficiaryId) SELECT N'DEMO_SAKON_014',Id FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_014%';

IF NOT EXISTS (SELECT 1 FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_015%')
BEGIN
    INSERT INTO dbo.Beneficiaries (CitizenId,FullName,Age,Vulnerability,Subdistrict,District,Province,Agency,AnnualBudget,HouseholdIncome,HouseholdMembers,AssistanceStatus,Notes,CreatedAt,UpdatedAt)
    VALUES (NULL,N'สมพร บุญทัน',78,N'ครัวเรือนรายได้น้อย',N'คำสะอาด',N'สว่างแดนดิน',N'สกลนคร',N'หน่วยงานพัฒนาสังคมจังหวัดสกลนคร',128000000,1900,2,N'ดำเนินการแล้ว',N'DEMO_SAKON_015 | ข้อมูลสมมุติเพื่อทดสอบระบบเท่านั้น',SYSDATETIME(),SYSDATETIME());
END;
INSERT INTO @Map (DemoKey,BeneficiaryId) SELECT N'DEMO_SAKON_015',Id FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_015%';

IF NOT EXISTS (SELECT 1 FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_016%')
BEGIN
    INSERT INTO dbo.Beneficiaries (CitizenId,FullName,Age,Vulnerability,Subdistrict,District,Province,Agency,AnnualBudget,HouseholdIncome,HouseholdMembers,AssistanceStatus,Notes,CreatedAt,UpdatedAt)
    VALUES (NULL,N'วิเชียร คำพา',52,N'ผู้ป่วยติดเตียง',N'โพนสูง',N'สว่างแดนดิน',N'สกลนคร',N'หน่วยงานพัฒนาสังคมจังหวัดสกลนคร',128000000,3600,3,N'รอประเมิน',N'DEMO_SAKON_016 | ข้อมูลสมมุติเพื่อทดสอบระบบเท่านั้น',SYSDATETIME(),SYSDATETIME());
END;
INSERT INTO @Map (DemoKey,BeneficiaryId) SELECT N'DEMO_SAKON_016',Id FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_016%';

IF NOT EXISTS (SELECT 1 FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_017%')
BEGIN
    INSERT INTO dbo.Beneficiaries (CitizenId,FullName,Age,Vulnerability,Subdistrict,District,Province,Agency,AnnualBudget,HouseholdIncome,HouseholdMembers,AssistanceStatus,Notes,CreatedAt,UpdatedAt)
    VALUES (NULL,N'บัวผัน พรมวงศ์',69,N'ผู้สูงอายุ',N'ส่องดาว',N'ส่องดาว',N'สกลนคร',N'หน่วยงานพัฒนาสังคมจังหวัดสกลนคร',128000000,2500,3,N'อยู่ระหว่างช่วยเหลือ',N'DEMO_SAKON_017 | ข้อมูลสมมุติเพื่อทดสอบระบบเท่านั้น',SYSDATETIME(),SYSDATETIME());
END;
INSERT INTO @Map (DemoKey,BeneficiaryId) SELECT N'DEMO_SAKON_017',Id FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_017%';

IF NOT EXISTS (SELECT 1 FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_018%')
BEGIN
    INSERT INTO dbo.Beneficiaries (CitizenId,FullName,Age,Vulnerability,Subdistrict,District,Province,Agency,AnnualBudget,HouseholdIncome,HouseholdMembers,AssistanceStatus,Notes,CreatedAt,UpdatedAt)
    VALUES (NULL,N'กิตติ ศรีบุญเรือง',41,N'ผู้พิการ',N'ท่าศิลา',N'ส่องดาว',N'สกลนคร',N'หน่วยงานพัฒนาสังคมจังหวัดสกลนคร',128000000,7000,5,N'ดำเนินการแล้ว',N'DEMO_SAKON_018 | ข้อมูลสมมุติเพื่อทดสอบระบบเท่านั้น',SYSDATETIME(),SYSDATETIME());
END;
INSERT INTO @Map (DemoKey,BeneficiaryId) SELECT N'DEMO_SAKON_018',Id FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_018%';

IF NOT EXISTS (SELECT 1 FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_019%')
BEGIN
    INSERT INTO dbo.Beneficiaries (CitizenId,FullName,Age,Vulnerability,Subdistrict,District,Province,Agency,AnnualBudget,HouseholdIncome,HouseholdMembers,AssistanceStatus,Notes,CreatedAt,UpdatedAt)
    VALUES (NULL,N'บุญตา อินทร์รักษา',83,N'ครัวเรือนรายได้น้อย',N'พังโคน',N'พังโคน',N'สกลนคร',N'หน่วยงานพัฒนาสังคมจังหวัดสกลนคร',128000000,1600,1,N'รอประเมิน',N'DEMO_SAKON_019 | ข้อมูลสมมุติเพื่อทดสอบระบบเท่านั้น',SYSDATETIME(),SYSDATETIME());
END;
INSERT INTO @Map (DemoKey,BeneficiaryId) SELECT N'DEMO_SAKON_019',Id FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_019%';

IF NOT EXISTS (SELECT 1 FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_020%')
BEGIN
    INSERT INTO dbo.Beneficiaries (CitizenId,FullName,Age,Vulnerability,Subdistrict,District,Province,Agency,AnnualBudget,HouseholdIncome,HouseholdMembers,AssistanceStatus,Notes,CreatedAt,UpdatedAt)
    VALUES (NULL,N'พิมพา วงศ์คำจันทร์',57,N'ผู้ป่วยติดเตียง',N'ไฮหย่อง',N'พังโคน',N'สกลนคร',N'หน่วยงานพัฒนาสังคมจังหวัดสกลนคร',128000000,3200,3,N'อยู่ระหว่างช่วยเหลือ',N'DEMO_SAKON_020 | ข้อมูลสมมุติเพื่อทดสอบระบบเท่านั้น',SYSDATETIME(),SYSDATETIME());
END;
INSERT INTO @Map (DemoKey,BeneficiaryId) SELECT N'DEMO_SAKON_020',Id FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_020%';

IF NOT EXISTS (SELECT 1 FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_021%')
BEGIN
    INSERT INTO dbo.Beneficiaries (CitizenId,FullName,Age,Vulnerability,Subdistrict,District,Province,Agency,AnnualBudget,HouseholdIncome,HouseholdMembers,AssistanceStatus,Notes,CreatedAt,UpdatedAt)
    VALUES (NULL,N'จันทร์เพ็ญ แสนสุข',74,N'ผู้สูงอายุ',N'เจริญศิลป์',N'เจริญศิลป์',N'สกลนคร',N'หน่วยงานพัฒนาสังคมจังหวัดสกลนคร',128000000,2200,2,N'ดำเนินการแล้ว',N'DEMO_SAKON_021 | ข้อมูลสมมุติเพื่อทดสอบระบบเท่านั้น',SYSDATETIME(),SYSDATETIME());
END;
INSERT INTO @Map (DemoKey,BeneficiaryId) SELECT N'DEMO_SAKON_021',Id FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_021%';

IF NOT EXISTS (SELECT 1 FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_022%')
BEGIN
    INSERT INTO dbo.Beneficiaries (CitizenId,FullName,Age,Vulnerability,Subdistrict,District,Province,Agency,AnnualBudget,HouseholdIncome,HouseholdMembers,AssistanceStatus,Notes,CreatedAt,UpdatedAt)
    VALUES (NULL,N'ถาวร บุญเกิด',50,N'ผู้พิการ',N'บ้านโพน',N'โพนนาแก้ว',N'สกลนคร',N'หน่วยงานพัฒนาสังคมจังหวัดสกลนคร',128000000,4100,4,N'รอประเมิน',N'DEMO_SAKON_022 | ข้อมูลสมมุติเพื่อทดสอบระบบเท่านั้น',SYSDATETIME(),SYSDATETIME());
END;
INSERT INTO @Map (DemoKey,BeneficiaryId) SELECT N'DEMO_SAKON_022',Id FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_022%';

IF NOT EXISTS (SELECT 1 FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_023%')
BEGIN
    INSERT INTO dbo.Beneficiaries (CitizenId,FullName,Age,Vulnerability,Subdistrict,District,Province,Agency,AnnualBudget,HouseholdIncome,HouseholdMembers,AssistanceStatus,Notes,CreatedAt,UpdatedAt)
    VALUES (NULL,N'ละไม พรมศรี',44,N'ครัวเรือนรายได้น้อย',N'นาแก้ว',N'โพนนาแก้ว',N'สกลนคร',N'หน่วยงานพัฒนาสังคมจังหวัดสกลนคร',128000000,6000,5,N'อยู่ระหว่างช่วยเหลือ',N'DEMO_SAKON_023 | ข้อมูลสมมุติเพื่อทดสอบระบบเท่านั้น',SYSDATETIME(),SYSDATETIME());
END;
INSERT INTO @Map (DemoKey,BeneficiaryId) SELECT N'DEMO_SAKON_023',Id FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_023%';

IF NOT EXISTS (SELECT 1 FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_024%')
BEGIN
    INSERT INTO dbo.Beneficiaries (CitizenId,FullName,Age,Vulnerability,Subdistrict,District,Province,Agency,AnnualBudget,HouseholdIncome,HouseholdMembers,AssistanceStatus,Notes,CreatedAt,UpdatedAt)
    VALUES (NULL,N'บุญเลิศ คำจันทร์',66,N'ผู้ป่วยติดเตียง',N'กุดบาก',N'กุดบาก',N'สกลนคร',N'หน่วยงานพัฒนาสังคมจังหวัดสกลนคร',128000000,2700,3,N'ดำเนินการแล้ว',N'DEMO_SAKON_024 | ข้อมูลสมมุติเพื่อทดสอบระบบเท่านั้น',SYSDATETIME(),SYSDATETIME());
END;
INSERT INTO @Map (DemoKey,BeneficiaryId) SELECT N'DEMO_SAKON_024',Id FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_024%';

IF NOT EXISTS (SELECT 1 FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_025%')
BEGIN
    INSERT INTO dbo.Beneficiaries (CitizenId,FullName,Age,Vulnerability,Subdistrict,District,Province,Agency,AnnualBudget,HouseholdIncome,HouseholdMembers,AssistanceStatus,Notes,CreatedAt,UpdatedAt)
    VALUES (NULL,N'ศิริพร แก้วมณี',33,N'ผู้สูงอายุ',N'นาม่อง',N'กุดบาก',N'สกลนคร',N'หน่วยงานพัฒนาสังคมจังหวัดสกลนคร',128000000,7300,4,N'รอประเมิน',N'DEMO_SAKON_025 | ข้อมูลสมมุติเพื่อทดสอบระบบเท่านั้น',SYSDATETIME(),SYSDATETIME());
END;
INSERT INTO @Map (DemoKey,BeneficiaryId) SELECT N'DEMO_SAKON_025',Id FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_025%';

IF NOT EXISTS (SELECT 1 FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_026%')
BEGIN
    INSERT INTO dbo.Beneficiaries (CitizenId,FullName,Age,Vulnerability,Subdistrict,District,Province,Agency,AnnualBudget,HouseholdIncome,HouseholdMembers,AssistanceStatus,Notes,CreatedAt,UpdatedAt)
    VALUES (NULL,N'ประจวบ แสงทอง',79,N'ผู้พิการ',N'วานรนิวาส',N'วานรนิวาส',N'สกลนคร',N'หน่วยงานพัฒนาสังคมจังหวัดสกลนคร',128000000,2000,2,N'อยู่ระหว่างช่วยเหลือ',N'DEMO_SAKON_026 | ข้อมูลสมมุติเพื่อทดสอบระบบเท่านั้น',SYSDATETIME(),SYSDATETIME());
END;
INSERT INTO @Map (DemoKey,BeneficiaryId) SELECT N'DEMO_SAKON_026',Id FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_026%';

IF NOT EXISTS (SELECT 1 FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_027%')
BEGIN
    INSERT INTO dbo.Beneficiaries (CitizenId,FullName,Age,Vulnerability,Subdistrict,District,Province,Agency,AnnualBudget,HouseholdIncome,HouseholdMembers,AssistanceStatus,Notes,CreatedAt,UpdatedAt)
    VALUES (NULL,N'คำแพง อินทร์คำ',58,N'ครัวเรือนรายได้น้อย',N'หนองสนม',N'วานรนิวาส',N'สกลนคร',N'หน่วยงานพัฒนาสังคมจังหวัดสกลนคร',128000000,3400,3,N'ดำเนินการแล้ว',N'DEMO_SAKON_027 | ข้อมูลสมมุติเพื่อทดสอบระบบเท่านั้น',SYSDATETIME(),SYSDATETIME());
END;
INSERT INTO @Map (DemoKey,BeneficiaryId) SELECT N'DEMO_SAKON_027',Id FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_027%';

IF NOT EXISTS (SELECT 1 FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_028%')
BEGIN
    INSERT INTO dbo.Beneficiaries (CitizenId,FullName,Age,Vulnerability,Subdistrict,District,Province,Agency,AnnualBudget,HouseholdIncome,HouseholdMembers,AssistanceStatus,Notes,CreatedAt,UpdatedAt)
    VALUES (NULL,N'อารีย์ วงศ์สว่าง',40,N'ผู้ป่วยติดเตียง',N'ธาตุเชิงชุม',N'เมืองสกลนคร',N'สกลนคร',N'หน่วยงานพัฒนาสังคมจังหวัดสกลนคร',128000000,5600,4,N'รอประเมิน',N'DEMO_SAKON_028 | ข้อมูลสมมุติเพื่อทดสอบระบบเท่านั้น',SYSDATETIME(),SYSDATETIME());
END;
INSERT INTO @Map (DemoKey,BeneficiaryId) SELECT N'DEMO_SAKON_028',Id FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_028%';

IF NOT EXISTS (SELECT 1 FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_029%')
BEGIN
    INSERT INTO dbo.Beneficiaries (CitizenId,FullName,Age,Vulnerability,Subdistrict,District,Province,Agency,AnnualBudget,HouseholdIncome,HouseholdMembers,AssistanceStatus,Notes,CreatedAt,UpdatedAt)
    VALUES (NULL,N'สมบัติ พรมจันทร์',71,N'ผู้สูงอายุ',N'งิ้วด่อน',N'เมืองสกลนคร',N'สกลนคร',N'หน่วยงานพัฒนาสังคมจังหวัดสกลนคร',128000000,2300,2,N'อยู่ระหว่างช่วยเหลือ',N'DEMO_SAKON_029 | ข้อมูลสมมุติเพื่อทดสอบระบบเท่านั้น',SYSDATETIME(),SYSDATETIME());
END;
INSERT INTO @Map (DemoKey,BeneficiaryId) SELECT N'DEMO_SAKON_029',Id FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_029%';

IF NOT EXISTS (SELECT 1 FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_030%')
BEGIN
    INSERT INTO dbo.Beneficiaries (CitizenId,FullName,Age,Vulnerability,Subdistrict,District,Province,Agency,AnnualBudget,HouseholdIncome,HouseholdMembers,AssistanceStatus,Notes,CreatedAt,UpdatedAt)
    VALUES (NULL,N'สุรีย์ คำพิมพ์',48,N'ผู้พิการ',N'ธาตุนาเวง',N'เมืองสกลนคร',N'สกลนคร',N'หน่วยงานพัฒนาสังคมจังหวัดสกลนคร',128000000,3800,3,N'ดำเนินการแล้ว',N'DEMO_SAKON_030 | ข้อมูลสมมุติเพื่อทดสอบระบบเท่านั้น',SYSDATETIME(),SYSDATETIME());
END;
INSERT INTO @Map (DemoKey,BeneficiaryId) SELECT N'DEMO_SAKON_030',Id FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_030%';

IF NOT EXISTS (SELECT 1 FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_031%')
BEGIN
    INSERT INTO dbo.Beneficiaries (CitizenId,FullName,Age,Vulnerability,Subdistrict,District,Province,Agency,AnnualBudget,HouseholdIncome,HouseholdMembers,AssistanceStatus,Notes,CreatedAt,UpdatedAt)
    VALUES (NULL,N'มานพ ศรีสกล',62,N'ครัวเรือนรายได้น้อย',N'ฮางโฮง',N'เมืองสกลนคร',N'สกลนคร',N'หน่วยงานพัฒนาสังคมจังหวัดสกลนคร',128000000,2900,3,N'รอประเมิน',N'DEMO_SAKON_031 | ข้อมูลสมมุติเพื่อทดสอบระบบเท่านั้น',SYSDATETIME(),SYSDATETIME());
END;
INSERT INTO @Map (DemoKey,BeneficiaryId) SELECT N'DEMO_SAKON_031',Id FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_031%';

IF NOT EXISTS (SELECT 1 FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_032%')
BEGIN
    INSERT INTO dbo.Beneficiaries (CitizenId,FullName,Age,Vulnerability,Subdistrict,District,Province,Agency,AnnualBudget,HouseholdIncome,HouseholdMembers,AssistanceStatus,Notes,CreatedAt,UpdatedAt)
    VALUES (NULL,N'รำไพ บุญช่วย',37,N'ผู้ป่วยติดเตียง',N'ดงมะไฟ',N'เมืองสกลนคร',N'สกลนคร',N'หน่วยงานพัฒนาสังคมจังหวัดสกลนคร',128000000,6400,4,N'อยู่ระหว่างช่วยเหลือ',N'DEMO_SAKON_032 | ข้อมูลสมมุติเพื่อทดสอบระบบเท่านั้น',SYSDATETIME(),SYSDATETIME());
END;
INSERT INTO @Map (DemoKey,BeneficiaryId) SELECT N'DEMO_SAKON_032',Id FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_032%';

IF NOT EXISTS (SELECT 1 FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_033%')
BEGIN
    INSERT INTO dbo.Beneficiaries (CitizenId,FullName,Age,Vulnerability,Subdistrict,District,Province,Agency,AnnualBudget,HouseholdIncome,HouseholdMembers,AssistanceStatus,Notes,CreatedAt,UpdatedAt)
    VALUES (NULL,N'บุญมี วงศ์ดี',80,N'ผู้สูงอายุ',N'ท่าแร่',N'เมืองสกลนคร',N'สกลนคร',N'หน่วยงานพัฒนาสังคมจังหวัดสกลนคร',128000000,1700,2,N'ดำเนินการแล้ว',N'DEMO_SAKON_033 | ข้อมูลสมมุติเพื่อทดสอบระบบเท่านั้น',SYSDATETIME(),SYSDATETIME());
END;
INSERT INTO @Map (DemoKey,BeneficiaryId) SELECT N'DEMO_SAKON_033',Id FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_033%';

IF NOT EXISTS (SELECT 1 FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_034%')
BEGIN
    INSERT INTO dbo.Beneficiaries (CitizenId,FullName,Age,Vulnerability,Subdistrict,District,Province,Agency,AnnualBudget,HouseholdIncome,HouseholdMembers,AssistanceStatus,Notes,CreatedAt,UpdatedAt)
    VALUES (NULL,N'สุชาติ คำหาญ',53,N'ผู้พิการ',N'พรรณา',N'พรรณานิคม',N'สกลนคร',N'หน่วยงานพัฒนาสังคมจังหวัดสกลนคร',128000000,4300,3,N'รอประเมิน',N'DEMO_SAKON_034 | ข้อมูลสมมุติเพื่อทดสอบระบบเท่านั้น',SYSDATETIME(),SYSDATETIME());
END;
INSERT INTO @Map (DemoKey,BeneficiaryId) SELECT N'DEMO_SAKON_034',Id FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_034%';

IF NOT EXISTS (SELECT 1 FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_035%')
BEGIN
    INSERT INTO dbo.Beneficiaries (CitizenId,FullName,Age,Vulnerability,Subdistrict,District,Province,Agency,AnnualBudget,HouseholdIncome,HouseholdMembers,AssistanceStatus,Notes,CreatedAt,UpdatedAt)
    VALUES (NULL,N'อัมพร แสงจันทร์',45,N'ครัวเรือนรายได้น้อย',N'ช้างมิ่ง',N'พรรณานิคม',N'สกลนคร',N'หน่วยงานพัฒนาสังคมจังหวัดสกลนคร',128000000,5900,5,N'อยู่ระหว่างช่วยเหลือ',N'DEMO_SAKON_035 | ข้อมูลสมมุติเพื่อทดสอบระบบเท่านั้น',SYSDATETIME(),SYSDATETIME());
END;
INSERT INTO @Map (DemoKey,BeneficiaryId) SELECT N'DEMO_SAKON_035',Id FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_035%';

IF NOT EXISTS (SELECT 1 FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_036%')
BEGIN
    INSERT INTO dbo.Beneficiaries (CitizenId,FullName,Age,Vulnerability,Subdistrict,District,Province,Agency,AnnualBudget,HouseholdIncome,HouseholdMembers,AssistanceStatus,Notes,CreatedAt,UpdatedAt)
    VALUES (NULL,N'สมัย พรมศรี',68,N'ผู้ป่วยติดเตียง',N'นาหัวบ่อ',N'พรรณานิคม',N'สกลนคร',N'หน่วยงานพัฒนาสังคมจังหวัดสกลนคร',128000000,2600,2,N'ดำเนินการแล้ว',N'DEMO_SAKON_036 | ข้อมูลสมมุติเพื่อทดสอบระบบเท่านั้น',SYSDATETIME(),SYSDATETIME());
END;
INSERT INTO @Map (DemoKey,BeneficiaryId) SELECT N'DEMO_SAKON_036',Id FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_036%';

IF NOT EXISTS (SELECT 1 FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_037%')
BEGIN
    INSERT INTO dbo.Beneficiaries (CitizenId,FullName,Age,Vulnerability,Subdistrict,District,Province,Agency,AnnualBudget,HouseholdIncome,HouseholdMembers,AssistanceStatus,Notes,CreatedAt,UpdatedAt)
    VALUES (NULL,N'นิตยา คำบุญ',42,N'ผู้สูงอายุ',N'ไร่',N'พรรณานิคม',N'สกลนคร',N'หน่วยงานพัฒนาสังคมจังหวัดสกลนคร',128000000,6100,4,N'รอประเมิน',N'DEMO_SAKON_037 | ข้อมูลสมมุติเพื่อทดสอบระบบเท่านั้น',SYSDATETIME(),SYSDATETIME());
END;
INSERT INTO @Map (DemoKey,BeneficiaryId) SELECT N'DEMO_SAKON_037',Id FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_037%';

IF NOT EXISTS (SELECT 1 FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_038%')
BEGIN
    INSERT INTO dbo.Beneficiaries (CitizenId,FullName,Age,Vulnerability,Subdistrict,District,Province,Agency,AnnualBudget,HouseholdIncome,HouseholdMembers,AssistanceStatus,Notes,CreatedAt,UpdatedAt)
    VALUES (NULL,N'บุญธรรม ศรีสว่าง',75,N'ผู้พิการ',N'วาริช',N'วาริชภูมิ',N'สกลนคร',N'หน่วยงานพัฒนาสังคมจังหวัดสกลนคร',128000000,2100,2,N'อยู่ระหว่างช่วยเหลือ',N'DEMO_SAKON_038 | ข้อมูลสมมุติเพื่อทดสอบระบบเท่านั้น',SYSDATETIME(),SYSDATETIME());
END;
INSERT INTO @Map (DemoKey,BeneficiaryId) SELECT N'DEMO_SAKON_038',Id FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_038%';

IF NOT EXISTS (SELECT 1 FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_039%')
BEGIN
    INSERT INTO dbo.Beneficiaries (CitizenId,FullName,Age,Vulnerability,Subdistrict,District,Province,Agency,AnnualBudget,HouseholdIncome,HouseholdMembers,AssistanceStatus,Notes,CreatedAt,UpdatedAt)
    VALUES (NULL,N'สายฝน อินทร์แก้ว',34,N'ครัวเรือนรายได้น้อย',N'ปลาโหล',N'วาริชภูมิ',N'สกลนคร',N'หน่วยงานพัฒนาสังคมจังหวัดสกลนคร',128000000,6800,5,N'ดำเนินการแล้ว',N'DEMO_SAKON_039 | ข้อมูลสมมุติเพื่อทดสอบระบบเท่านั้น',SYSDATETIME(),SYSDATETIME());
END;
INSERT INTO @Map (DemoKey,BeneficiaryId) SELECT N'DEMO_SAKON_039',Id FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_039%';

IF NOT EXISTS (SELECT 1 FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_040%')
BEGIN
    INSERT INTO dbo.Beneficiaries (CitizenId,FullName,Age,Vulnerability,Subdistrict,District,Province,Agency,AnnualBudget,HouseholdIncome,HouseholdMembers,AssistanceStatus,Notes,CreatedAt,UpdatedAt)
    VALUES (NULL,N'วิเชียร บุญมา',60,N'ผู้ป่วยติดเตียง',N'คำบ่อ',N'วาริชภูมิ',N'สกลนคร',N'หน่วยงานพัฒนาสังคมจังหวัดสกลนคร',128000000,3300,3,N'รอประเมิน',N'DEMO_SAKON_040 | ข้อมูลสมมุติเพื่อทดสอบระบบเท่านั้น',SYSDATETIME(),SYSDATETIME());
END;
INSERT INTO @Map (DemoKey,BeneficiaryId) SELECT N'DEMO_SAKON_040',Id FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_040%';

IF NOT EXISTS (SELECT 1 FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_041%')
BEGIN
    INSERT INTO dbo.Beneficiaries (CitizenId,FullName,Age,Vulnerability,Subdistrict,District,Province,Agency,AnnualBudget,HouseholdIncome,HouseholdMembers,AssistanceStatus,Notes,CreatedAt,UpdatedAt)
    VALUES (NULL,N'ทองใบ คำแสน',77,N'ผู้สูงอายุ',N'สว่าง',N'สว่างแดนดิน',N'สกลนคร',N'หน่วยงานพัฒนาสังคมจังหวัดสกลนคร',128000000,1900,2,N'อยู่ระหว่างช่วยเหลือ',N'DEMO_SAKON_041 | ข้อมูลสมมุติเพื่อทดสอบระบบเท่านั้น',SYSDATETIME(),SYSDATETIME());
END;
INSERT INTO @Map (DemoKey,BeneficiaryId) SELECT N'DEMO_SAKON_041',Id FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_041%';

IF NOT EXISTS (SELECT 1 FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_042%')
BEGIN
    INSERT INTO dbo.Beneficiaries (CitizenId,FullName,Age,Vulnerability,Subdistrict,District,Province,Agency,AnnualBudget,HouseholdIncome,HouseholdMembers,AssistanceStatus,Notes,CreatedAt,UpdatedAt)
    VALUES (NULL,N'ดารณี พรมบุญ',39,N'ผู้พิการ',N'คำสะอาด',N'สว่างแดนดิน',N'สกลนคร',N'หน่วยงานพัฒนาสังคมจังหวัดสกลนคร',128000000,5700,4,N'ดำเนินการแล้ว',N'DEMO_SAKON_042 | ข้อมูลสมมุติเพื่อทดสอบระบบเท่านั้น',SYSDATETIME(),SYSDATETIME());
END;
INSERT INTO @Map (DemoKey,BeneficiaryId) SELECT N'DEMO_SAKON_042',Id FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_042%';

IF NOT EXISTS (SELECT 1 FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_043%')
BEGIN
    INSERT INTO dbo.Beneficiaries (CitizenId,FullName,Age,Vulnerability,Subdistrict,District,Province,Agency,AnnualBudget,HouseholdIncome,HouseholdMembers,AssistanceStatus,Notes,CreatedAt,UpdatedAt)
    VALUES (NULL,N'บุญชู แก้วสกล',65,N'ครัวเรือนรายได้น้อย',N'โพนสูง',N'สว่างแดนดิน',N'สกลนคร',N'หน่วยงานพัฒนาสังคมจังหวัดสกลนคร',128000000,2800,3,N'รอประเมิน',N'DEMO_SAKON_043 | ข้อมูลสมมุติเพื่อทดสอบระบบเท่านั้น',SYSDATETIME(),SYSDATETIME());
END;
INSERT INTO @Map (DemoKey,BeneficiaryId) SELECT N'DEMO_SAKON_043',Id FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_043%';

IF NOT EXISTS (SELECT 1 FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_044%')
BEGIN
    INSERT INTO dbo.Beneficiaries (CitizenId,FullName,Age,Vulnerability,Subdistrict,District,Province,Agency,AnnualBudget,HouseholdIncome,HouseholdMembers,AssistanceStatus,Notes,CreatedAt,UpdatedAt)
    VALUES (NULL,N'สำราญ คำตัน',51,N'ผู้ป่วยติดเตียง',N'ส่องดาว',N'ส่องดาว',N'สกลนคร',N'หน่วยงานพัฒนาสังคมจังหวัดสกลนคร',128000000,3700,4,N'อยู่ระหว่างช่วยเหลือ',N'DEMO_SAKON_044 | ข้อมูลสมมุติเพื่อทดสอบระบบเท่านั้น',SYSDATETIME(),SYSDATETIME());
END;
INSERT INTO @Map (DemoKey,BeneficiaryId) SELECT N'DEMO_SAKON_044',Id FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_044%';

IF NOT EXISTS (SELECT 1 FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_045%')
BEGIN
    INSERT INTO dbo.Beneficiaries (CitizenId,FullName,Age,Vulnerability,Subdistrict,District,Province,Agency,AnnualBudget,HouseholdIncome,HouseholdMembers,AssistanceStatus,Notes,CreatedAt,UpdatedAt)
    VALUES (NULL,N'รจนา ศรีทอง',36,N'ผู้สูงอายุ',N'ท่าศิลา',N'ส่องดาว',N'สกลนคร',N'หน่วยงานพัฒนาสังคมจังหวัดสกลนคร',128000000,6300,5,N'ดำเนินการแล้ว',N'DEMO_SAKON_045 | ข้อมูลสมมุติเพื่อทดสอบระบบเท่านั้น',SYSDATETIME(),SYSDATETIME());
END;
INSERT INTO @Map (DemoKey,BeneficiaryId) SELECT N'DEMO_SAKON_045',Id FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_045%';

IF NOT EXISTS (SELECT 1 FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_046%')
BEGIN
    INSERT INTO dbo.Beneficiaries (CitizenId,FullName,Age,Vulnerability,Subdistrict,District,Province,Agency,AnnualBudget,HouseholdIncome,HouseholdMembers,AssistanceStatus,Notes,CreatedAt,UpdatedAt)
    VALUES (NULL,N'คำหล้า วงศ์พรม',73,N'ผู้พิการ',N'พังโคน',N'พังโคน',N'สกลนคร',N'หน่วยงานพัฒนาสังคมจังหวัดสกลนคร',128000000,2200,2,N'รอประเมิน',N'DEMO_SAKON_046 | ข้อมูลสมมุติเพื่อทดสอบระบบเท่านั้น',SYSDATETIME(),SYSDATETIME());
END;
INSERT INTO @Map (DemoKey,BeneficiaryId) SELECT N'DEMO_SAKON_046',Id FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_046%';

IF NOT EXISTS (SELECT 1 FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_047%')
BEGIN
    INSERT INTO dbo.Beneficiaries (CitizenId,FullName,Age,Vulnerability,Subdistrict,District,Province,Agency,AnnualBudget,HouseholdIncome,HouseholdMembers,AssistanceStatus,Notes,CreatedAt,UpdatedAt)
    VALUES (NULL,N'สุมาลี บุญมา',47,N'ครัวเรือนรายได้น้อย',N'ไฮหย่อง',N'พังโคน',N'สกลนคร',N'หน่วยงานพัฒนาสังคมจังหวัดสกลนคร',128000000,3500,3,N'อยู่ระหว่างช่วยเหลือ',N'DEMO_SAKON_047 | ข้อมูลสมมุติเพื่อทดสอบระบบเท่านั้น',SYSDATETIME(),SYSDATETIME());
END;
INSERT INTO @Map (DemoKey,BeneficiaryId) SELECT N'DEMO_SAKON_047',Id FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_047%';

IF NOT EXISTS (SELECT 1 FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_048%')
BEGIN
    INSERT INTO dbo.Beneficiaries (CitizenId,FullName,Age,Vulnerability,Subdistrict,District,Province,Agency,AnnualBudget,HouseholdIncome,HouseholdMembers,AssistanceStatus,Notes,CreatedAt,UpdatedAt)
    VALUES (NULL,N'ประภา คำดี',70,N'ผู้ป่วยติดเตียง',N'เจริญศิลป์',N'เจริญศิลป์',N'สกลนคร',N'หน่วยงานพัฒนาสังคมจังหวัดสกลนคร',128000000,2500,2,N'ดำเนินการแล้ว',N'DEMO_SAKON_048 | ข้อมูลสมมุติเพื่อทดสอบระบบเท่านั้น',SYSDATETIME(),SYSDATETIME());
END;
INSERT INTO @Map (DemoKey,BeneficiaryId) SELECT N'DEMO_SAKON_048',Id FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_048%';

IF NOT EXISTS (SELECT 1 FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_049%')
BEGIN
    INSERT INTO dbo.Beneficiaries (CitizenId,FullName,Age,Vulnerability,Subdistrict,District,Province,Agency,AnnualBudget,HouseholdIncome,HouseholdMembers,AssistanceStatus,Notes,CreatedAt,UpdatedAt)
    VALUES (NULL,N'อำนวย แสงคำ',55,N'ผู้สูงอายุ',N'บ้านโพน',N'โพนนาแก้ว',N'สกลนคร',N'หน่วยงานพัฒนาสังคมจังหวัดสกลนคร',128000000,3900,4,N'รอประเมิน',N'DEMO_SAKON_049 | ข้อมูลสมมุติเพื่อทดสอบระบบเท่านั้น',SYSDATETIME(),SYSDATETIME());
END;
INSERT INTO @Map (DemoKey,BeneficiaryId) SELECT N'DEMO_SAKON_049',Id FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_049%';

IF NOT EXISTS (SELECT 1 FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_050%')
BEGIN
    INSERT INTO dbo.Beneficiaries (CitizenId,FullName,Age,Vulnerability,Subdistrict,District,Province,Agency,AnnualBudget,HouseholdIncome,HouseholdMembers,AssistanceStatus,Notes,CreatedAt,UpdatedAt)
    VALUES (NULL,N'เดือน พรมวงศ์',32,N'ผู้พิการ',N'นาแก้ว',N'โพนนาแก้ว',N'สกลนคร',N'หน่วยงานพัฒนาสังคมจังหวัดสกลนคร',128000000,6600,5,N'อยู่ระหว่างช่วยเหลือ',N'DEMO_SAKON_050 | ข้อมูลสมมุติเพื่อทดสอบระบบเท่านั้น',SYSDATETIME(),SYSDATETIME());
END;
INSERT INTO @Map (DemoKey,BeneficiaryId) SELECT N'DEMO_SAKON_050',Id FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_050%';

/* สร้างสมาชิกครอบครัวสมมุติ 2-4 คนต่อครัวเรือน; ไม่ใส่ข้อมูลสมาชิกซ้ำเมื่อรันซ้ำ */
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_001_F1 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 01-01',N'คู่สมรส',52,N'ค้าขาย/รับจ้าง',0,N'DEMO_SAKON_001_F1 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_001';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_001_F2 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 01-02',N'บุตร',91,N'นักเรียน/นักศึกษา',2500,N'DEMO_SAKON_001_F2 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_001';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_002_F1 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 02-01',N'คู่สมรส',57,N'ค้าขาย/รับจ้าง',0,N'DEMO_SAKON_002_F1 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_002';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_002_F2 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 02-02',N'บุตร',96,N'นักเรียน/นักศึกษา',2500,N'DEMO_SAKON_002_F2 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_002';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_003_F1 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 03-01',N'คู่สมรส',44,N'ค้าขาย/รับจ้าง',0,N'DEMO_SAKON_003_F1 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_003';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_003_F2 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 03-02',N'บุตร',83,N'นักเรียน/นักศึกษา',2500,N'DEMO_SAKON_003_F2 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_003';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_003_F3 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 03-03',N'บุตร',95,N'รับจ้างทั่วไป',6500,N'DEMO_SAKON_003_F3 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_003';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_004_F1 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 04-01',N'คู่สมรส',66,N'ค้าขาย/รับจ้าง',0,N'DEMO_SAKON_004_F1 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_004';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_004_F2 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 04-02',N'บุตร',105,N'นักเรียน/นักศึกษา',2500,N'DEMO_SAKON_004_F2 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_004';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_005_F1 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 05-01',N'คู่สมรส',31,N'ค้าขาย/รับจ้าง',0,N'DEMO_SAKON_005_F1 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_005';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_005_F2 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 05-02',N'บุตร',70,N'นักเรียน/นักศึกษา',2500,N'DEMO_SAKON_005_F2 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_005';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_006_F1 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 06-01',N'คู่สมรส',23,N'ค้าขาย/รับจ้าง',0,N'DEMO_SAKON_006_F1 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_006';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_006_F2 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 06-02',N'บุตร',62,N'นักเรียน/นักศึกษา',2500,N'DEMO_SAKON_006_F2 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_006';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_006_F3 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 06-03',N'บุตร',74,N'รับจ้างทั่วไป',6500,N'DEMO_SAKON_006_F3 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_006';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_007_F1 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 07-01',N'คู่สมรส',61,N'ค้าขาย/รับจ้าง',0,N'DEMO_SAKON_007_F1 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_007';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_007_F2 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 07-02',N'บุตร',100,N'นักเรียน/นักศึกษา',2500,N'DEMO_SAKON_007_F2 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_007';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_007_F3 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 07-03',N'บุตร',112,N'รับจ้างทั่วไป',6500,N'DEMO_SAKON_007_F3 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_007';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_008_F1 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 08-01',N'คู่สมรส',39,N'ค้าขาย/รับจ้าง',0,N'DEMO_SAKON_008_F1 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_008';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_008_F2 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 08-02',N'บุตร',78,N'นักเรียน/นักศึกษา',2500,N'DEMO_SAKON_008_F2 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_008';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_009_F1 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 09-01',N'คู่สมรส',48,N'ค้าขาย/รับจ้าง',0,N'DEMO_SAKON_009_F1 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_009';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_009_F2 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 09-02',N'บุตร',87,N'นักเรียน/นักศึกษา',2500,N'DEMO_SAKON_009_F2 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_009';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_009_F3 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 09-03',N'บุตร',99,N'รับจ้างทั่วไป',6500,N'DEMO_SAKON_009_F3 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_009';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_010_F1 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 10-01',N'คู่สมรส',28,N'ค้าขาย/รับจ้าง',0,N'DEMO_SAKON_010_F1 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_010';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_010_F2 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 10-02',N'บุตร',67,N'นักเรียน/นักศึกษา',2500,N'DEMO_SAKON_010_F2 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_010';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_011_F1 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 11-01',N'คู่สมรส',55,N'ค้าขาย/รับจ้าง',0,N'DEMO_SAKON_011_F1 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_011';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_011_F2 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 11-02',N'บุตร',94,N'นักเรียน/นักศึกษา',2500,N'DEMO_SAKON_011_F2 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_011';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_012_F1 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 12-01',N'คู่สมรส',34,N'ค้าขาย/รับจ้าง',0,N'DEMO_SAKON_012_F1 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_012';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_012_F2 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 12-02',N'บุตร',73,N'นักเรียน/นักศึกษา',2500,N'DEMO_SAKON_012_F2 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_012';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_012_F3 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 12-03',N'บุตร',85,N'รับจ้างทั่วไป',6500,N'DEMO_SAKON_012_F3 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_012';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_013_F1 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 13-01',N'คู่สมรส',46,N'ค้าขาย/รับจ้าง',0,N'DEMO_SAKON_013_F1 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_013';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_013_F2 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 13-02',N'บุตร',85,N'นักเรียน/นักศึกษา',2500,N'DEMO_SAKON_013_F2 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_013';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_014_F1 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 14-01',N'คู่สมรส',20,N'ค้าขาย/รับจ้าง',0,N'DEMO_SAKON_014_F1 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_014';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_014_F2 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 14-02',N'บุตร',59,N'นักเรียน/นักศึกษา',2500,N'DEMO_SAKON_014_F2 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_014';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_014_F3 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 14-03',N'บุตร',71,N'รับจ้างทั่วไป',6500,N'DEMO_SAKON_014_F3 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_014';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_015_F1 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 15-01',N'คู่สมรส',63,N'ค้าขาย/รับจ้าง',0,N'DEMO_SAKON_015_F1 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_015';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_015_F2 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 15-02',N'บุตร',102,N'นักเรียน/นักศึกษา',2500,N'DEMO_SAKON_015_F2 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_015';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_015_F3 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 15-03',N'บุตร',114,N'รับจ้างทั่วไป',6500,N'DEMO_SAKON_015_F3 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_015';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_016_F1 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 16-01',N'คู่สมรส',37,N'ค้าขาย/รับจ้าง',0,N'DEMO_SAKON_016_F1 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_016';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_016_F2 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 16-02',N'บุตร',76,N'นักเรียน/นักศึกษา',2500,N'DEMO_SAKON_016_F2 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_016';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_017_F1 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 17-01',N'คู่สมรส',54,N'ค้าขาย/รับจ้าง',0,N'DEMO_SAKON_017_F1 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_017';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_017_F2 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 17-02',N'บุตร',93,N'นักเรียน/นักศึกษา',2500,N'DEMO_SAKON_017_F2 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_017';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_018_F1 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 18-01',N'คู่สมรส',26,N'ค้าขาย/รับจ้าง',0,N'DEMO_SAKON_018_F1 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_018';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_018_F2 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 18-02',N'บุตร',65,N'นักเรียน/นักศึกษา',2500,N'DEMO_SAKON_018_F2 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_018';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_018_F3 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 18-03',N'บุตร',77,N'รับจ้างทั่วไป',6500,N'DEMO_SAKON_018_F3 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_018';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_019_F1 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 19-01',N'คู่สมรส',68,N'ค้าขาย/รับจ้าง',0,N'DEMO_SAKON_019_F1 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_019';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_019_F2 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 19-02',N'บุตร',107,N'นักเรียน/นักศึกษา',2500,N'DEMO_SAKON_019_F2 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_019';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_020_F1 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 20-01',N'คู่สมรส',42,N'ค้าขาย/รับจ้าง',0,N'DEMO_SAKON_020_F1 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_020';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_020_F2 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 20-02',N'บุตร',81,N'นักเรียน/นักศึกษา',2500,N'DEMO_SAKON_020_F2 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_020';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_021_F1 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 21-01',N'คู่สมรส',59,N'ค้าขาย/รับจ้าง',0,N'DEMO_SAKON_021_F1 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_021';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_021_F2 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 21-02',N'บุตร',98,N'นักเรียน/นักศึกษา',2500,N'DEMO_SAKON_021_F2 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_021';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_021_F3 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 21-03',N'บุตร',110,N'รับจ้างทั่วไป',6500,N'DEMO_SAKON_021_F3 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_021';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_021_F4 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 21-04',N'หลาน',122,N'นักเรียน',4500,N'DEMO_SAKON_021_F4 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_021';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_022_F1 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 22-01',N'คู่สมรส',35,N'ค้าขาย/รับจ้าง',0,N'DEMO_SAKON_022_F1 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_022';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_022_F2 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 22-02',N'บุตร',74,N'นักเรียน/นักศึกษา',2500,N'DEMO_SAKON_022_F2 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_022';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_023_F1 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 23-01',N'คู่สมรส',29,N'ค้าขาย/รับจ้าง',0,N'DEMO_SAKON_023_F1 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_023';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_023_F2 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 23-02',N'บุตร',68,N'นักเรียน/นักศึกษา',2500,N'DEMO_SAKON_023_F2 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_023';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_024_F1 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 24-01',N'คู่สมรส',51,N'ค้าขาย/รับจ้าง',0,N'DEMO_SAKON_024_F1 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_024';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_024_F2 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 24-02',N'บุตร',90,N'นักเรียน/นักศึกษา',2500,N'DEMO_SAKON_024_F2 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_024';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_024_F3 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 24-03',N'บุตร',102,N'รับจ้างทั่วไป',6500,N'DEMO_SAKON_024_F3 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_024';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_025_F1 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 25-01',N'คู่สมรส',18,N'ค้าขาย/รับจ้าง',0,N'DEMO_SAKON_025_F1 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_025';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_025_F2 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 25-02',N'บุตร',57,N'นักเรียน/นักศึกษา',2500,N'DEMO_SAKON_025_F2 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_025';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_026_F1 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 26-01',N'คู่สมรส',64,N'ค้าขาย/รับจ้าง',0,N'DEMO_SAKON_026_F1 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_026';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_026_F2 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 26-02',N'บุตร',103,N'นักเรียน/นักศึกษา',2500,N'DEMO_SAKON_026_F2 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_026';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_027_F1 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 27-01',N'คู่สมรส',43,N'ค้าขาย/รับจ้าง',0,N'DEMO_SAKON_027_F1 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_027';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_027_F2 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 27-02',N'บุตร',82,N'นักเรียน/นักศึกษา',2500,N'DEMO_SAKON_027_F2 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_027';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_027_F3 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 27-03',N'บุตร',94,N'รับจ้างทั่วไป',6500,N'DEMO_SAKON_027_F3 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_027';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_028_F1 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 28-01',N'คู่สมรส',25,N'ค้าขาย/รับจ้าง',0,N'DEMO_SAKON_028_F1 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_028';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_028_F2 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 28-02',N'บุตร',64,N'นักเรียน/นักศึกษา',2500,N'DEMO_SAKON_028_F2 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_028';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_028_F3 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 28-03',N'บุตร',76,N'รับจ้างทั่วไป',6500,N'DEMO_SAKON_028_F3 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_028';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_029_F1 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 29-01',N'คู่สมรส',56,N'ค้าขาย/รับจ้าง',0,N'DEMO_SAKON_029_F1 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_029';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_029_F2 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 29-02',N'บุตร',95,N'นักเรียน/นักศึกษา',2500,N'DEMO_SAKON_029_F2 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_029';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_030_F1 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 30-01',N'คู่สมรส',33,N'ค้าขาย/รับจ้าง',0,N'DEMO_SAKON_030_F1 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_030';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_030_F2 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 30-02',N'บุตร',72,N'นักเรียน/นักศึกษา',2500,N'DEMO_SAKON_030_F2 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_030';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_030_F3 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 30-03',N'บุตร',84,N'รับจ้างทั่วไป',6500,N'DEMO_SAKON_030_F3 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_030';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_031_F1 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 31-01',N'คู่สมรส',47,N'ค้าขาย/รับจ้าง',0,N'DEMO_SAKON_031_F1 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_031';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_031_F2 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 31-02',N'บุตร',86,N'นักเรียน/นักศึกษา',2500,N'DEMO_SAKON_031_F2 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_031';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_032_F1 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 32-01',N'คู่สมรส',22,N'ค้าขาย/รับจ้าง',0,N'DEMO_SAKON_032_F1 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_032';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_032_F2 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 32-02',N'บุตร',61,N'นักเรียน/นักศึกษา',2500,N'DEMO_SAKON_032_F2 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_032';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_033_F1 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 33-01',N'คู่สมรส',65,N'ค้าขาย/รับจ้าง',0,N'DEMO_SAKON_033_F1 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_033';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_033_F2 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 33-02',N'บุตร',104,N'นักเรียน/นักศึกษา',2500,N'DEMO_SAKON_033_F2 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_033';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_033_F3 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 33-03',N'บุตร',116,N'รับจ้างทั่วไป',6500,N'DEMO_SAKON_033_F3 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_033';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_034_F1 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 34-01',N'คู่สมรส',38,N'ค้าขาย/รับจ้าง',0,N'DEMO_SAKON_034_F1 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_034';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_034_F2 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 34-02',N'บุตร',77,N'นักเรียน/นักศึกษา',2500,N'DEMO_SAKON_034_F2 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_034';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_035_F1 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 35-01',N'คู่สมรส',30,N'ค้าขาย/รับจ้าง',0,N'DEMO_SAKON_035_F1 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_035';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_035_F2 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 35-02',N'บุตร',69,N'นักเรียน/นักศึกษา',2500,N'DEMO_SAKON_035_F2 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_035';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_035_F3 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 35-03',N'บุตร',81,N'รับจ้างทั่วไป',6500,N'DEMO_SAKON_035_F3 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_035';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_036_F1 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 36-01',N'คู่สมรส',53,N'ค้าขาย/รับจ้าง',0,N'DEMO_SAKON_036_F1 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_036';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_036_F2 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 36-02',N'บุตร',92,N'นักเรียน/นักศึกษา',2500,N'DEMO_SAKON_036_F2 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_036';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_036_F3 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 36-03',N'บุตร',104,N'รับจ้างทั่วไป',6500,N'DEMO_SAKON_036_F3 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_036';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_037_F1 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 37-01',N'คู่สมรส',27,N'ค้าขาย/รับจ้าง',0,N'DEMO_SAKON_037_F1 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_037';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_037_F2 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 37-02',N'บุตร',66,N'นักเรียน/นักศึกษา',2500,N'DEMO_SAKON_037_F2 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_037';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_038_F1 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 38-01',N'คู่สมรส',60,N'ค้าขาย/รับจ้าง',0,N'DEMO_SAKON_038_F1 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_038';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_038_F2 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 38-02',N'บุตร',99,N'นักเรียน/นักศึกษา',2500,N'DEMO_SAKON_038_F2 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_038';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_039_F1 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 39-01',N'คู่สมรส',19,N'ค้าขาย/รับจ้าง',0,N'DEMO_SAKON_039_F1 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_039';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_039_F2 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 39-02',N'บุตร',58,N'นักเรียน/นักศึกษา',2500,N'DEMO_SAKON_039_F2 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_039';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_039_F3 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 39-03',N'บุตร',70,N'รับจ้างทั่วไป',6500,N'DEMO_SAKON_039_F3 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_039';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_040_F1 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 40-01',N'คู่สมรส',45,N'ค้าขาย/รับจ้าง',0,N'DEMO_SAKON_040_F1 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_040';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_040_F2 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 40-02',N'บุตร',84,N'นักเรียน/นักศึกษา',2500,N'DEMO_SAKON_040_F2 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_040';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_041_F1 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 41-01',N'คู่สมรส',62,N'ค้าขาย/รับจ้าง',0,N'DEMO_SAKON_041_F1 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_041';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_041_F2 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 41-02',N'บุตร',101,N'นักเรียน/นักศึกษา',2500,N'DEMO_SAKON_041_F2 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_041';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_042_F1 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 42-01',N'คู่สมรส',24,N'ค้าขาย/รับจ้าง',0,N'DEMO_SAKON_042_F1 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_042';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_042_F2 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 42-02',N'บุตร',63,N'นักเรียน/นักศึกษา',2500,N'DEMO_SAKON_042_F2 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_042';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_042_F3 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 42-03',N'บุตร',75,N'รับจ้างทั่วไป',6500,N'DEMO_SAKON_042_F3 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_042';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_042_F4 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 42-04',N'หลาน',87,N'นักเรียน',4500,N'DEMO_SAKON_042_F4 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_042';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_043_F1 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 43-01',N'คู่สมรส',50,N'ค้าขาย/รับจ้าง',0,N'DEMO_SAKON_043_F1 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_043';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_043_F2 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 43-02',N'บุตร',89,N'นักเรียน/นักศึกษา',2500,N'DEMO_SAKON_043_F2 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_043';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_044_F1 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 44-01',N'คู่สมรส',36,N'ค้าขาย/รับจ้าง',0,N'DEMO_SAKON_044_F1 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_044';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_044_F2 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 44-02',N'บุตร',75,N'นักเรียน/นักศึกษา',2500,N'DEMO_SAKON_044_F2 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_044';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_045_F1 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 45-01',N'คู่สมรส',21,N'ค้าขาย/รับจ้าง',0,N'DEMO_SAKON_045_F1 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_045';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_045_F2 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 45-02',N'บุตร',60,N'นักเรียน/นักศึกษา',2500,N'DEMO_SAKON_045_F2 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_045';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_045_F3 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 45-03',N'บุตร',72,N'รับจ้างทั่วไป',6500,N'DEMO_SAKON_045_F3 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_045';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_046_F1 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 46-01',N'คู่สมรส',58,N'ค้าขาย/รับจ้าง',0,N'DEMO_SAKON_046_F1 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_046';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_046_F2 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 46-02',N'บุตร',97,N'นักเรียน/นักศึกษา',2500,N'DEMO_SAKON_046_F2 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_046';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_047_F1 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 47-01',N'คู่สมรส',32,N'ค้าขาย/รับจ้าง',0,N'DEMO_SAKON_047_F1 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_047';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_047_F2 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 47-02',N'บุตร',71,N'นักเรียน/นักศึกษา',2500,N'DEMO_SAKON_047_F2 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_047';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_048_F1 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 48-01',N'คู่สมรส',55,N'ค้าขาย/รับจ้าง',0,N'DEMO_SAKON_048_F1 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_048';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_048_F2 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 48-02',N'บุตร',94,N'นักเรียน/นักศึกษา',2500,N'DEMO_SAKON_048_F2 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_048';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_048_F3 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 48-03',N'บุตร',106,N'รับจ้างทั่วไป',6500,N'DEMO_SAKON_048_F3 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_048';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_049_F1 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 49-01',N'คู่สมรส',40,N'ค้าขาย/รับจ้าง',0,N'DEMO_SAKON_049_F1 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_049';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_049_F2 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 49-02',N'บุตร',79,N'นักเรียน/นักศึกษา',2500,N'DEMO_SAKON_049_F2 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_049';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_049_F3 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 49-03',N'บุตร',91,N'รับจ้างทั่วไป',6500,N'DEMO_SAKON_049_F3 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_049';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_050_F1 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 50-01',N'คู่สมรส',17,N'ค้าขาย/รับจ้าง',0,N'DEMO_SAKON_050_F1 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_050';
END;
IF NOT EXISTS (SELECT 1 FROM dbo.HouseholdMembers WHERE Notes=N'DEMO_SAKON_050_F2 | ข้อมูลสมมุติ')
BEGIN
    INSERT INTO dbo.HouseholdMembers (BeneficiaryId,FullName,Relationship,Age,Occupation,MonthlyIncome,Notes,CreatedAt)
    SELECT BeneficiaryId,N'สมาชิกสมมุติ 50-02',N'บุตร',56,N'นักเรียน/นักศึกษา',2500,N'DEMO_SAKON_050_F2 | ข้อมูลสมมุติ',SYSDATETIME() FROM @Map WHERE DemoKey=N'DEMO_SAKON_050';
END;

COMMIT TRANSACTION;
GO

/* ตรวจสอบผลลัพธ์ */
SELECT COUNT(*) AS DemoHouseholds FROM dbo.Beneficiaries WHERE Notes LIKE N'DEMO_SAKON_%';
SELECT b.Id,b.FullName,b.Age,b.Vulnerability,b.Subdistrict,b.District,b.Province,b.HouseholdIncome,b.HouseholdMembers,b.AssistanceStatus
FROM dbo.Beneficiaries b WHERE b.Notes LIKE N'DEMO_SAKON_%' ORDER BY b.Id;

SELECT b.FullName AS HeadOfHousehold, hm.FullName AS FamilyMember, hm.Relationship, hm.Age, hm.Occupation, hm.MonthlyIncome
FROM dbo.HouseholdMembers hm JOIN dbo.Beneficiaries b ON b.Id=hm.BeneficiaryId
WHERE hm.Notes LIKE N'DEMO_SAKON_%' ORDER BY b.Id,hm.Id;
GO

/* ข้อมูลทั้งหมดเป็นข้อมูลสมมุติ ไม่ใช่บุคคลจริง และไม่ควรใช้แทนข้อมูลทางราชการ */