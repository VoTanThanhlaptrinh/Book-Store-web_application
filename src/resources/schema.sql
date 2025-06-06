USE [book_store]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 4/20/2025 9:03:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[cart_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[status] [nvarchar](20) NOT NULL,
	[create_date] [datetime] NOT NULL,
	[update_date] [datetime] NULL,
 CONSTRAINT [Cart_pk] PRIMARY KEY CLUSTERED 
(
	[cart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart_item]    Script Date: 4/20/2025 9:03:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart_item](
	[cart_item_id] [int] IDENTITY(1,1) NOT NULL,
	[cart_id] [int] NOT NULL,
	[quantity] [tinyint] NOT NULL,
	[product_id] [int] NOT NULL,
	[create_date] [datetime] NOT NULL,
	[update_date] [datetime] NULL,
	[status] [varchar](50) NOT NULL,
 CONSTRAINT [Cart_item_pk] PRIMARY KEY CLUSTERED 
(
	[cart_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 4/20/2025 9:03:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[parent_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 4/20/2025 9:03:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[comment_id] [int] IDENTITY(1,1) NOT NULL,
	[rating] [tinyint] NULL,
	[content] [nvarchar](255) NOT NULL,
	[create_date] [datetime] NOT NULL,
	[update_date] [datetime] NULL,
 CONSTRAINT [Comment_pk] PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Evaluate]    Script Date: 4/20/2025 9:03:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evaluate](
	[evaluate_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[comment_id] [int] NOT NULL,
	[create_date] [datetime] NOT NULL,
	[update_date] [datetime] NULL,
 CONSTRAINT [Evaluate_pk] PRIMARY KEY CLUSTERED 
(
	[evaluate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[History_search]    Script Date: 4/20/2025 9:03:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History_search](
	[his_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[content] [nvarchar](100) NOT NULL,
	[create_date] [datetime] NOT NULL,
 CONSTRAINT [History_search_pk] PRIMARY KEY CLUSTERED 
(
	[his_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 4/20/2025 9:03:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[img_id] [int] IDENTITY(1,1) NOT NULL,
	[file_name] [nvarchar](100) NOT NULL,
	[file_type] [nvarchar](20) NOT NULL,
	[description] [nvarchar](50) NOT NULL,
	[create_date] [datetime] NOT NULL,
	[update_date] [datetime] NULL,
	[data] [varbinary](max) NULL,
 CONSTRAINT [Image_pk] PRIMARY KEY CLUSTERED 
(
	[img_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Information]    Script Date: 4/20/2025 9:03:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Information](
	[info_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[address] [nvarchar](255) NOT NULL,
	[phone_number] [nvarchar](10) NOT NULL,
	[cccd] [varchar](12) NOT NULL,
	[birth] [datetime] NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[create_date] [datetime] NOT NULL,
	[update_date] [datetime] NULL,
	[img_id] [int] NULL,
	[user_id] [int] NULL,
 CONSTRAINT [Infomation_pk] PRIMARY KEY CLUSTERED 
(
	[info_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Log]    Script Date: 4/20/2025 9:03:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log](
	[log_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[lever] [nvarchar](255) NOT NULL,
	[ip] [nvarchar](255) NULL,
	[target] [nvarchar](255) NOT NULL,
	[url] [nvarchar](255) NOT NULL,
	[previousData] [varbinary](max) NULL,
	[afterData] [varbinary](max) NULL,
	[message] [nvarchar](max) NOT NULL,
	[createAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_1]    Script Date: 4/20/2025 9:03:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_1](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[total_amount] [decimal](10, 2) NOT NULL,
	[status] [nvarchar](20) NOT NULL,
	[create_date] [datetime] NOT NULL,
	[update_date] [datetime] NULL,
 CONSTRAINT [Order_1_pk] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_item]    Script Date: 4/20/2025 9:03:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_item](
	[order_item_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [tinyint] NOT NULL,
	[price] [money] NOT NULL,
	[create_date] [datetime] NOT NULL,
	[update_date] [datetime] NULL,
 CONSTRAINT [Order_item_pk] PRIMARY KEY CLUSTERED 
(
	[order_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 4/20/2025 9:03:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[level] [int] NOT NULL,
	[permission_name] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[permission_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[level] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_1]    Script Date: 4/20/2025 9:03:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_1](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NOT NULL,
	[price] [money] NOT NULL,
	[description] [nvarchar](max) NULL,
	[img_id] [int] NULL,
	[create_date] [datetime] NOT NULL,
	[update_date] [datetime] NULL,
	[pdQuantity] [int] NULL,
	[added_by_user] [int] NULL,
	[category_parent_id] [int] NULL,
	[category_id] [int] NULL,
	[language] [nvarchar](255) NULL,
	[page] [int] NULL,
	[author] [nvarchar](255) NULL,
	[publishYear] [int] NULL,
 CONSTRAINT [Product_pk] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Resource]    Script Date: 4/20/2025 9:03:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resource](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[url] [varchar](255) NULL,
	[resource_name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[url] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 4/20/2025 9:03:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[content] [nvarchar](20) NULL,
	[role_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [pk_role] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_User]    Script Date: 4/20/2025 9:03:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_User](
	[role_id] [int] NULL,
	[user_id] [int] NULL,
	[role_user_id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[role_user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SocialLogin]    Script Date: 4/20/2025 9:03:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SocialLogin](
	[social_login_id] [varchar](255) NOT NULL,
	[user_id] [int] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[createAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[social_login_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction_1]    Script Date: 4/20/2025 9:03:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction_1](
	[transaction_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[currency] [nvarchar](10) NOT NULL,
	[transaction_type] [nvarchar](20) NOT NULL,
	[status] [nvarchar](20) NOT NULL,
	[payment_method] [nvarchar](20) NOT NULL,
	[description] [nvarchar](255) NOT NULL,
	[create_date] [datetime] NOT NULL,
	[update_date] [datetime] NULL,
 CONSTRAINT [Transaction_1_pk] PRIMARY KEY CLUSTERED 
(
	[transaction_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction_item]    Script Date: 4/20/2025 9:03:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction_item](
	[transaction_item_id] [int] IDENTITY(1,1) NOT NULL,
	[transaction_id] [int] NOT NULL,
	[order_item_id] [int] NOT NULL,
	[quantity] [tinyint] NOT NULL,
	[price] [money] NOT NULL,
	[create_date] [datetime] NOT NULL,
	[update_date] [datetime] NULL,
 CONSTRAINT [Transaction_item_pk] PRIMARY KEY CLUSTERED 
(
	[transaction_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_1]    Script Date: 4/20/2025 9:03:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_1](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](100) NULL,
	[password] [nvarchar](255) NOT NULL,
	[create_date] [datetime] NOT NULL,
	[email] [nvarchar](255) NULL,
	[update_date] [datetime] NULL,
	[is_social_login] [bit] NULL,
	[status] [nvarchar](255) NULL,
	[is_activate] [bit] NULL,
 CONSTRAINT [User_1_pk] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Resource_Permission]    Script Date: 4/20/2025 9:03:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Resource_Permission](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[resource_id] [int] NOT NULL,
	[permission_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cart_item] ADD  DEFAULT ('pending') FOR [status]
GO
ALTER TABLE [dbo].[User_1] ADD  DEFAULT ((0)) FOR [is_social_login]
GO
ALTER TABLE [dbo].[User_1] ADD  DEFAULT (NULL) FOR [status]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [User_Cart_fk] FOREIGN KEY([user_id])
REFERENCES [dbo].[User_1] ([user_id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [User_Cart_fk]
GO
ALTER TABLE [dbo].[Cart_item]  WITH CHECK ADD  CONSTRAINT [Cart_Cart_item_fk] FOREIGN KEY([cart_id])
REFERENCES [dbo].[Cart] ([cart_id])
GO
ALTER TABLE [dbo].[Cart_item] CHECK CONSTRAINT [Cart_Cart_item_fk]
GO
ALTER TABLE [dbo].[Cart_item]  WITH CHECK ADD  CONSTRAINT [Product_Cart_item_fk] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product_1] ([product_id])
GO
ALTER TABLE [dbo].[Cart_item] CHECK CONSTRAINT [Product_Cart_item_fk]
GO
ALTER TABLE [dbo].[categories]  WITH CHECK ADD FOREIGN KEY([parent_id])
REFERENCES [dbo].[categories] ([id])
GO
ALTER TABLE [dbo].[Evaluate]  WITH CHECK ADD  CONSTRAINT [Evaluate_Comment_fk] FOREIGN KEY([comment_id])
REFERENCES [dbo].[Comment] ([comment_id])
GO
ALTER TABLE [dbo].[Evaluate] CHECK CONSTRAINT [Evaluate_Comment_fk]
GO
ALTER TABLE [dbo].[Evaluate]  WITH CHECK ADD  CONSTRAINT [Product_Evaluate_fk] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product_1] ([product_id])
GO
ALTER TABLE [dbo].[Evaluate] CHECK CONSTRAINT [Product_Evaluate_fk]
GO
ALTER TABLE [dbo].[Evaluate]  WITH CHECK ADD  CONSTRAINT [User_Evaluate_fk] FOREIGN KEY([user_id])
REFERENCES [dbo].[User_1] ([user_id])
GO
ALTER TABLE [dbo].[Evaluate] CHECK CONSTRAINT [User_Evaluate_fk]
GO
ALTER TABLE [dbo].[History_search]  WITH CHECK ADD  CONSTRAINT [User_1_History_search_fk] FOREIGN KEY([user_id])
REFERENCES [dbo].[User_1] ([user_id])
GO
ALTER TABLE [dbo].[History_search] CHECK CONSTRAINT [User_1_History_search_fk]
GO
ALTER TABLE [dbo].[Information]  WITH CHECK ADD  CONSTRAINT [fk_infor_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[User_1] ([user_id])
GO
ALTER TABLE [dbo].[Information] CHECK CONSTRAINT [fk_infor_user]
GO
ALTER TABLE [dbo].[Information]  WITH CHECK ADD  CONSTRAINT [Image_Information_fk] FOREIGN KEY([img_id])
REFERENCES [dbo].[Image] ([img_id])
GO
ALTER TABLE [dbo].[Information] CHECK CONSTRAINT [Image_Information_fk]
GO
ALTER TABLE [dbo].[Log]  WITH CHECK ADD  CONSTRAINT [FK_Log_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User_1] ([user_id])
GO
ALTER TABLE [dbo].[Log] CHECK CONSTRAINT [FK_Log_User]
GO
ALTER TABLE [dbo].[Order_1]  WITH CHECK ADD  CONSTRAINT [User_Order_fk] FOREIGN KEY([user_id])
REFERENCES [dbo].[User_1] ([user_id])
GO
ALTER TABLE [dbo].[Order_1] CHECK CONSTRAINT [User_Order_fk]
GO
ALTER TABLE [dbo].[Order_item]  WITH CHECK ADD  CONSTRAINT [Order_Order_item_fk] FOREIGN KEY([order_id])
REFERENCES [dbo].[Order_1] ([order_id])
GO
ALTER TABLE [dbo].[Order_item] CHECK CONSTRAINT [Order_Order_item_fk]
GO
ALTER TABLE [dbo].[Order_item]  WITH CHECK ADD  CONSTRAINT [Product_Order_item_fk] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product_1] ([product_id])
GO
ALTER TABLE [dbo].[Order_item] CHECK CONSTRAINT [Product_Order_item_fk]
GO
ALTER TABLE [dbo].[Product_1]  WITH CHECK ADD  CONSTRAINT [Image_Product_fk] FOREIGN KEY([img_id])
REFERENCES [dbo].[Image] ([img_id])
GO
ALTER TABLE [dbo].[Product_1] CHECK CONSTRAINT [Image_Product_fk]
GO
ALTER TABLE [dbo].[Role_User]  WITH CHECK ADD  CONSTRAINT [role_fk] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([role_id])
GO
ALTER TABLE [dbo].[Role_User] CHECK CONSTRAINT [role_fk]
GO
ALTER TABLE [dbo].[Role_User]  WITH CHECK ADD  CONSTRAINT [user_fk] FOREIGN KEY([user_id])
REFERENCES [dbo].[User_1] ([user_id])
GO
ALTER TABLE [dbo].[Role_User] CHECK CONSTRAINT [user_fk]
GO
ALTER TABLE [dbo].[SocialLogin]  WITH CHECK ADD  CONSTRAINT [user_social_fk] FOREIGN KEY([user_id])
REFERENCES [dbo].[User_1] ([user_id])
GO
ALTER TABLE [dbo].[SocialLogin] CHECK CONSTRAINT [user_social_fk]
GO
ALTER TABLE [dbo].[Transaction_1]  WITH CHECK ADD  CONSTRAINT [Order_Transaction_fk] FOREIGN KEY([order_id])
REFERENCES [dbo].[Order_1] ([order_id])
GO
ALTER TABLE [dbo].[Transaction_1] CHECK CONSTRAINT [Order_Transaction_fk]
GO
ALTER TABLE [dbo].[Transaction_1]  WITH CHECK ADD  CONSTRAINT [User_Transaction_fk] FOREIGN KEY([user_id])
REFERENCES [dbo].[User_1] ([user_id])
GO
ALTER TABLE [dbo].[Transaction_1] CHECK CONSTRAINT [User_Transaction_fk]
GO
ALTER TABLE [dbo].[Transaction_item]  WITH CHECK ADD  CONSTRAINT [Order_item_Transaction_item_fk] FOREIGN KEY([order_item_id])
REFERENCES [dbo].[Order_item] ([order_item_id])
GO
ALTER TABLE [dbo].[Transaction_item] CHECK CONSTRAINT [Order_item_Transaction_item_fk]
GO
ALTER TABLE [dbo].[Transaction_item]  WITH CHECK ADD  CONSTRAINT [Transaction_Transaction_item_fk] FOREIGN KEY([transaction_id])
REFERENCES [dbo].[Transaction_1] ([transaction_id])
GO
ALTER TABLE [dbo].[Transaction_item] CHECK CONSTRAINT [Transaction_Transaction_item_fk]
GO
ALTER TABLE [dbo].[User_Resource_Permission]  WITH CHECK ADD FOREIGN KEY([permission_id])
REFERENCES [dbo].[Permission] ([id])
GO
ALTER TABLE [dbo].[User_Resource_Permission]  WITH CHECK ADD FOREIGN KEY([resource_id])
REFERENCES [dbo].[Resource] ([id])
GO
ALTER TABLE [dbo].[User_Resource_Permission]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[User_1] ([user_id])
GO
