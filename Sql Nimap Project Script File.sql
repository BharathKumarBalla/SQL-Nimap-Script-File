create database [NimapProject]
USE [NimapProject]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 21-04-2023 23:04:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1001,1) NOT NULL,
	[CategoryName] [varchar](75) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 21-04-2023 23:04:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](105) NULL,
	[CategoryID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
GO
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (1003, N'Clothing')
GO
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (1004, N'Daily Essentials')
GO
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (1001, N'Electronics')
GO
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (1002, N'LifeStyle')
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryID]) VALUES (1, N'Summer Wear', 1003)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryID]) VALUES (2, N'Washing Machine', 1001)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryID]) VALUES (3, N'Ethnic Wear', 1003)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryID]) VALUES (4, N'Groceries', 1004)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryID]) VALUES (5, N'Home Theatre', 1001)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryID]) VALUES (6, N'Micrwave Oven', 1001)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryID]) VALUES (7, N'Party Wear', 1003)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryID]) VALUES (8, N'Air Cooler', 1001)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryID]) VALUES (9, N'Mens Wear', 1003)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryID]) VALUES (13, N'Laptop', 1001)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryID]) VALUES (14, N'Remote', 1001)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryID]) VALUES (15, N'Air Conditioner', 1001)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryID]) VALUES (16, N'Stabilizer', 1001)
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Category__8517B2E06C2147FF]    Script Date: 21-04-2023 23:04:20 ******/
ALTER TABLE [dbo].[Category] ADD UNIQUE NONCLUSTERED 
(
	[CategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Category] ADD  DEFAULT ('N/A') FOR [CategoryName]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ('N/R') FOR [ProductName]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ('N/A') FOR [CategoryID]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryId])
GO
/****** Object:  StoredProcedure [dbo].[spAddCategory]    Script Date: 21-04-2023 23:04:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spAddCategory] @CategoryName varchar(125)
as begin
insert into  Category values(@CategoryName)
end
GO
/****** Object:  StoredProcedure [dbo].[spAddProduct]    Script Date: 21-04-2023 23:04:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spAddProduct] @ProductName varchar(125),@CategoryID int 
as begin
insert into  Product values(@ProductName,@CategoryID)
end
GO
/****** Object:  StoredProcedure [dbo].[SpCategoryAdd]    Script Date: 21-04-2023 23:04:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SpCategoryAdd] @CategoryName varchar(75)
as begin
insert into Category(CategoryName) values(@CategoryName) 
end
GO
/****** Object:  StoredProcedure [dbo].[spDeleteCategoryById]    Script Date: 21-04-2023 23:04:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spDeleteCategoryById] @CategoryId int
as begin
delete from Category where CategoryId=@CategoryId
end
GO
/****** Object:  StoredProcedure [dbo].[spDeleteProduct]    Script Date: 21-04-2023 23:04:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[spDeleteProduct] @Id int
as begin
delete from Product where ProductId=@Id
end
GO
/****** Object:  StoredProcedure [dbo].[spGetAllCategories]    Script Date: 21-04-2023 23:04:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetAllCategories]
as begin
Select * from Category order by CategoryId
end
GO
/****** Object:  StoredProcedure [dbo].[spGetCategoryById]    Script Date: 21-04-2023 23:04:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spGetCategoryById] @CategoryId int
as begin
Select * from Category where CategoryId=@CategoryId
end
GO
/****** Object:  StoredProcedure [dbo].[SpGetProductlist]    Script Date: 21-04-2023 23:04:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  procedure [dbo].[SpGetProductlist] 
as begin

select ProductId,ProductName,Category.CategoryId,CategoryName from Product 
inner join Category on Product.CategoryID=Category.CategoryId

end
GO
/****** Object:  StoredProcedure [dbo].[spGetProductsById]    Script Date: 21-04-2023 23:04:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spGetProductsById] @Id int
as begin
Select * from Product where ProductId=@Id
end
GO
/****** Object:  StoredProcedure [dbo].[spUpdateCategory]    Script Date: 21-04-2023 23:04:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[spUpdateCategory] @CategoryId int,@CategoryName varchar(225)
as begin
Update  Category set CategoryName=@CategoryName where CategoryId=@CategoryId
end
GO
/****** Object:  StoredProcedure [dbo].[spUpdateProduct]    Script Date: 21-04-2023 23:04:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spUpdateProduct] @ProductId int,@ProductName varchar(125),@CategoryID int 
as begin
Update  Product set ProductName=@ProductName,CategoryID=@CategoryID where ProductId=@ProductId
end
GO
