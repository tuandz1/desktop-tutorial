USE [master]
GO
/*******************************************************************************
   Drop database if it exists
********************************************************************************/
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'BetaShop')
BEGIN
	ALTER DATABASE BetaShop SET SINGLE_USER WITH ROLLBACK IMMEDIATE
	DROP DATABASE BetaShop
END

GO
 
CREATE  DATABASE BetaShop
GO

USE BetaShop
GO

--CREATE TABLES
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO 

create table Categories(
id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
ca_name nvarchar(50),
);

create table brand(
id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
[brand_name] nvarchar(100),
[brand_img] nvarchar(max)
)

CREATE TABLE Product (
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    proName NVARCHAR(250) NOT NULL,
    caid INT,
    [description] NVARCHAR(500),
    img NVARCHAR(MAX),
    price MONEY,
    rate DECIMAL(3, 2),
    brand_id int,
    stockQuantity INT,
    publication_date DATE,
    CONSTRAINT FK_Product_Categories FOREIGN KEY (caid) REFERENCES Categories(id),
	CONSTRAINT FK_Product_brand FOREIGN KEY (brand_id) REFERENCES brand(id)
);

create table [Role](
 id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
 role_name nvarchar(250)
 )

 create table SecurityQuestions(
  id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
 ques_name nvarchar(250)
 )


create table Account(
 id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
 acc_name nvarchar(50) not null,
 email nvarchar(250) not null,
 adress nvarchar(500) not null,
 cus_password nvarchar(16) not null,
 full_name nvarchar(50) not null,
 phone nvarchar(25),
 role_id int not null,
 avatar nvarchar(500),
 ques_id int,
 answer nvarchar(250),
  CONSTRAINT FK_Customer_Role FOREIGN KEY (role_id) REFERENCES [Role](id),
  CONSTRAINT FK_Customer_SecurityQuestions FOREIGN KEY (ques_id) REFERENCES SecurityQuestions(id)
 )

 CREATE TABLE OrderStatus (
    StatusID INT PRIMARY KEY,     -- Primary key column
    [Name] NCHAR(10),               -- Name of the order status
    Description VARCHAR(50)       -- Description of the order status
);

CREATE TABLE PaymentMethod (
    PaymentMethodID INT PRIMARY KEY,  -- Primary key column
    Name VARCHAR(50),                 -- Name of the payment method
    Description VARCHAR(100)          -- Description of the payment method
);

 create table [Order](
  id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
  cus_id int,
  orderDate date,
  status_id int,
  adress nvarchar(500),
  phone nvarchar(16),
  deliverDate date,
  payment_id int,
  totalAmount money
   CONSTRAINT FK_Order_Account FOREIGN KEY (cus_id) REFERENCES Account(id),
   CONSTRAINT FK_Order_OrderStatus FOREIGN KEY (status_id) REFERENCES OrderStatus(StatusID),
   CONSTRAINT FK_Order_PaymentMethod  FOREIGN KEY (payment_id) REFERENCES PaymentMethod (PaymentMethodID)
 );

 create table [orderDetail](
 id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
 order_id int,
 product_id int, 
 total_price money,
 cus_name nvarchar(50)
 CONSTRAINT FK_orderDetail_Order FOREIGN KEY (order_id) REFERENCES [Order](id),
 CONSTRAINT FK_orderDetail_Product FOREIGN KEY (product_id) REFERENCES Product(id),
 )


 create table ProductImg(
  id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
  pro_id int not null,
  img_link nvarchar(max),
  CONSTRAINT FK_ProductImg_Product FOREIGN KEY (pro_id) REFERENCES Product(id)
  )

CREATE TABLE [ProductComment](
	[CommentId] [int] primary key IDENTITY(1,1) NOT NULL,
	[ProId] [int] NOT NULL,
	[CommentText] [nvarchar](200) NOT NULL,
	[Rating] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	  CONSTRAINT FK_ProductComment_Product FOREIGN KEY (ProId) REFERENCES Product(id)
	)

	CREATE TABLE [ResponseComment](
	[ResponseId] [int] primary key IDENTITY(1,1) NOT NULL,
	[CommentId] [int] NOT NULL,
	[ResponseText] [nvarchar](200) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL
	 CONSTRAINT FK_ResponseComment_ProductComment FOREIGN KEY (ResponseId) REFERENCES ProductComment(CommentId)
	)

	CREATE TABLE Discount (
    DiscountID INT PRIMARY KEY, -- Primary key column
    WatchID INT,                -- Foreign key column to reference Watch table (assuming it exists)
    Amount FLOAT,               -- Discount amount
    StartDate DATE,             -- Start date of the discount
    EndDate DATE,               -- End date of the discount
    [Status] BIT                  -- Status of the discount (active/inactive)
	 CONSTRAINT FK_Discount_Product FOREIGN KEY (WatchID) REFERENCES Product(id)
);

CREATE TABLE Refund (
    OrderDetailID INT PRIMARY KEY,  -- Primary key column, assumed to be a reference to the order detail
    RefundDate DATE,                -- Date when the refund was issued
    Reason VARCHAR(MAX),            -- Reason for the refund
    Image TEXT,                     -- Image related to the refund (e.g., picture of the returned item)
    ReturnStatus BIT                -- Status of the return (1 for processed, 0 for not processed)
);

CREATE TABLE UserCart (
    UserCartID INT PRIMARY KEY,  -- Primary key column
    UserID INT,                  -- Foreign key column to reference User table (assuming it exists)
    WatchID INT,                 -- Foreign key column to reference Watch table (assuming it exists)
    Quantity INT,                -- Quantity of the item in the cart
    TotalPrice FLOAT             -- Total price for the quantity of items in the cart
	 CONSTRAINT FK_UserCart_Product FOREIGN KEY (WatchID) REFERENCES Product(id),
	  CONSTRAINT FK_UserCart_Account FOREIGN KEY (UserID) REFERENCES Account(id)
);

CREATE TABLE UserWishlist (
    UserID INT,         -- Foreign key column to reference User table (assuming it exists)
    WatchID INT,        -- Foreign key column to reference Watch table (assuming it exists)
    PRIMARY KEY (UserID, WatchID) , -- Composite primary key
	 CONSTRAINT FK_UserWishlist_Product FOREIGN KEY (WatchID) REFERENCES Product(id),
	  CONSTRAINT FK_UserWishlist_Account FOREIGN KEY (UserID) REFERENCES Account(id)
);

INSERT INTO [Categories]
           ([ca_name])
     VALUES
           ('Automatic Watches'), ('Mechanical Watches'), ('Solar Watches'), ('Smart Watches')

INSERT INTO [brand]
           ([brand_name]
           ,[brand_img])
     VALUES
           ('Rolex','https://wallpapercave.com/wp/icvgMMi.jpg'),
		   ('Cartier','https://media.gq-magazine.co.uk/photos/5d138db92881cc19cd0a75a7/16:9/w_2560%2Cc_limit/cartier-hp-gq-8mar18_b.jpg'),
		   ('Audemars Piguet','https://monochrome-watches.com/wp-content/uploads/2018/01/Audemars-Piguet-Royal-Oak-Extra-Thin-Tourbillon-Tapisserie-Evolutive-26522-SIHH-2018-2.jpg'),
		   ('Patek Philippe','https://c4.wallpaperflare.com/wallpaper/1014/521/125/clock-patek-philippe-time-wallpaper-thumb.jpg'),
		   ('Seiko','https://c1.wallpaperflare.com/preview/700/912/914/accessory-analogue-close-up-seiko.jpg'),
		   ('Casio','https://images.pexels.com/photos/158741/gshock-watch-sports-watch-stopwatch-158741.jpeg')

INSERT INTO [Product]
           ([proName]
           ,[caid]
           ,[description]
           ,[img]
           ,[price]
           ,[rate]
           ,[brand_id]
           ,[stockQuantity]
           ,[publication_date])
     VALUES
           ('Rolex Automatic 116659 SABR',1,N'.Đồng hồ có lớp vỏ được làm từ vàng trắng đắt giá. Hơn thế nữa nó còn được kết hợp thêm với khung viền xanh đậm giúp nổi bật hơn. Sản phẩm vừa toát lên vẻ sang trọng đẳng cấp mà vừa lịch sự, vô cùng cuốn hút.','https://lh3.googleusercontent.com/proxy/fMBNqMRQ1opydCZ9gi4rCtqnoSxtSUd5knI9FZGqF9cDkf2ATnkfFgF0R8mSWbfuBU3LxvmhzIb17ITYWZXgQfMYZBJL19Bicge2taON_tMwBA'
           ,4443.000
		   ,5.0
           ,1
           ,12
           ,'02-06-2024')
		   ,('Rolex Automatic 116595 RBOW-0001',1,N'Sản phẩm có đường kính bề mặt là 40mm nhỏ gọn. Thêm vào đó là lớp vỏ được chế tác bằng vàng hồng tạo hành tổng thể sản phẩm vô cùng đẹp mắt.Không những thế, sản phẩm Rolex đồng hồ cơ còn được trang bị khả năng chống nước ấn tượng. Đồng hồ Rolex Automatic 116595 RBOW-0001 có thể chống nước lên đến 10 atm.','https://img.staticdj.com/2a65651fdb51fd206c5ae153ed16c2f6_1080x.png'
           ,350.00 
		   ,5.0
           ,1
           ,9
           ,'02-06-2024'),
		   ('Rolex Automatic 86405PAVEPM',1,N'Điểm nhấn của sản phẩm nằm ở mặt đồng hồ thiết kế tinh tế, chất lượng. Cụ thể các nghệ nhân đã lát kim cương cho mặt đồng hồ. Chưa dừng lại ở đó họ còn sử dụng bộ kim vàng Everose đẳng cấp kết hợp điểm giờ số La Mã','https://euluxury.vn/upload_images/20220811/files/rolex_81405rbr-0001.jpg'
           ,444.003
		   ,5.0
           ,1
           ,31
           ,'02-06-2024'),
		   ('Rolex Automatic 116588TBR-0003',1,N'Điểm độc đáo trên sản phẩm đó là dây đồng hồ được làm bằng cao su cao cấp. Đồng thời kết hợp với khung kim cương đã khiến bao nhiêu con tim thổn thức vì vẻ đẹp ấy. Mặt kính đồng hồ có đường kính 40mm nhỏ gọn và phù hợp với phần lớn nam giới.','https://thewatchclub.vn/wp-content/uploads/2023/03/Rolex-Cosmograph-Daytona-116588tbr.jpg'
           ,3677.000
		   ,4.8
           ,1
           ,53
           ,'02-06-2024'),
		   (' ROLEX DATEJUST',1,N'Datejust luôn là biểu tượng của phong cách cổ điển được ưa chuộng trong số các loại đồng hồ Rolex. Dù đã ra mắt nhiều phiên bản qua từng thời kì, các dòng Rolex Datejust vẫn giữ vững được nét đẹp vượt thời gian với khả năng chống nước tối ưu','https://cdn0585.cdn4s.com/media/rolex/23.png'
           ,290.00
		   ,4.9
           ,1
           ,57
           ,'02-06-2024'),
		   ('ROLEX OYSTER PERPETUAL',1,' Khí chất Oyster nổi bật với chất liệu thép Oystersteel độc quyền của Rolex với độ sáng, độ bền và vẻ đẹp vượt trội hơn so với thép không gỉ thông thường.','https://e7.pngegg.com/pngimages/545/747/png-clipart-rolex-submariner-rolex-oyster-perpetual-datejust-watch-rolex-thumbnail.png'
           ,4.443
		   ,5.0
           ,1
           ,12
           ,'02-06-2024'),
		   (' ROLEX SKY-DWELLER',2,'Sky-Dweller được mệnh danh là di sản của hành trình đổi mới cách tân. Đây được xem là thiết kế để đồng hành cùng những nhà du hành vũ trụ với mặt số nhiều chức năng như: lịch ngày, lịch năm, khả năng năng tự phân biệt tháng 30 và 31 ngày','https://bossluxurywatch.vn/uploads/san-pham/rolex/sky-dweller/rolex-sky-dweller-42mm-326235-0005.png'
           ,3.875
		   ,5.0
           ,1
           ,12
           ,'02-06-2024'),
		   ('Cartier Tank',1,'Lấy cảm hứng từ những chiếc xe tăng quân sự trong Thế chiến thứ nhất, đồng hồ không chỉ đủ dùng như một chiếc đồng hồ đeo tay thoải mái đeo hàng ngày mà tính thẩm mỹ lấy cảm hứng từ phong cách hoài cổ ','https://cdn-gassan.imgix.net/811321/811321_1.png?auto=format&lossless=true&w=768'
           ,4.443
		   ,5.0
           ,2
           ,12
           ,'02-06-2024'),
		   ('Santos de Cartier',2,'Dòng đồng hồ này đã được sản xuất hơn 100 năm và là một trong số những chiếc đồng hồ dành cho phi công đầu tiên trên thế giới khi bộ sưu tập lần đầu ra mắt. ','https://w7.pngwing.com/pngs/251/53/png-transparent-iconic-watches-cartier-santos-watch-strap-watch-watch-accessory-accessories-clothing-accessories.png'
           ,14.443
		   ,5.0
           ,2
           ,11
           ,'02-06-2024'),
		    ('Cartier Panthere',1,'Đồng hồ Cartier Panthere cũng được yêu thích rộng rãi vì chúng là đồng hồ nam tính. Các loại đồng hồ đeo tay sang trọng đa dạng của Cartier sẽ luôn là niềm khao khát của những người sành đồng hồ','https://www.cartier.sg/content/dam/rcq/car/14/37/98/6/1437986.png.scale.314.high.panth%C3%A8re-de-cartier-watch-rose-gold.png'
           ,14.443
		   ,5.0
           ,2
           ,11
           ,'02-06-2024'),
		    ('Cartier Rotonde de Cartier Silver Dial 18kt Rose Gold W1556252',2,'Vỏ và kim đồng hồ được làm từ chất liệu thép không gỉ phủ một lớp tạo độ bóng ánh lên vẻ ngoài sang trọng. Bên ngoài lớp vỏ còn được bọc thêm vàng (ánh hồng) 18K cứng cáp càng làm tăng thêm sự đẳng cấp cho chiếc đồng hồ.','https://cdn2.jomashop.com/media/catalog/product/p/r/preowned-cartier-rotonde-de-cartier-silver-dial-mens-watch-w1556252.jpg'
           ,14.443
		   ,5.0
           ,2
           ,34
           ,'02-06-2024'),
		    ('Cartier Pasha Automatic Silver Dial',1,'Dòng đồng hồ này đã được sản xuất hơn 100 năm và là một trong số những chiếc đồng hồ dành cho phi công đầu tiên trên thế giới khi bộ sưu tập lần đầu ra mắt. ','https://www.pragnell.co.uk/images/original/77d96783-3a9a-411f-849b-e275b76884c8.jpg'
           ,14.443
		   ,5.0
           ,2
           ,13
           ,'02-06-2024'),
		    ('Perpetual Calendar in Blue Ceramic',1,'Ngoài màu xanh dương rực rỡ của bộ vỏ mỏng, vành hình bát giác, dây đeo tay tích hợp và mặt số “Grande Tapisserie”, mọi thứ khác vẫn như cũ. Điều này có nghĩa là vỏ có kích thước 41mm quen thuộc và bộ máy cung cấp năng lượng cho đồng hồ là bộ máy Calibre 5134 siêu mỏng.','https://www.icebox.com/unsafe/600x398/icebox-jewelry.s3.amazonaws.com/products/1c4ef438f7600a95c586673d00d3c414.png'
           ,14.443
		   ,5.0
           ,3
           ,13
           ,'02-06-2024'),
		     ('Selfwinding Flying Tourbillon Extra-Thin',2,'Petite Tapisserie màu tím nổi bật với một flying tourbillon ở vị trí 6 giờ. RD là viết tắt của nơi nghiên cứu và phát triển và những chiếc đồng hồ đặc biệt này là nơi thương hiệu đồng hồ Audemars Piguet ','https://firstclasstimepieces.com/cdn/shop/products/26730ti-oo-1320ti-04-a6_1200x630.png?v=1667234749'
           ,14.443
		   ,5.0
           ,3
           ,13
           ,'02-06-2024'),
		     ('Tourbillon Openworked ',1,'Giới hạn chỉ 50 chiếc, chiếc đồng hồ này có bộ vỏ 41mm, bao gồm vỏ gốm màu xanh lam và vành, càng nối dây và mặt sau bằng vàng trắng. Có tinh thể sapphire cong kép quen thuộc ở mặt số, che chắn cho bộ máy Calibre 2948 lên dây cót bằng tay có thể nhìn thấy được.','https://www.watchaser.com/cdn/shop/files/audemars-piguet-11-59-grey-gold-skeleton-tourbillon_800x.png?v=1689946916'
           ,14.443
		   ,5.0
           ,3
           ,1
           ,'02-06-2024'),
		     ('Perpetual Calendar “John Mayer” ',2,'Dù nhìn vào mặt trước hay mặt sau của đồng hồ, bộ máy tự lên dây cót được thiết kế và trang trí đẹp mắt của Calibre 2952 vẫn được trưng bày một cách mãn nhãn. ','https://bizweb.dktcdn.net/thumb/grande/100/364/978/articles/do-ng-ho-john-mayer-ap-royal-oak-perpetual-calendar-4.png?v=1709861914290'
           ,14.443
		   ,5.0
           ,3
           ,1
           ,'02-06-2024'),
		     ('Complications Mechanical Ivory',2,'Sản phẩm gây ấn tượng mạnh mẽ với khách hàng với thiết kế sang trọng, tinh tế. Kết hợp với đó là thiết kế lộ máy càng làm sản phẩm trở nên cuốn hút hơn bao giờ hết. Phần vỏ đồng hồ được làm bằng thép cao cấp mạ vàng. ','https://miojewelry.com/wp-content/uploads/2017/11/5146_1J_001_1.jpg'
           ,14.443
		   ,5.0
           ,4
           ,13
           ,'02-06-2024'),
		     ('Complications Moonphase',2,'Vỏ đồng hồ được mạ vàng tinh xảo, chất lượng. Đi kèm với đó là dây đeo da cá sấu thượng hạng vừa sang trọng vừa tạo cảm giác đeo cực kỳ dễ chịu, thoải mái. ','https://frodos.com.vn/wp-content/uploads/2020/10/Patek-Philippe-Complications-5396R-015-Annual-Calendar-Moonphase-scaled-600x600.jpg.webp'
           ,14.443
		   ,5.0
           ,4
           ,13
           ,'02-06-2024'),
		     ('Patek Philippe Twenty 4 ',2,'Không chỉ chú trọng sản xuất các sản phẩm đồng hồ nam mà Patek Philippe cũng dành sự quan tâm đến phái đẹp. Điều này thể hiện qua từng đường nét thiết kế của sản phẩm. Khung của đồng hồ được làm từ thép không gỉ chắc chắn.','https://bossluxurywatch.vn/uploads/san-pham/patek-philippe/twenty-4/patek-philippe-twenty4-7300-1200a-001.png'
           ,14.443
		   ,5.0
           ,4
           ,13
           ,'02-06-2024'),
		     ('Grand Seiko ',3,'Grand Seiko, model đồng hồ đeo tay đẳng cấp nhất của Seiko, phù hợp với những độc giả đang tìm kiếm một chiếc đồng hồ đeo tay cao cấp mang đậm bản sắc truyền thống và ý nghĩa lâu đời. ','https://hpauthentic.vn/wp-content/uploads/2023/02/SLGH013G.png'
           ,14.443
		   ,5.0
           ,4
           ,13
           ,'02-06-2024')

		   create table [Block](
		   proid int,
		   accid int,
		   brandid int,
		    
		   );

		   ALTER TABLE OrderDetail
ADD quantity INT;