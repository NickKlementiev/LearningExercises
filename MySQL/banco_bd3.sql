-- Criação de DW Dimensional BD_BI
-- Criando o DW
CREATE DATABASE BD_BI 
go

-- Ativando o DW para uso
USE BD_BI
go

-- Criando as tabelas do DW (Dimensões e Fatos)
CREATE TABLE [dbo].[DimAccount](
[AccountKey] [int] IDENTITY(1,1) NOT NULL,
[ParentAccountKey] [int] NULL,
[AccountCodeAlternateKey] [int] NULL,
[ParentAccountCodeAlternateKey] [int] NULL,
[AccountDescription] [nvarchar](50) NULL,
[AccountType] [nvarchar](50) NULL,
[Operator] [nvarchar](50) NULL,
[CustomMembers] [nvarchar](300) NULL,
[ValueType] [nvarchar](50) NULL,
[CustomMemberOptions] [nvarchar](200) NULL 
) 

CREATE TABLE [dbo].[DimDate](
[DateKey] [int] NOT NULL,
[FullDateAlternateKey] [datetime] NOT NULL,
[DayNumberOfWeek] [tinyint] NOT NULL,
[EnglishDayNameOfWeek] [nvarchar](10) NOT NULL,
[SpanishDayNameOfWeek] [nvarchar](10) NOT NULL,
[FrenchDayNameOfWeek] [nvarchar](10) NOT NULL,
[DayNumberOfMonth] [tinyint] NOT NULL,
[DayNumberOfYear] [smallint] NOT NULL,
[WeekNumberOfYear] [tinyint] NOT NULL,
[EnglishMonthName] [nvarchar](10) NOT NULL,
[SpanishMonthName] [nvarchar](10) NOT NULL,
[FrenchMonthName] [nvarchar](10) NOT NULL,
[MonthNumberOfYear] [tinyint] NOT NULL,
[CalendarQuarter] [tinyint] NOT NULL,
[CalendarYear] [smallint] NOT NULL,
[CalendarSemester] [tinyint] NOT NULL,
[FiscalQuarter] [tinyint] NOT NULL,
[FiscalYear] [smallint] NOT NULL,
[FiscalSemester] [tinyint] NOT NULL
) 

CREATE TABLE [dbo].[DimDepartmentGroup](
[DepartmentGroupKey] [int] IDENTITY(1,1) NOT NULL,
[ParentDepartmentGroupKey] [int] NULL,
[DepartmentGroupName] [nvarchar](50) NULL
) 


CREATE TABLE [dbo].[DimOrganization](
[OrganizationKey] [int] IDENTITY(1,1) NOT NULL,
[ParentOrganizationKey] [int] NULL,
[PercentageOfOwnership] [nvarchar](16) NULL,
[OrganizationName] [nvarchar](50) NULL,
[CurrencyKey] [int] NULL
) 


CREATE TABLE [dbo].[DimScenario](
[ScenarioKey] [int] IDENTITY(1,1) NOT NULL,
[ScenarioName] [nvarchar](50) NULL
) 

CREATE TABLE [dbo].[FactFinance](
[FinanceKey] [int] IDENTITY(1,1) NOT NULL,
[DateKey] [int] NOT NULL,
[OrganizationKey] [int] NOT NULL,
[DepartmentGroupKey] [int] NOT NULL,
[ScenarioKey] [int] NOT NULL,
[AccountKey] [int] NOT NULL,
[Amount] [float] NOT NULL,
[Date] [datetime] NULL
) 
