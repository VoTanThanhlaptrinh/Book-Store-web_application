
create database book_store
use book_store;
CREATE TABLE Image (
                img_id INT IDENTITY NOT NULL,
                file_name NVARCHAR(100) NOT NULL,
                file_type NVARCHAR(20) NOT NULL,
                description NVARCHAR(50) NOT NULL,
                create_date datetime NOT NULL,
                update_date datetime,
                CONSTRAINT Image_pk PRIMARY KEY (img_id)
)

CREATE TABLE Information (
                info_id INT IDENTITY NOT NULL,
                name NVARCHAR(50) NOT NULL,
                address NVARCHAR(255) NOT NULL,
                phone_number NVARCHAR(10) NOT NULL,
                cccd VARCHAR(12) NOT NULL,
                birth DATETIME NOT NULL,
                email NVARCHAR(255) NOT NULL,
                create_date datetime NOT NULL,
				update_date datetime,
                img_id INT NOT NULL,
                CONSTRAINT Infomation_pk PRIMARY KEY (info_id)
)

CREATE TABLE Admin (
                admin_id INT IDENTITY NOT NULL,
                username NVARCHAR(50) NOT NULL,
                password NVARCHAR(255) NOT NULL,
                status NVARCHAR(30) NOT NULL,
                info_id INT,
                create_date datetime NOT NULL,
                update_date datetime,
                CONSTRAINT Admin_pk PRIMARY KEY (admin_id)
)

CREATE TABLE User_1 (
                user_id INT IDENTITY NOT NULL,
                username NVARCHAR(50) NOT NULL,
                password NVARCHAR(255) NOT NULL,
                create_date datetime NOT NULL,
                info_id INT,
                CONSTRAINT User_1_pk PRIMARY KEY (user_id)
)

CREATE TABLE Order_1 (
                order_id INT IDENTITY NOT NULL,
                user_id INT NOT NULL,
                total_amount DECIMAL(10,2) NOT NULL,
                status NVARCHAR(20) NOT NULL,
                create_date datetime NOT NULL,
                update_date datetime,
                CONSTRAINT Order_1_pk PRIMARY KEY (order_id)
)

CREATE TABLE History_search (
                his_id INT IDENTITY NOT NULL,
                user_id INT NOT NULL,
                content NVARCHAR(100) NOT NULL,
                create_date datetime NOT NULL,
                CONSTRAINT History_search_pk PRIMARY KEY (his_id)
)

CREATE TABLE Cart (
                cart_id INT IDENTITY NOT NULL,
                user_id INT NOT NULL,
                status NVARCHAR(20) NOT NULL,
                create_date datetime NOT NULL,
                update_date datetime,
                CONSTRAINT Cart_pk PRIMARY KEY (cart_id)
)

CREATE TABLE Transaction_1 (
                transaction_id INT IDENTITY NOT NULL,
                order_id INT NOT NULL,
                user_id INT NOT NULL,
                currency NVARCHAR(10) NOT NULL,
                transaction_type NVARCHAR(20) NOT NULL,
                status NVARCHAR(20) NOT NULL,
                payment_method NVARCHAR(20) NOT NULL,
                description NVARCHAR(255) NOT NULL,
                create_date datetime NOT NULL,
                update_date datetime,
                CONSTRAINT Transaction_1_pk PRIMARY KEY (transaction_id)
)

CREATE TABLE Product_1 (
                product_id INT IDENTITY NOT NULL,
                added_by_admin INT NOT NULL,
                title NVARCHAR(100) NOT NULL,
                price money NOT NULL,
                description NVARCHAR(255) NOT NULL,
                type NVARCHAR(50) NOT NULL,
                img_id INT,
                create_date datetime NOT NULL,
                update_date datetime,
                CONSTRAINT Product_pk PRIMARY KEY (product_id)
)

CREATE TABLE Order_item (
                order_item_id INT IDENTITY NOT NULL,
                order_id INT NOT NULL,
                product_id INT NOT NULL,
                quantity TINYINT NOT NULL,
                price money NOT NULL,
                create_date datetime NOT NULL,
                update_date datetime,
                CONSTRAINT Order_item_pk PRIMARY KEY (order_item_id)
)

CREATE TABLE Transaction_item (
                transaction_item_id int IDENTITY NOT NULL,
                transaction_id INT NOT NULL,
                order_item_id INT NOT NULL,
                quantity TINYINT NOT NULL,
                price money NOT NULL,
                create_date datetime NOT NULL,
                update_date datetime,
                CONSTRAINT Transaction_item_pk PRIMARY KEY (transaction_item_id)
)

CREATE TABLE Cart_item (
                cart_item_id INT IDENTITY NOT NULL,
                cart_id INT NOT NULL,
                quantity TINYINT NOT NULL,
                product_id INT NOT NULL,
                create_date datetime NOT NULL,
                update_date datetime,
                CONSTRAINT Cart_item_pk PRIMARY KEY (cart_item_id)
)

CREATE TABLE Evaluate (
                evaluate_id INT IDENTITY NOT NULL,
                user_id INT NOT NULL,
                product_id INT NOT NULL,
                comment_id int not null,
                create_date datetime NOT NULL,
                update_date datetime,
                CONSTRAINT Evaluate_pk PRIMARY KEY (evaluate_id)
)

CREATE TABLE Comment (
                comment_id INT IDENTITY NOT NULL,
                rating TINYINT,
                content NVARCHAR(255) NOT NULL,
                create_date datetime NOT NULL,
                update_date datetime,
                CONSTRAINT Comment_pk PRIMARY KEY (comment_id)
)

ALTER TABLE Product_1 ADD CONSTRAINT Image_Product_fk
FOREIGN KEY (img_id)
REFERENCES Image (img_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Information ADD CONSTRAINT Image_Information_fk
FOREIGN KEY (img_id)
REFERENCES Image (img_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Admin ADD CONSTRAINT Information_Admin_fk
FOREIGN KEY (info_id)
REFERENCES Information (info_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE User_1 ADD CONSTRAINT Information_User_1_fk
FOREIGN KEY (info_id)
REFERENCES Information (info_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Product_1 ADD CONSTRAINT Admin_Product_fk
FOREIGN KEY (added_by_admin)
REFERENCES Admin (admin_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Evaluate ADD CONSTRAINT User_Evaluate_fk
FOREIGN KEY (user_id)
REFERENCES User_1 (user_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Transaction_1 ADD CONSTRAINT User_Transaction_fk
FOREIGN KEY (user_id)
REFERENCES User_1 (user_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Cart ADD CONSTRAINT User_Cart_fk
FOREIGN KEY (user_id)
REFERENCES User_1 (user_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE History_search ADD CONSTRAINT User_1_History_search_fk
FOREIGN KEY (user_id)
REFERENCES User_1 (user_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Order_1 ADD CONSTRAINT User_Order_fk
FOREIGN KEY (user_id)
REFERENCES User_1 (user_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Order_item ADD CONSTRAINT Order_Order_item_fk
FOREIGN KEY (order_id)
REFERENCES Order_1 (order_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Transaction_1 ADD CONSTRAINT Order_Transaction_fk
FOREIGN KEY (order_id)
REFERENCES Order_1 (order_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Cart_item ADD CONSTRAINT Cart_Cart_item_fk
FOREIGN KEY (cart_id)
REFERENCES Cart (cart_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Transaction_item ADD CONSTRAINT Transaction_Transaction_item_fk
FOREIGN KEY (transaction_id)
REFERENCES Transaction_1 (transaction_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Evaluate ADD CONSTRAINT Product_Evaluate_fk
FOREIGN KEY (product_id)
REFERENCES Product_1 (product_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Cart_item ADD CONSTRAINT Product_Cart_item_fk
FOREIGN KEY (product_id)
REFERENCES Product_1 (product_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Order_item ADD CONSTRAINT Product_Order_item_fk
FOREIGN KEY (product_id)
REFERENCES Product_1 (product_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Transaction_item ADD CONSTRAINT Order_item_Transaction_item_fk
FOREIGN KEY (order_item_id)
REFERENCES Order_item (order_item_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Evaluate ADD CONSTRAINT Evaluate_Comment_fk
FOREIGN KEY (comment_id)
REFERENCES Comment (comment_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION

SET IDENTITY_INSERT Image ON;
INSERT INTO Image (img_id, file_name, file_type, description, create_date, update_date)  
VALUES  
(1, '2030_nhung_xu_huong_lon_dinh_hinh_tuong_lai.jpg', 'image/jpeg', N'Ảnh bìa sách 2030', GETDATE(), NULL),  
(2, '33_chien_luoc_cua_chien_tranh.jpg', 'image/jpeg', N'Ảnh bìa sách chiến lược', GETDATE(), NULL),  
(3, '38_buc_thu_rockefeller_viet_cho_con_trai.jpg', 'image/jpeg', N'Ảnh bìa sách Rockefeller', GETDATE(), NULL),  
(4, '48_nguyen_tac_chu_chot_cua_quyen_luc.jpg', 'image/jpeg', N'Ảnh bìa sách quyền lực', GETDATE(), NULL),  
(5, '7_buoc_de_thay_doi_cuoc_doi.jpg', 'image/jpeg', N'Ảnh bìa sách thay đổi', GETDATE(), NULL),  
(6, 'chia_se_tu_trai_tim.jpg', 'image/jpeg', N'Ảnh bìa sách chia sẻ', GETDATE(), NULL),  
(7, 'con_duong_chang_may_ai_di.jpg', 'image/jpeg', N'Ảnh bìa sách tâm lý', GETDATE(), NULL),  
(8, 'cai_chet_cua_nen_dan_chu.jpg', 'image/jpeg', N'Ảnh bìa sách lịch sử', GETDATE(), NULL),  
(9, 'cay_cam_ngot_cua_toi.jpg', 'image/jpeg', N'Ảnh bìa sách cảm động', GETDATE(), NULL),  
(10, 'hieu_ve_trai_tim.jpg', 'image/jpeg', N'Ảnh bìa sách cảm xúc', GETDATE(), NULL),  
(11, 'how_psychology_works.jpg', 'image/jpeg', N'Ảnh bìa sách tâm lý học', GETDATE(), NULL),  
(12, 'khong_bao_gio_that_bai.jpg', 'image/jpeg', N'Ảnh bìa sách nghị lực', GETDATE(), NULL),  
(13, 'kiep_nao_ta_cung_tim_thay_nhau.jpg', 'image/jpeg', N'Ảnh bìa sách nhân duyên', GETDATE(), NULL),  
(14, 'lam_chu_business_analytics.jpg', 'image/jpeg', N'Ảnh bìa sách phân tích dữ liệu', GETDATE(), NULL),  
(15, 'len_nhat_chuyen_doi.jpg', 'image/jpeg', N'Ảnh bìa tập truyện', GETDATE(), NULL),  
(16, 'mot_thoang_ta_ruc_ro.jpg', 'image/jpeg', N'Ảnh bìa văn học', GETDATE(), NULL),  
(17, 'nghi_giau_lam_giau.jpg', 'image/jpeg', N'Ảnh bìa sách tư duy', GETDATE(), NULL),  
(18, 'nguoi_ba_tai_gioi_vung_saga.jpg', 'image/jpeg', N'Ảnh bìa câu chuyện gia đình', GETDATE(), NULL),  
(19, 'nguoi_dan_ong_mang_ten_ove.jpg', 'image/jpeg', N'Ảnh bìa tiểu thuyết', GETDATE(), NULL),  
(20, 'nha_gia_kim.jpg', 'image/jpeg', N'Ảnh bìa sách triết học', GETDATE(), NULL),  
(21, 'noi_chuyen_giu_mieng_im_lang.jpg', 'image/jpeg', N'Ảnh bìa sách giao tiếp', GETDATE(), NULL),  
(22, 'nuoc_my_trong_mat_trump.jpg', 'image/jpeg', N'Ảnh bìa sách chính trị', GETDATE(), NULL),  
(23, 'suoi_am_mat_troi.jpg', 'image/jpeg', N'Ảnh bìa sách tiếp nối', GETDATE(), NULL),  
(24, 'thuat_thao_tung.jpg', 'image/jpeg', N'Ảnh bìa sách tâm lý', GETDATE(), NULL),  
(25, 'tham_tu_lung_danh_conan.jpg', 'image/jpeg', N'Ảnh bìa sách trinh thám', GETDATE(), NULL),  
(26, 'thoi_dai_ai.jpg', 'image/jpeg', N'Ảnh bìa sách trí tuệ nhân tạo', GETDATE(), NULL),  
(27, 'truong_ca_achilles.jpg', 'image/jpeg', N'Ảnh bìa văn học cổ điển', GETDATE(), NULL),  
(28, 'trang.jpg', 'image/jpeg', N'Ảnh bìa sách văn học', GETDATE(), NULL),  
(29, 'tam_ly_hoc_toi_pham.jpg', 'image/jpeg', N'Ảnh bìa sách khoa học pháp luật', GETDATE(), NULL),  
(30, 'tam_ly_hoc_ve_tien.jpg', 'image/jpeg', N'Ảnh bìa tâm lý tài chính', GETDATE(), NULL),  
(31, 'toi_noi_gi_khi_chay_bo.jpg', 'image/jpeg', N'Ảnh bìa sách tự truyện', GETDATE(), NULL),  
(32, 'tu_duy_mo.jpg', 'image/jpeg', N'Ảnh bìa sách phát triển bản thân', GETDATE(), NULL),  
(33, 'tu_duy_nguoc.jpg', 'image/jpeg', N'Ảnh bìa sách đổi mới', GETDATE(), NULL),  
(34, 'tu_tot_den_vi_dai.jpg', 'image/jpeg', N'Ảnh bìa sách quản trị', GETDATE(), NULL),  
(35, 'dac_nhan_tam.jpg', 'image/jpeg', N'Ảnh bìa sách giao tiếp nghệ thuật', GETDATE(), NULL),  
(36, 'dua_tre_hieu_chuyen.jpg', 'image/jpeg', N'Ảnh bìa truyện ý nghĩa', GETDATE(), NULL);  

SET IDENTITY_INSERT Image off;

SET IDENTITY_INSERT Admin on;
INSERT INTO Admin (admin_id ,username, password, status, create_date, update_date)
VALUES
(1,'admin1', 'password1', 'Active',  GETDATE(), NULL),
(2,'admin2', 'password2', 'Active', GETDATE(), NULL);
SET IDENTITY_INSERT Admin off;


INSERT INTO Product_1 (added_by_admin, title, price, description, type, img_id, create_date, update_date)
VALUES
(1, N'2030 những xu hướng lớn sẽ định hình thế giới tương lai', 150000, N'Sách về xu hướng tương lai', N'Khoa học - Tương lai', 1, GETDATE(), NULL),
(1, N'33 chiến lược của chiến tranh', 180000, N'Sách chiến lược quân sự', N'Lịch sử - Quân sự', 2, GETDATE(), NULL),
(1, N'38 bức thư Rockefeller viết cho con trai', 200000, N'Lời dạy của Rockefeller', N'Kinh tế - Tài chính', 3, GETDATE(), NULL),
(1, N'48 nguyên tắc chủ chốt của quyền lực', 250000, N'Sách quản trị và quyền lực', N'Quản trị - Lãnh đạo', 4, GETDATE(), NULL),
(1, N'7 bước để thay đổi cuộc đời bạn mãi mãi', 130000, N'Hướng dẫn thay đổi cuộc đời', N'Phát triển bản thân', 5, GETDATE(), NULL),
(1, N'Chia sẻ từ trái tim', 120000, N'Tâm sự và chia sẻ cuộc sống', N'Phát triển bản thân', 6, GETDATE(), NULL),
(1, N'Con đường chẳng mấy ai đi', 190000, N'Sách về tâm lý và cuộc sống', N'Tâm lý học', 7, GETDATE(), NULL),
(1, N'Cái chết của nền dân chủ: Những bước tiến quyền lực của Hitler', 300000, N'Chính trị và lịch sử', N'Lịch sử - Chính trị', 8, GETDATE(), NULL),
(1, N'Cây cam ngọt của tôi', 150000, N'Câu chuyện cảm động về tuổi thơ', N'Truyện ngắn', 9, GETDATE(), NULL),
(1, N'Hiểu về trái tim', 170000, N'Sách về cảm xúc và tâm hồn', N'Tâm lý học', 10, GETDATE(), NULL),
(1, N'How Psychology Works - Hiểu hết về tâm lý học', 250000, N'Sách khoa học tâm lý', N'Tâm lý học', 11, GETDATE(), NULL),
(1, N'Không bao giờ là thất bại! Tất cả là thử thách', 220000, N'Tư duy và nghị lực sống', N'Phát triển bản thân', 12, GETDATE(), NULL),
(1, N'Kiếp nào ta cũng tìm thấy nhau', 180000, N'Tiểu thuyết về nhân duyên', N'Tiểu thuyết', 13, GETDATE(), NULL),
(1, N'Làm chủ Business Analytics - Phân tích dữ liệu để đi đến quyết định thông minh', 350000, N'Sách phân tích dữ liệu', N'Khoa học - Phân tích dữ liệu', 14, GETDATE(), NULL),
(1, N'Lén nhặt chuyện đời', 140000, N'Tập truyện ngắn về cuộc sống', N'Truyện ngắn', 15, GETDATE(), NULL),
(1, N'Một thoáng ta rực rỡ ở nhân gian', 190000, N'Tác phẩm văn học nổi tiếng', N'Tiểu thuyết', 16, GETDATE(), NULL),
(1, N'Nghĩ giàu & Làm giàu', 200000, N'Tư duy làm giàu', N'Kinh tế - Phát triển bản thân', 17, GETDATE(), NULL),
(1, N'Người bà tài giỏi vùng Saga', 150000, N'Câu chuyện gia đình xúc động', N'Truyện ngắn', 18, GETDATE(), NULL),
(1, N'Người đàn ông mang tên Ove', 180000, N'Tiểu thuyết trữ tình', N'Tiểu thuyết', 19, GETDATE(), NULL),
(1, N'Nhà giả kim', 170000, N'Tác phẩm triết học nổi tiếng', N'Tiểu thuyết', 20, GETDATE(), NULL),
(1, N'Nói chuyện là bản năng, giữ miệng là tu dưỡng, im lặng là trí tuệ', 150000, N'Sách giao tiếp và trí tuệ', N'Kỹ năng giao tiếp', 21, GETDATE(), NULL),
(1, N'Nước Mỹ trong mắt Trump - The United States of Trump', 300000, N'Sách chính trị', N'Lịch sử - Chính trị', 22, GETDATE(), NULL),
(1, N'Sưởi ấm mặt trời - Phần tiếp theo của Cây cam ngọt của tôi', 180000, N'Tiếp nối câu chuyện cảm động', N'Truyện ngắn', 23, GETDATE(), NULL),
(1, N'Thuật thao túng - Góc tối ẩn sau mỗi câu nói', 220000, N'Sách phân tích tâm lý', N'Tâm lý học', 24, GETDATE(), NULL),
(1, N'Thám tử lừng danh Conan - Tiểu thuyết - Ngôi sao 5 cánh 1 triệu đô', 250000, N'Tiểu thuyết trinh thám', N'Trinh thám', 25, GETDATE(), NULL),
(1, N'Thời đại AI và tương lai loài người chúng ta', 350000, N'Sách về trí tuệ nhân tạo', N'Công nghệ - AI', 26, GETDATE(), NULL),
(1, N'Trường ca Achilles', 200000, N'Tác phẩm văn học cổ điển', N'Tiểu thuyết', 27, GETDATE(), NULL),
(1, N'Trắng', 150000, N'Sách văn học', N'Văn học', 28, GETDATE(), NULL),
(1, N'Tâm lý học tội phạm - Phác họa chân dung kẻ phạm tội', 280000, N'Sách khoa học và pháp luật', N'Tâm lý học - Pháp luật', 29, GETDATE(), NULL),
(1, N'Tâm lý học về tiền', 200000, N'Tiền bạc và tâm lý', N'Tâm lý học - Kinh tế', 30, GETDATE(), NULL),
(1, N'Tôi nói gì khi nói về chạy bộ', 150000, N'Sách tự truyện', N'Tự truyện', 31, GETDATE(), NULL),
(1, N'Tư duy mở', 180000, N'Sách tư duy và phát triển bản thân', N'Phát triển bản thân', 32, GETDATE(), NULL),
(1, N'Tư duy ngược dịch chuyển thế giới', 250000, N'Sách đổi mới tư duy', N'Phát triển bản thân', 33, GETDATE(), NULL),
(1, N'Từ tốt đến vĩ đại', 300000, N'Tư duy quản trị kinh doanh', N'Quản trị - Kinh doanh', 34, GETDATE(), NULL),
(1, N'Đắc nhân tâm', 200000, N'Sách nghệ thuật giao tiếp', N'Kỹ năng giao tiếp', 35, GETDATE(), NULL),
(1, N'Đứa trẻ hiểu chuyện thường không có kẹo ăn', 180000, N'Truyện ngắn ý nghĩa', N'Truyện ngắn', 36, GETDATE(), NULL);

alter table Image add object_type varchar(20);

update Image set object_type = 'product';

alter table User_1 add update_date datetime;

alter table Infomation alter column img_id int null;

alter table Product_1 add quantity int null;

update Product_1 set quantity = 1000

alter table User_1 add email nvarchar(255);

alter table Admin add email nvarchar(255);

alter table User_1 add unique (username)