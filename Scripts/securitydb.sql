USE [SecurityDb]
GO
/****** Object:  Table [dbo].[MenuLists]    Script Date: 25-10-2016 10:05:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuLists](
	[MenuId] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [nvarchar](max) NULL,
	[Url] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.MenuLists] PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MenuPermissions]    Script Date: 25-10-2016 10:05:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuPermissions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[MenuId] [int] NOT NULL,
	[IsVisible] [bit] NULL,
 CONSTRAINT [PK_dbo.MenuPermissions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RegistrationViewModels]    Script Date: 25-10-2016 10:05:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistrationViewModels](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](155) NOT NULL,
	[Password] [nvarchar](155) NOT NULL,
	[ConfirmPassword] [nvarchar](155) NOT NULL,
	[Salt] [nvarchar](15) NULL,
	[FirstName] [nvarchar](255) NOT NULL,
	[LastName] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[Phone] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](255) NOT NULL,
	[SecurityQuestion] [nvarchar](255) NOT NULL,
	[SecurityQuestionAnswer] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_dbo.RegistrationViewModels] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ResetTickets]    Script Date: 25-10-2016 10:05:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResetTickets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](max) NULL,
	[TokenHash] [nvarchar](max) NULL,
	[Expiration] [datetime] NOT NULL,
	[TokenUsed] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.ResetTickets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoleAssignUsers]    Script Date: 25-10-2016 10:05:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleAssignUsers](
	[RaId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.RoleAssignUsers] PRIMARY KEY CLUSTERED 
(
	[RaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 25-10-2016 10:05:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NULL,
 CONSTRAINT [PK_dbo.Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRegistrations]    Script Date: 25-10-2016 10:05:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRegistrations](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](155) NOT NULL,
	[Password] [nvarchar](155) NOT NULL,
	[Salt] [nvarchar](15) NULL,
	[FirstName] [nvarchar](255) NOT NULL,
	[LastName] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[Phone] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](255) NOT NULL,
	[SecurityQuestion] [nvarchar](255) NOT NULL,
	[SecurityQuestionAnswer] [nvarchar](255) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[LastLogin] [datetime] NULL,
 CONSTRAINT [PK_dbo.UserRegistrations] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[MenuPermissions]  WITH CHECK ADD  CONSTRAINT [FK_dbo.MenuPermissions_dbo.MenuLists_MenuId] FOREIGN KEY([MenuId])
REFERENCES [dbo].[MenuLists] ([MenuId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MenuPermissions] CHECK CONSTRAINT [FK_dbo.MenuPermissions_dbo.MenuLists_MenuId]
GO
ALTER TABLE [dbo].[MenuPermissions]  WITH CHECK ADD  CONSTRAINT [FK_dbo.MenuPermissions_dbo.Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MenuPermissions] CHECK CONSTRAINT [FK_dbo.MenuPermissions_dbo.Roles_RoleId]
GO
ALTER TABLE [dbo].[RoleAssignUsers]  WITH CHECK ADD  CONSTRAINT [FK_dbo.RoleAssignUsers_dbo.Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoleAssignUsers] CHECK CONSTRAINT [FK_dbo.RoleAssignUsers_dbo.Roles_RoleId]
GO
ALTER TABLE [dbo].[RoleAssignUsers]  WITH CHECK ADD  CONSTRAINT [FK_dbo.RoleAssignUsers_dbo.UserRegistrations_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserRegistrations] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoleAssignUsers] CHECK CONSTRAINT [FK_dbo.RoleAssignUsers_dbo.UserRegistrations_UserId]
GO
