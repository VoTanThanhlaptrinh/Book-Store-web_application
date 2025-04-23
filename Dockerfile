ử dụng image chính thức của Tomcat 10.1

FROM tomcat:10.1



# Xoá ứng dụng mặc định (nếu bạn muốn trang chủ sạch)

RUN rm -rf /usr/local/tomcat/webapps/*



# Copy WAR của bạn vào thư mục webapps và đổi tên thành ROOT.war để chạy trực tiếp ở /

COPY build/libs/app.war /usr/local/tomcat/webapps/book_store.war



# Mở cổng 8080

EXPOSE 8080



# Khởi động Tomcat (đã mặc định trong image)

CMD ["catalina.sh", "run"]


