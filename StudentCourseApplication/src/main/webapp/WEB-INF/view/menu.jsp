<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}
th, td {
    padding: 5px;
    text-align: left;    
}
</style>
</head>
<body>
<h1>Student course management system</h1>
<a href="http://localhost:8000/register">Click to Register</a><br><br>


<a href ="http://localhost:8000/viewUniversities">View Universities</a><br><br>

<a href="http://localhost:8000/viewRegisteredStudents">View Registered students</a><br><br>

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
   <div ng-app="courseApp" ng-controller="showUniversityCtrl"> 
     
     <div style="overflow:auto;height:300px;width:1000px">
    <table ng-show="show" style="width:100%;height:100%">
    <tr>
    <th>Code</th>
    <th >Country</th>
    <th>domain</th>
    <th >name</th>
    <th >web page</th>
    
  </tr>
  <tr ng-repeat="universiti in universities">
  	  <td>{{ universiti.alpha_two_code}}</td>
  	  <td>{{ universiti.country}}</td>
  	  <td>{{ universiti.domain}}</td>
      <td>{{ universiti.name}}</td>
      <td>{{ universiti.web_page}}</td>
  
   

    <!-- <td>{{ x.Country }}</td> -->
  </tr>
</table>
</div>
</div>

<script>
var app = angular.module('courseApp', []);
app.controller('showUniversityCtrl', function($scope, $http) {
	$scope.show=true;
    $http.get("http://localhost:8000/getUniversities")
    .then(function (response) {$scope.universities = response.data;
    });
});

function showUniversities1(){
	 alert("hello")
	 alert($scope.show)
	 
	if($scope.show){
		 $scope.show = false;
	}else{
		 $scope.show = true;
	}
    
 }
</script>
     


</body>
</html>