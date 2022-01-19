create database FsoftOnlineShopping

use FsoftOnlineShopping



SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[categoryID] [int] NOT NULL identity(1,1),
	[categoryIcon] [varchar](50) NULL,
	[categoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[userName] [varchar](50) NOT NULL,
	[userPassword] [varchar](max) NOT NULL,
	[userEmail] [nvarchar](70) NULL,
	[userFullname] [nvarchar](50) NULL,
	[userAddress] [nvarchar](200) NULL,
	[userCreateDate] [datetime] NULL,
	[userAvatar] [varchar](max) NULL,
	[userFacebook] [varchar](max) NULL,
	[userRole] [int] NOT NULL,
	[accountState] [int] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[userName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
----
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[productID] [int]not NULL identity(1,1),
	[categoryID] [int] NULL,
	[ProductName] [nvarchar](255) NULL,
	[productPrice] [float] NULL,
	[productNumber] [int] NULL,
	[productDescription] [nvarchar](255) NULL,
	imageFolder nvarchar(200),
	constraint fk_Products foreign key (categoryID) references Category(categoryID),
	constraint pks_Products primary key (productID)
) ON [PRIMARY]
GO
-------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Color](
	[colorID] [int] NOT NULL identity(1,1),
	[colorName] [nvarchar](50) NULL,
 CONSTRAINT [PK_color] PRIMARY KEY CLUSTERED 
(
	[colorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductColor](
	[productID] [int] NOT NULL,
	[colorID] [int] not NULL,
	constraint fk_ProductColorss foreign key (productID) references Product(productID),
	constraint fk_ProductColorsssss foreign key (colorID) references Color(colorID),
 CONSTRAINT [PK_ProductColorID] PRIMARY KEY CLUSTERED 
(
	[productID], [colorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
----
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSize](
	[productID] [int] NOT NULL,
	[sizeID] [nvarchar](50) not NULL,
	constraint fk_ProductSizess foreign key (productID) references Product(productID),
 CONSTRAINT [PK_ProductSize] PRIMARY KEY CLUSTERED 
(
	[productID], [sizeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

create table ProductComment (
productID int,
userName varchar(50),
commentContent nvarchar(200),
rating int,
constraint pk_ProductComment primary key (productID,userName),
constraint fks_productID foreign key (productID) references Product(productID),
constraint fks_userName foreign key (userName) references Account(userName))

create table Coupon (
couponID varchar(50),
couponName nvarchar(100),
couponExpirationDate datetime,
constraint pk_Coupons primary key (couponID))

create table PaymentMethod (
paymentMethodID int identity(1,1),
paymentMethodName nvarchar(200),
constraint pk_PaymentMethod primary key (paymentMethodID))

create table Cart (
cartID int identity(1,1),
userName varchar(50),
couponID varchar(50),
paymentMethodID int,
paymentDate datetime,
deliverDate datetime,
cartStatus int default 0,
totalPrice float,
constraint pk_Cart primary key (cartID),
constraint fks_couponID foreign key (couponID) references Coupon(couponID),
constraint fks_userNames foreign key (userName) references Account(userName),
constraint fks_paymentMethodIDs foreign key (paymentMethodID) references PaymentMethod(paymentMethodID)
)
--isPayment: 0 : not yet pay
--isPayment: 2 : is delivering
--isPayment: 1 : already pay

create table CartProduct (
cartID int identity(1,1),
productID int,
quantity  int,
constraint pks_CartProduct primary key (cartID),
constraint fkas_productID foreign key (productID) references Product(productID))

create table AccountCoupon(
userName varchar(50),
couponID varchar(50),
constraint pk_AccountCoupon primary key (userName,couponID),
constraint fkss_userName foreign key (userName) references Account(userName),
constraint fks_couponIDs foreign key (couponID) references Coupon (couponID))

INSERT [dbo].[Account] ([userName], [userPassword], [userEmail], [userFullname], [userAddress], [userCreateDate], [userAvatar], [userFacebook], [userRole], [accountState]) VALUES (N'admin', N'admin', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Account] ([userName], [userPassword], [userEmail], [userFullname], [userAddress], [userCreateDate], [userAvatar], [userFacebook], [userRole], [accountState]) VALUES (N'khoi', N'khoi', N'khoinmde150323@fpt.edu.vn', N'Nguyễn Mạnh Khôi', N'Đà Nẵng', CAST(N'2022-01-13T16:10:51.213' AS DateTime), N'images/avatar/khoi.jpg', N'https://www.facebook.com/profile.php?id=100011319337285', 0, 1)
INSERT [dbo].[Account] ([userName], [userPassword], [userEmail], [userFullname], [userAddress], [userCreateDate], [userAvatar], [userFacebook], [userRole], [accountState]) VALUES (N'minh', N'minh', N'minhnnde150311@fpt.edu.vn
', N'Nguyễn Nhật Minh', N'Đà Nẵng', CAST(N'2022-01-13T16:10:27.867' AS DateTime), N'images/avatar/minh.jpg', N'https://www.facebook.com/minhpopopro', 0, 1)
INSERT [dbo].[Account] ([userName], [userPassword], [userEmail], [userFullname], [userAddress], [userCreateDate], [userAvatar], [userFacebook], [userRole], [accountState]) VALUES (N'nhi', N'nhi', N'nhinhtde150290@fpt.edu.vn
', N'Nguyễn Hoàng Thục Nhi', N'Đà Nẵng', CAST(N'2022-01-13T16:10:43.220' AS DateTime), N'images/avatar/nhi.jpg', N'https://www.facebook.com/nhi.nguyenhoangthuc', 0, 1)
INSERT [dbo].[Account] ([userName], [userPassword], [userEmail], [userFullname], [userAddress], [userCreateDate], [userAvatar], [userFacebook], [userRole], [accountState]) VALUES (N'phuc', N'phuc', N'phuchntde150314@fpt.edu.vn', N'Huỳnh Ngô Triệu Phúc', N'Đà Nẵng', CAST(N'2022-01-13T16:10:58.953' AS DateTime), N'images/avatar/phuc.jpg', N'https://www.facebook.com/phuchnt0801', 0, 1)
INSERT [dbo].[Account] ([userName], [userPassword], [userEmail], [userFullname], [userAddress], [userCreateDate], [userAvatar], [userFacebook], [userRole], [accountState]) VALUES (N'quang', N'quang', N'quanglnnde150066@fpt.edu.vn', N'Lương Nguyễn Nhật Quang', N'Đà Nẵng', CAST(N'2022-01-13T16:09:56.000' AS DateTime), N'images/avatar/quang.jpg', N'https://www.facebook.com/profile.php?id=100008194183640', 0, 1)
GO

INSERT [dbo].[Category] ([categoryIcon], [categoryName]) VALUES ('fas fa-tshirt', N'Tee')
INSERT [dbo].[Category] ([categoryIcon], [categoryName]) VALUES ('fas fa-tshirt', N'Skirt')
INSERT [dbo].[Category] ([categoryIcon], [categoryName]) VALUES ('fa-duotone fa-people-pants-simple', N'Pants')
INSERT [dbo].[Category] ([categoryIcon], [categoryName]) VALUES ('fa-thin fa-person-dress-simple', N'Sweater Dress')
INSERT [dbo].[Category] ([categoryIcon], [categoryName]) VALUES ('fa-duotone fa-person-walking', N'Short')
INSERT [dbo].[Category] ([categoryIcon], [categoryName]) VALUES ('fa-solid fa-person-dress', N'Dress')
INSERT [dbo].[Category] ([categoryIcon], [categoryName]) VALUES ('fa-solid fa-shirt-long-sleeve', N'Cardigan')
GO

INSERT [dbo].[Product] ([categoryID], [ProductName], [productPrice], [productNumber], [productDescription]) VALUES (1, N'Letter Graphic Oversized Longline Tee', 20, 1000, N'Made in USA')
INSERT [dbo].[Product] ([categoryID], [ProductName], [productPrice], [productNumber], [productDescription]) VALUES (1, N'Letter & Sun Print Drop Shoulder Tee', 23, 200, N'Made in USA')
INSERT [dbo].[Product] ([categoryID], [ProductName], [productPrice], [productNumber], [productDescription]) VALUES (2, N'Tartan Print Lace Up Front Flared Skirt', 30, 234, N'Made in USA')
INSERT [dbo].[Product] ([categoryID], [ProductName], [productPrice], [productNumber], [productDescription]) VALUES (2, N'High Waist Zipper Back Skater Skirt', 32, 4567, N'Made in USA')
INSERT [dbo].[Product] ([categoryID], [ProductName], [productPrice], [productNumber], [productDescription]) VALUES (2, N'Solid Fold Pleated Skater Skirt', 27, 3231, N'Made in USA')
INSERT [dbo].[Product] ([categoryID], [ProductName], [productPrice], [productNumber], [productDescription]) VALUES (2, N'High Waist Solid Pleated Skirt', 26, 35, N'Made in USA')
INSERT [dbo].[Product] ([categoryID], [ProductName], [productPrice], [productNumber], [productDescription]) VALUES (3, N'Solid High Waist Belted Wide Leg Pants', 30, 356, N'Made in USA')
INSERT [dbo].[Product] ([categoryID], [ProductName], [productPrice], [productNumber], [productDescription]) VALUES (3, N'Solid Belted Tailored Pants', 40, 463, N'Made in USA')
INSERT [dbo].[Product] ([categoryID], [ProductName], [productPrice], [productNumber], [productDescription]) VALUES (3, N'High Waist Plaid Slant Pockets Pants', 34, 778, N'Made in USA')
INSERT [dbo].[Product] ([categoryID], [ProductName], [productPrice], [productNumber], [productDescription]) VALUES (3, N'Solid Belted Tapered Pants', 45, 7674, N'Made in USA')
INSERT [dbo].[Product] ([categoryID], [ProductName], [productPrice], [productNumber], [productDescription]) VALUES (3, N'Asymmetrical Waist Fold Pleated Pants', 43, 345, N'Made in USA')
INSERT [dbo].[Product] ([categoryID], [ProductName], [productPrice], [productNumber], [productDescription]) VALUES (3, N'Tall Zipper Back Solid Palazzo Pants', 34, 42, N'Made in Viet Nam')
INSERT [dbo].[Product] ([categoryID], [ProductName], [productPrice], [productNumber], [productDescription]) VALUES (3, N'High Waist Velvet Flare Leg Pants', 37, 778, N'Made in Viet Nam')
INSERT [dbo].[Product] ([categoryID], [ProductName], [productPrice], [productNumber], [productDescription]) VALUES (3, N'Tall Zipper Back Solid Palazzo Pants', 39, 9765, N'Made in Viet Nam')
INSERT [dbo].[Product] ([categoryID], [ProductName], [productPrice], [productNumber], [productDescription]) VALUES (3, N'Solid High Waist Belted Wide Leg Pants', 29, 3467, N'Made in Viet Nam')
INSERT [dbo].[Product] ([categoryID], [ProductName], [productPrice], [productNumber], [productDescription]) VALUES (4, N'Turtleneck Lantern Sleeve Sweater Dress', 26, 463, N'Made in Viet Nam')
INSERT [dbo].[Product] ([categoryID], [ProductName], [productPrice], [productNumber], [productDescription]) VALUES (4, N'Rolled Neck Ripped Design Hem Cable Knit Sweate', 28, 422, N'Made in Viet Nam')
INSERT [dbo].[Product] ([categoryID], [ProductName], [productPrice], [productNumber], [productDescription]) VALUES (4, N'Drop Shoulder Pointelle Knit Sweater Dress', 21, 2322, N'Made in China')
INSERT [dbo].[Product] ([categoryID], [ProductName], [productPrice], [productNumber], [productDescription]) VALUES (4, N'Raw Trim Cable Knit Sweater Dress', 36, 242, N'Made in China')
INSERT [dbo].[Product] ([categoryID], [ProductName], [productPrice], [productNumber], [productDescription]) VALUES (4, N'High Neck Bishop Sleeve Sweater Dress Without Belt', 24, 75, N'Made in China')
INSERT [dbo].[Product] ([categoryID], [ProductName], [productPrice], [productNumber], [productDescription]) VALUES (5, N'EMERY ROSE Shirred Waist Geo Print Shorts', 32, 675, N'Made in China')
INSERT [dbo].[Product] ([categoryID], [ProductName], [productPrice], [productNumber], [productDescription]) VALUES (5, N'Shirred Waist Geo Print Shorts', 12, 575, N'Made in China')
INSERT [dbo].[Product] ([categoryID], [ProductName], [productPrice], [productNumber], [productDescription]) VALUES (5, N'Knot Waist Patched Slant Pocket Raw Hem Shorts', 10, 876, N'Made in China')
INSERT [dbo].[Product] ([categoryID], [ProductName], [productPrice], [productNumber], [productDescription]) VALUES (5, N'Tartan Letter Patched Shorts', 11, 7855, N'Made in China')
INSERT [dbo].[Product] ([categoryID], [ProductName], [productPrice], [productNumber], [productDescription]) VALUES (6, N'Pointelle Knit Open Front Crop Cardigan', 23, 3, N'Made in USA')
INSERT [dbo].[Product] ([categoryID], [ProductName], [productPrice], [productNumber], [productDescription]) VALUES (6, N'Solid Drop Shoulder Crop Cardigan', 25, 235, N'Made in USA')
INSERT [dbo].[Product] ([categoryID], [ProductName], [productPrice], [productNumber], [productDescription]) VALUES (6, N'Purl Knit Button-Front Cropped Cardigan', 26, 532, N'Made in USA')
INSERT [dbo].[Product] ([categoryID], [ProductName], [productPrice], [productNumber], [productDescription]) VALUES (6, N'Floral Embroidery Button Front Cardigan', 27, 345, N'Made in USA')
INSERT [dbo].[Product] ([categoryID], [ProductName], [productPrice], [productNumber], [productDescription]) VALUES (6, N'V-neck Colorblock Button Up Cardigan', 30, 453, N'Made in USA')
INSERT [dbo].[Product] ([categoryID], [ProductName], [productPrice], [productNumber], [productDescription]) VALUES (6, N'Allover Heart Pattern Dual Pocket Cardigan', 21, 24, N'Made in USA')
GO

INSERT [dbo].[Color] ([colorName]) VALUES (N'Red')
INSERT [dbo].[Color] ([colorName]) VALUES (N'Yellow')
INSERT [dbo].[Color] ([colorName]) VALUES (N'Blue')
INSERT [dbo].[Color] ([colorName]) VALUES (N'Green')
INSERT [dbo].[Color] ([colorName]) VALUES (N'Brown')
INSERT [dbo].[Color] ([colorName]) VALUES (N'Black')
INSERT [dbo].[Color] ([colorName]) VALUES (N'White')
INSERT [dbo].[Color] ([colorName]) VALUES (N'Purple')
INSERT [dbo].[Color] ([colorName]) VALUES (N'Gray')
INSERT [dbo].[Color] ([colorName]) VALUES (N'Light Red')
INSERT [dbo].[Color] ([colorName]) VALUES (N'Dark Red')
INSERT [dbo].[Color] ([colorName]) VALUES (N'Light Green')
INSERT [dbo].[Color] ([colorName]) VALUES (N'Dark Green')
INSERT [dbo].[Color] ([colorName]) VALUES (N'Light Blue')
INSERT [dbo].[Color] ([colorName]) VALUES (N'Dark Blue')
INSERT [dbo].[Color] ([colorName]) VALUES (N'Pink')
INSERT [dbo].[Color] ([colorName]) VALUES (N'Turquoise')
GO
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (1, 3)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (1, 7)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (1, 16)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (2, 9)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (3, 6)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (4, 6)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (4, 12)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (4, 15)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (5, 5)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (5, 6)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (5, 7)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (6, 6)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (6, 7)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (6, 16)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (7, 2)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (7, 6)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (8, 5)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (8, 7)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (9, 5)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (10, 5)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (10, 7)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (11, 7)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (12, 5)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (12, 6)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (12, 13)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (13, 6)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (13, 11)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (13, 15)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (14, 6)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (14, 9)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (15, 6)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (15, 8)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (16, 6)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (16, 7)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (16, 9)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (17, 4)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (17, 5)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (17, 6)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (18, 5)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (18, 6)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (18, 13)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (19, 2)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (19, 6)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (19, 11)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (20, 2)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (20, 6)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (20, 7)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (21, 2)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (21, 6)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (22, 6)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (22, 7)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (22, 9)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (23, 3)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (24, 4)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (25, 6)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (25, 7)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (25, 8)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (26, 6)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (26, 7)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (27, 2)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (27, 5)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (27, 6)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (28, 2)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (29, 7)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (30, 3)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (30, 14)
INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (30, 16)

INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (1, N'S')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (1, N'M')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (1, N'L')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (1, N'XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (1, N'XXL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (1, N'2XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (2, N'S')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (2, N'M')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (2, N'L')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (2, N'XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (2, N'XXL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (2, N'2XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (3, N'S')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (3, N'M')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (3, N'L')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (3, N'XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (3, N'XXL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (3, N'2XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (4, N'S')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (4, N'M')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (4, N'L')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (4, N'XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (4, N'XXL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (4, N'2XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (5, N'S')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (5, N'M')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (5, N'L')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (5, N'XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (5, N'XXL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (5, N'2XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (6, N'S')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (6, N'M')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (6, N'L')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (6, N'XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (6, N'XXL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (6, N'2XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (7, N'S')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (7, N'M')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (7, N'L')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (7, N'XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (7, N'XXL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (7, N'2XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (8, N'S')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (8, N'M')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (8, N'L')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (8, N'XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (8, N'XXL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (8, N'2XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (9, N'S')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (9, N'M')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (9, N'L')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (9, N'XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (9, N'XXL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (9, N'2XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (10, N'S')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (10, N'M')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (10, N'L')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (10, N'XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (10, N'XXL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (10, N'2XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (11, N'S')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (11, N'M')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (11, N'L')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (11, N'XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (11, N'XXL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (11, N'2XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (12, N'S')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (12, N'M')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (12, N'L')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (12, N'XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (12, N'XXL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (12, N'2XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (13, N'S')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (13, N'M')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (13, N'L')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (13, N'XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (13, N'XXL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (13, N'2XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (14, N'S')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (14, N'M')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (14, N'L')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (14, N'XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (14, N'XXL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (14, N'2XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (15, N'S')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (15, N'M')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (15, N'L')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (15, N'XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (15, N'XXL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (15, N'2XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (16, N'S')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (16, N'M')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (16, N'L')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (16, N'XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (16, N'XXL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (16, N'2XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (17, N'S')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (17, N'M')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (17, N'L')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (17, N'XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (17, N'XXL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (17, N'2XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (18, N'S')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (18, N'M')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (18, N'L')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (18, N'XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (18, N'XXL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (18, N'2XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (19, N'S')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (19, N'M')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (19, N'L')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (19, N'XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (19, N'XXL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (19, N'2XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (20, N'S')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (20, N'M')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (20, N'L')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (20, N'XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (20, N'XXL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (20, N'2XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (21, N'S')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (21, N'M')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (21, N'L')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (21, N'XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (21, N'XXL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (21, N'2XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (22, N'S')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (22, N'M')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (22, N'L')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (22, N'XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (22, N'XXL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (22, N'2XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (23, N'S')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (23, N'M')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (23, N'L')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (23, N'XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (23, N'XXL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (23, N'2XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (24, N'S')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (24, N'M')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (24, N'L')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (24, N'XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (24, N'XXL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (24, N'2XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (25, N'S')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (25, N'M')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (25, N'L')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (25, N'XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (25, N'XXL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (25, N'2XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (26, N'S')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (26, N'M')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (26, N'L')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (26, N'XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (26, N'XXL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (26, N'2XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (27, N'S')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (27, N'M')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (27, N'L')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (27, N'XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (27, N'XXL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (27, N'2XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (28, N'S')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (28, N'M')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (28, N'L')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (28, N'XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (28, N'XXL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (28, N'2XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (29, N'S')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (29, N'M')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (29, N'L')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (29, N'XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (29, N'XXL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (29, N'2XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (30, N'S')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (30, N'M')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (30, N'L')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (30, N'XL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (30, N'XXL')
INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (30, N'2XL')
GO