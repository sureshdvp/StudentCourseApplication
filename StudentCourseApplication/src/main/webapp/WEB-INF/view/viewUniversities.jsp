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
<title>Universities</title>

</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
<script>
var app = angular.module('courseApp', []);
app.controller('showUniversityCtrl', function($scope, $http) {
	 $http.get("http://localhost:8000/getUniversities")
    .then(function (response) {$scope.universities = response.data;
    });
});


</script>


   <div ng-app="courseApp" ng-controller="showUniversityCtrl"> 
     <h1>View Universites</h1>
     <a href="http://localhost:8000/menu">Back</a><br><br>
     <div style="overflow:auto;height:400px;width:1000px">
    <table>
    <tr>
    <th>Code</th>
    <th >Country</th>
    <th>Domain</th>
    <th >Name</th>
    <th >Web page</th>
    
  </tr>
  <tr ng-repeat="universiti in universities">
  	  <td>{{ universiti.alpha_two_code}}</td>
  	  <td>{{ universiti.country}}</td>
  	  <td>{{ universiti.domain}}</td>
      <td>{{ universiti.name}}</td>
      <td>{{ universiti.web_page}}</td>
  </tr>
</table>
</div>
</div>
</body>
</html>