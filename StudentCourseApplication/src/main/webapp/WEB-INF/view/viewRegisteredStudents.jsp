<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registered Student List</title>
</head>
<body>
<h1>Registered Students List</h1>

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
<script>
var app = angular.module('showStudentApp', []);
app.controller('showStudentCtrl', function($scope, $http) {
	 $http.get("http://localhost:8000/fetchRegisteredStudents")
    .then(function (response) {$scope.students = response.data;
    });
});


</script>


   <div ng-app="showStudentApp" ng-controller="showStudentCtrl"> 
     <h1>View Students</h1>
     <div style="overflow:auto;height:400px;width:1000px">
    <table>
    <tr>
    <th>First Name</th>
    <th >Last Name</th>
    <th>Course Name</th>
    <th >Universiti Name</th>
    <th >Address</th>
    <th>Phone</th>
    <th >Email</th>
    <th >Zip</th>
    
  </tr>

  <tr ng-repeat="student in students">
  	  <td>{{ student.firstName}}</td>
  	  <td>{{ student.lastName}}</td>
  	  <td>{{ student.courseName}}</td>
      <td>{{ student.universityName}}</td>
      <td>{{ student.address}}</td>
      <td>{{ student.phone}}</td>
      <td>{{ student.email}}</td>
      <td>{{ student.zip}}</td>
  </tr>
</table>
</div>
</div>
</body>
</html>