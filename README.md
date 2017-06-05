This is is spring boot application with Spring data jpa and angular js.
The purpose of this application is  to show the list of universities,regisetered students and also student can register.
To Run this appliaction create a table


create table student (
   id BIGINT NOT NULL AUTO_INCREMENT,
   firstName VARCHAR(30) NOT NULL,
   lastName  VARCHAR(30) NOT NULL,
   courseName VARCHAR(30) NOT NULL,
   universityName VARCHAR(150) NOT NULL,
   address VARCHAR(200) NOT NULL,
   phone VARCHAR(30) NOT NULL,
   email VARCHAR(30) NOT NULL,
   zip  VARCHAR(30) NOT NULL,
   PRIMARY KEY (id)
);

Import this project into STS(Spring Tool suite) , open StudentCourseApplication.java file in sts, right click on StudentCourseApplication file,
and Run as java application.

when you run this application as java appliaction spring boot internally does required configuration and deploys in to tomcat server.

To navigate UI,go to any browser open this URL.http://localhost:8000/menu.

it will show the links to register,show the list of universities and show the registered students

To see screen please refer below link
https://github.com/sureshdvp/StudentCourseApplication/blob/master/StudentCourseApp%20screens.docx
