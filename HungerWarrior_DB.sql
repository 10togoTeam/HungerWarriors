/****** Object:  Database [HungerWarriorsDB]    Script Date: 24-02-2021 12:37:30 ******/
CREATE DATABASE [HungerWarriorsDB]  (EDITION = 'GeneralPurpose', SERVICE_OBJECTIVE = 'GP_Gen5_2', MAXSIZE = 32 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS;
GO
ALTER DATABASE [HungerWarriorsDB] SET COMPATIBILITY_LEVEL = 150
GO
ALTER DATABASE [HungerWarriorsDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HungerWarriorsDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HungerWarriorsDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HungerWarriorsDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HungerWarriorsDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [HungerWarriorsDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HungerWarriorsDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HungerWarriorsDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HungerWarriorsDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HungerWarriorsDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HungerWarriorsDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HungerWarriorsDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HungerWarriorsDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HungerWarriorsDB] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [HungerWarriorsDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HungerWarriorsDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [HungerWarriorsDB] SET  MULTI_USER 
GO
ALTER DATABASE [HungerWarriorsDB] SET ENCRYPTION ON
GO
ALTER DATABASE [HungerWarriorsDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [HungerWarriorsDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
/****** Object:  Table [dbo].[DonatorDetails]    Script Date: 24-02-2021 12:37:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonatorDetails](
	[DonatorID] [int] IDENTITY(100,1) NOT NULL,
	[DonatorType] [nvarchar](50) NOT NULL,
	[DonatorName] [nvarchar](50) NOT NULL,
	[ContactNumber] [nvarchar](12) NOT NULL,
	[EmailAddress] [nvarchar](100) NOT NULL,
	[DonatorAddress] [nvarchar](255) NOT NULL,
	[DonatorPIN] [nchar](6) NOT NULL,
	[DonatorCity] [nvarchar](100) NOT NULL,
	[DonatorState] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_DonatorDetail] PRIMARY KEY CLUSTERED 
(
	[DonatorID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 24-02-2021 12:37:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[UserName] [varchar](100) NOT NULL,
	[UserPassword] [varchar](50) NOT NULL,
	[Type] [varchar](50) NOT NULL,
	[isExist] [char](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MappingDetails]    Script Date: 24-02-2021 12:37:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MappingDetails](
	[DonatorID] [int] NOT NULL,
	[DonatorName] [nvarchar](255) NULL,
	[DonatorEmail] [nvarchar](100) NULL,
	[DonatorPhone] [nvarchar](20) NULL,
	[DonatorAddress] [nvarchar](255) NULL,
	[DonatorPIN] [nvarchar](255) NULL,
	[Operation] [char](1) NULL,
	[ModifiedDate] [datetime] NULL,
	[VolunteerEmailID] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[DonatorID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequestDetails]    Script Date: 24-02-2021 12:37:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestDetails](
	[RequestID] [int] IDENTITY(1000,1) NOT NULL,
	[DonatorID] [int] NOT NULL,
	[VolunteerID] [int] NULL,
	[FoodItems] [varchar](4000) NOT NULL,
	[RequestTime] [varchar](100) NOT NULL,
	[Status] [varchar](100) NOT NULL,
 CONSTRAINT [PK_RequestDetails] PRIMARY KEY CLUSTERED 
(
	[DonatorID] ASC,
	[RequestTime] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequestTypes]    Script Date: 24-02-2021 12:37:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestTypes](
	[Type] [varchar](50) NOT NULL,
	[Infomation] [varchar](200) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StateCityMapper]    Script Date: 24-02-2021 12:37:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StateCityMapper](
	[City] [nvarchar](50) NOT NULL,
	[State] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionDetails]    Script Date: 24-02-2021 12:37:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionDetails](
	[TxID] [int] IDENTITY(1,1) NOT NULL,
	[DonatorName] [nvarchar](255) NOT NULL,
	[DonatorEmail] [nvarchar](255) NOT NULL,
	[DonatorPhone] [nvarchar](20) NULL,
	[VolunteerEmailID] [nvarchar](255) NULL,
	[Status] [nvarchar](255) NULL,
	[VolunteerID] [int] NULL,
	[DonatorID] [int] NULL,
	[FoodItems] [nvarchar](300) NULL,
	[RequestDateTime] [nvarchar](50) NULL,
	[FoodWeight] [int] NULL,
	[EmailSent] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[TxID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VolunteerDetails]    Script Date: 24-02-2021 12:37:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VolunteerDetails](
	[VolunteerID] [int] IDENTITY(2000,1) NOT NULL,
	[VolunteerName] [nvarchar](50) NOT NULL,
	[VolunteerContact] [nvarchar](12) NOT NULL,
	[VolunteerEmailId] [nvarchar](50) NOT NULL,
	[VolunteerPin] [nchar](6) NOT NULL,
	[VolunteerCity] [nvarchar](100) NOT NULL,
	[VolunteerState] [nvarchar](100) NOT NULL,
	[VolunteerAddress] [nvarchar](225) NOT NULL,
	[VolunteerHasVehicle] [nchar](3) NOT NULL,
	[VolunteerType] [nvarchar](20) NOT NULL,
	[HolidayFlag] [varchar](1) NULL,
	[LastModified] [datetime] NULL,
 CONSTRAINT [PK_VolunteerDetails] PRIMARY KEY CLUSTERED 
(
	[VolunteerName] ASC,
	[VolunteerContact] ASC,
	[VolunteerEmailId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MappingDetails] ADD  CONSTRAINT [volunteer_details]  DEFAULT (' ') FOR [VolunteerEmailID]
GO
ALTER TABLE [dbo].[TransactionDetails] ADD  CONSTRAINT [food_items]  DEFAULT (' ') FOR [FoodItems]
GO
/****** Object:  StoredProcedure [dbo].[Donor_Details]    Script Date: 24-02-2021 12:37:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Donor_Details] @EmailID	nvarchar(30)
As
SELECT DonatorAddress,DonatorPIN,ContactNumber
from dbo.DonatorDetails Where EmailAddress = @EmailID
GO
/****** Object:  StoredProcedure [dbo].[FetchVolunteerID]    Script Date: 24-02-2021 12:37:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FetchVolunteerID] @VolunteerEmail nvarchar(50)
AS
SELECT VolunteerID,VolunteerContact,VolunteerName
from [dbo].[VolunteerDetails] WHERE VolunteerEmailid = @VolunteerEmail
GO
/****** Object:  StoredProcedure [dbo].[SelectMappedDetails]    Script Date: 24-02-2021 12:37:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectMappedDetails] @Email nvarchar(30)
AS
SELECT DonatorID,DonatorName,VolunteerEmailID
from [dbo].[MappingDetails] WHERE DonatorEmail = @Email

Select ContactNumber,DonatorAddress,DonatorPIN from [dbo].[DonatorDetails] 
WHERE EmailAddress = @Email
GO
/****** Object:  StoredProcedure [dbo].[SelectPickupStatus]    Script Date: 24-02-2021 12:37:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectPickupStatus] @TxID int
AS
SELECT DonatorEmail,Status from [dbo].[TransactionDetails] where TxID = @TxID
GO
/****** Object:  StoredProcedure [dbo].[SelectRemainingVolunteers]    Script Date: 24-02-2021 12:37:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectRemainingVolunteers] (@FromEmail nvarchar(255),@DonatorEmail nvarchar(30),@RemainingVolunteer nvarchar(255) Out)
AS
 Declare @AllVolunteers nvarchar(255)

 SELECT @AllVolunteers=VolunteerEmailID from [dbo].[MappingDetails] WHERE DonatorEmail = @DonatorEmail
 Set @RemainingVolunteer = Replace(@AllVolunteers,@FromEmail,' ')
GO
/****** Object:  StoredProcedure [dbo].[spAlterVolunteerDetails]    Script Date: 24-02-2021 12:37:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[spAlterVolunteerDetails] (@VolunteerId int,@VolunteerHolidayFlag varchar(1))
as
UPDATE [dbo].[VolunteerDetails]
SET HolidayFlag = @VolunteerHolidayFlag, LastModified = GetDate()
WHERE VolunteerID = @VolunteerId
GO
/****** Object:  StoredProcedure [dbo].[spInsertDonatorDetails]    Script Date: 24-02-2021 12:37:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[spInsertDonatorDetails] (@DonatorType nvarchar(50),@DonatorName varchar(50),@DonatorContact nvarchar(12),
@DonatorEmail nvarchar(100),@DonatorAddress nvarchar(255),@DonatorPin nchar(6),@DonatorCity nvarchar(100),@DonatorState nvarchar(100))
as 
INSERT INTO [dbo].[DonatorDetails]
           ([DonatorType]
           ,[DonatorName]
           ,[ContactNumber]
           ,[EmailAddress]
           ,[DonatorAddress]
           ,[DonatorPIN]
           ,[DonatorCity] 
           ,[DonatorState])
     VALUES
           (@DonatorType
           ,@DonatorName
           ,@DonatorContact
           ,@DonatorEmail
           ,@DonatorAddress
           ,@DonatorPin
           ,@DonatorCity
           ,@DonatorState)
GO
/****** Object:  StoredProcedure [dbo].[spInsertLoginDetails]    Script Date: 24-02-2021 12:37:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[spInsertLoginDetails] (@EmailId varchar(100),@WarriorType varchar(50))
as
INSERT INTO [dbo].[Login]
           ([UserName]
      ,[UserPassword]
      ,[Type]
      ,[isExist])
     VALUES
           (@EmailId
           ,'Welcome@123'
           ,@WarriorType
           ,'Y')

GO
/****** Object:  StoredProcedure [dbo].[spInsertVolunteerDetails]    Script Date: 24-02-2021 12:37:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spInsertVolunteerDetails] (@VolunteerType nvarchar(20),@VolunteerName nvarchar(50),@VolunteerContact nvarchar(12),
@VolunteerEmail nvarchar(50),@VolunteerAddress nvarchar(225),@VolunteerPin nchar(6),@VolunteerCity nvarchar(100),@VolunteerState nvarchar(100),@VolunteerVehicle nchar(3))
as
INSERT INTO [dbo].[VolunteerDetails]
           ([VolunteerName]
      ,[VolunteerContact]
      ,[VolunteerEmailId]
      ,[VolunteerPin]
      ,[VolunteerCity]
      ,[VolunteerState]
      ,[VolunteerAddress]
      ,[VolunteerHasVehicle]
      ,[VolunteerType],[HolidayFlag],[LastModified])
     VALUES
           (@VolunteerName
           ,@VolunteerContact
           ,@VolunteerEmail
           ,@VolunteerPin
           ,@VolunteerCity
           ,@VolunteerState
           ,@VolunteerAddress,@VolunteerVehicle,@VolunteerType,'N',GETDATE())

GO
/****** Object:  StoredProcedure [dbo].[spUpdateLoginDetails]    Script Date: 24-02-2021 12:37:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[spUpdateLoginDetails] (@EmailId varchar(100),@NewPassword varchar(50))
as
Update [dbo].Login
Set UserPassword=@NewPassword 
where UserName = @EmailId

GO
ALTER DATABASE [HungerWarriorsDB] SET  READ_WRITE 
GO
