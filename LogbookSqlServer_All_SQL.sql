/*
  LogbookSqlServer - SQL รวมตามโครงสร้างจริงใน ZIP ที่ผู้ใช้ส่งมา
  Target: SQL Server / database LogbookDb
  Tables from Data/LogbookDbContext.cs and Models/*.cs:
    dbo.Users, dbo.Beneficiaries, dbo.BeneficiaryMedia, dbo.HouseholdMembers

  IMPORTANT:
  - ตรวจสอบ Server/Database ก่อน Execute
  - Script นี้สร้างฐานข้อมูลหากไม่มี และสร้างเฉพาะตารางที่ยังไม่มี
  - ไม่ลบตารางหรือข้อมูลเดิม
  - PasswordHash ต้องสร้างด้วย ASP.NET Core PasswordHasher<AppUser> ใน C#;
    ห้ามใส่รหัสผ่านธรรมดาลง PasswordHash
  - รูปจริงเก็บใน wwwroot/uploads/beneficiaries; SQL เก็บเฉพาะ ImagePath/metadata
*/

/* 1) Create database if missing */
USE [master];
GO
IF DB_ID(N'LogbookDb') IS NULL
BEGIN
    CREATE DATABASE [LogbookDb];
END;
GO

USE [LogbookDb];
GO

/* 2) Users - matches Models/AppUser.cs */
IF OBJECT_ID(N'dbo.Users', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.Users
    (
        Id INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Users PRIMARY KEY,
        Username NVARCHAR(MAX) NOT NULL,
        DisplayName NVARCHAR(MAX) NOT NULL,
        Role NVARCHAR(MAX) NOT NULL,
        PasswordHash NVARCHAR(MAX) NOT NULL,
        CreatedAt DATETIME2 NOT NULL
    );
END;
GO
IF OBJECT_ID(N'dbo.Users', N'U') IS NOT NULL
   AND NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id=OBJECT_ID(N'dbo.Users') AND name=N'IX_Users_Username')
BEGIN
    CREATE UNIQUE INDEX IX_Users_Username ON dbo.Users(Username);
END;
GO

/* 3) Beneficiaries - matches Models/Beneficiary.cs */
IF OBJECT_ID(N'dbo.Beneficiaries', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.Beneficiaries
    (
        Id INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Beneficiaries PRIMARY KEY,
        CitizenId NVARCHAR(13) NULL,
        FullName NVARCHAR(200) NOT NULL,
        Age INT NULL,
        Vulnerability NVARCHAR(100) NOT NULL,
        Subdistrict NVARCHAR(100) NULL,
        District NVARCHAR(100) NULL,
        Province NVARCHAR(100) NULL,
        Agency NVARCHAR(200) NULL,
        AnnualBudget DECIMAL(18,2) NULL,
        HouseholdIncome DECIMAL(18,2) NULL,
        HouseholdMembers INT NULL,
        AssistanceStatus NVARCHAR(50) NOT NULL,
        Notes NVARCHAR(2000) NULL,
        CreatedAt DATETIME2 NOT NULL,
        UpdatedAt DATETIME2 NOT NULL
    );
END;
GO
IF OBJECT_ID(N'dbo.Beneficiaries', N'U') IS NOT NULL
   AND NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id=OBJECT_ID(N'dbo.Beneficiaries') AND name=N'IX_Beneficiaries_CitizenId')
BEGIN
    CREATE INDEX IX_Beneficiaries_CitizenId ON dbo.Beneficiaries(CitizenId);
END;
GO

/* 4) BeneficiaryMedia - image metadata, FK to Beneficiaries */
IF OBJECT_ID(N'dbo.BeneficiaryMedia', N'U') IS NULL
BEGIN
    IF OBJECT_ID(N'dbo.Beneficiaries', N'U') IS NULL
        THROW 50001, N'ไม่พบ dbo.Beneficiaries กรุณาตรวจสอบการสร้างตารางก่อน', 1;

    CREATE TABLE dbo.BeneficiaryMedia
    (
        Id INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_BeneficiaryMedia PRIMARY KEY,
        BeneficiaryId INT NOT NULL,
        Category NVARCHAR(20) NOT NULL,
        Agency NVARCHAR(200) NULL,
        Description NVARCHAR(1000) NULL,
        AssistanceDate DATETIME2 NULL,
        ImagePath NVARCHAR(500) NOT NULL,
        UploadedAt DATETIME2 NOT NULL,
        CONSTRAINT FK_BeneficiaryMedia_Beneficiaries_BeneficiaryId
            FOREIGN KEY (BeneficiaryId) REFERENCES dbo.Beneficiaries(Id) ON DELETE CASCADE
    );
    CREATE INDEX IX_BeneficiaryMedia_BeneficiaryId ON dbo.BeneficiaryMedia(BeneficiaryId);
END;
GO

/* 5) HouseholdMembers - matches Models/HouseholdMember.cs */
IF OBJECT_ID(N'dbo.HouseholdMembers', N'U') IS NULL
BEGIN
    IF OBJECT_ID(N'dbo.Beneficiaries', N'U') IS NULL
        THROW 50002, N'ไม่พบ dbo.Beneficiaries กรุณาตรวจสอบการสร้างตารางก่อน', 1;

    CREATE TABLE dbo.HouseholdMembers
    (
        Id INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_HouseholdMembers PRIMARY KEY,
        BeneficiaryId INT NOT NULL,
        FullName NVARCHAR(200) NOT NULL,
        Relationship NVARCHAR(50) NULL,
        Age INT NULL,
        Occupation NVARCHAR(150) NULL,
        MonthlyIncome DECIMAL(18,2) NULL,
        Notes NVARCHAR(500) NULL,
        CreatedAt DATETIME2 NOT NULL,
        CONSTRAINT FK_HouseholdMembers_Beneficiaries_BeneficiaryId
            FOREIGN KEY (BeneficiaryId) REFERENCES dbo.Beneficiaries(Id) ON DELETE CASCADE,
        CONSTRAINT CK_HouseholdMembers_Age CHECK (Age IS NULL OR (Age >= 0 AND Age <= 120)),
        CONSTRAINT CK_HouseholdMembers_MonthlyIncome CHECK (MonthlyIncome IS NULL OR MonthlyIncome >= 0)
    );
    CREATE INDEX IX_HouseholdMembers_BeneficiaryId ON dbo.HouseholdMembers(BeneficiaryId);
END;
GO

/* 6) Verify database and tables */
SELECT DB_NAME() AS CurrentDatabase;
SELECT s.name AS SchemaName, t.name AS TableName
FROM sys.tables t
JOIN sys.schemas s ON s.schema_id=t.schema_id
WHERE t.name IN (N'Users',N'Beneficiaries',N'BeneficiaryMedia',N'HouseholdMembers')
ORDER BY t.name;
GO

/* 7) Inspect columns */
SELECT TABLE_NAME, ORDINAL_POSITION, COLUMN_NAME, DATA_TYPE,
       CHARACTER_MAXIMUM_LENGTH, IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA=N'dbo'
  AND TABLE_NAME IN (N'Users',N'Beneficiaries',N'BeneficiaryMedia',N'HouseholdMembers')
ORDER BY TABLE_NAME, ORDINAL_POSITION;
GO

/* 8) Inspect row counts */
SELECT N'Users' AS TableName, COUNT_BIG(*) AS TotalRows FROM dbo.Users
UNION ALL SELECT N'Beneficiaries', COUNT_BIG(*) FROM dbo.Beneficiaries
UNION ALL SELECT N'BeneficiaryMedia', COUNT_BIG(*) FROM dbo.BeneficiaryMedia
UNION ALL SELECT N'HouseholdMembers', COUNT_BIG(*) FROM dbo.HouseholdMembers;
GO

/* 9) View users (do not expose PasswordHash unnecessarily) */
SELECT Id, Username, DisplayName, Role, CreatedAt
FROM dbo.Users
ORDER BY Id;
GO

/* 10) View beneficiary records */
SELECT Id, CitizenId, FullName, Age, Vulnerability, Subdistrict, District,
       Province, Agency, AnnualBudget, HouseholdIncome, HouseholdMembers,
       AssistanceStatus, CreatedAt, UpdatedAt
FROM dbo.Beneficiaries
ORDER BY Id;
GO

/* 11) View family members */
SELECT hm.Id, hm.BeneficiaryId, b.FullName AS BeneficiaryName,
       hm.FullName AS MemberName, hm.Relationship, hm.Age,
       hm.Occupation, hm.MonthlyIncome, hm.Notes, hm.CreatedAt
FROM dbo.HouseholdMembers hm
JOIN dbo.Beneficiaries b ON b.Id=hm.BeneficiaryId
ORDER BY hm.BeneficiaryId, hm.Id;
GO

/* 12) View image metadata */
SELECT m.Id, m.BeneficiaryId, b.FullName AS BeneficiaryName,
       m.Category, m.Agency, m.Description, m.AssistanceDate,
       m.ImagePath, m.UploadedAt
FROM dbo.BeneficiaryMedia m
JOIN dbo.Beneficiaries b ON b.Id=m.BeneficiaryId
ORDER BY m.BeneficiaryId, m.UploadedAt DESC;
GO

/* 13) Add a beneficiary example (uncomment and edit before use)
INSERT INTO dbo.Beneficiaries
(CitizenId, FullName, Age, Vulnerability, Subdistrict, District, Province,
 Agency, AnnualBudget, HouseholdIncome, HouseholdMembers, AssistanceStatus,
 Notes, CreatedAt, UpdatedAt)
VALUES
(N'0000000000000', N'ชื่อ-นามสกุลตัวอย่าง', 60, N'ผู้สูงอายุ',
 N'ตำบลตัวอย่าง', N'อำเภอตัวอย่าง', N'สกลนคร', N'หน่วยงานตัวอย่าง',
 0, 0, 1, N'รอดำเนินการ', N'ข้อมูลตัวอย่าง', SYSUTCDATETIME(), SYSUTCDATETIME());
GO
*/

/* 14) Update beneficiary example (uncomment and set the correct Id)
UPDATE dbo.Beneficiaries
SET AssistanceStatus=N'ดำเนินการแล้ว', UpdatedAt=SYSUTCDATETIME()
WHERE Id=1;
GO
*/

/* 15) Delete example (uncomment only if you are certain; related members/media cascade)
DELETE FROM dbo.Beneficiaries WHERE Id=1;
GO
*/

/*
CREATE ADMIN ACCOUNT:
Do NOT insert plain password into PasswordHash. This project uses
IPasswordHasher<AppUser> in Program.cs. Create the first Admin by setting
these environment variables in the same PowerShell terminal before `dotnet run`:
  $env:LOGBOOK_ADMIN_USERNAME="admin"
  $env:LOGBOOK_ADMIN_PASSWORD="Use-A-Strong-Password-12+"
  dotnet run
Program.cs will hash the password and insert Admin if that username does not exist.
If the username already exists, this code does not reset its password.
*/
