<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


</head>
<body >
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>

	<script type="text/javascript">
            var app = angular.module("StudentManagement", []);
         
            //Controller Part
            app.controller("StudentManagementController", function($scope, $http) {
         
                //Initialize page with default data which is blank in this example
                $scope.students = [];
                $scope.form = {
                    id : -1,
                    firstName : "",
                    lastName : "",
                    courseName : "",
                    universityName : "",
                    Address : "",
                    Phone : "",
                    email : "",
                    Zip : ""
                    
                };
         
                //Now load the data from server
                _refreshPageData();
         
                //HTTP POST/PUT methods for add/edit student
                $scope.submitStudent = function() {
         
                	
                    var method = "";
                    var url = "";
                    if ($scope.form.id == -1) {
                    	console.log("eeeee,,,")
                        //Id is absent so add student - POST operation
                        method = "POST";
                        url = 'http://localhost:8000/registerStudent';
                    } else {
                        //If Id is present, it's edit operation - PUT operation
                        method = "PUT";
                        url = 'http://localhost:8000/students/' + $scope.form.id;
                    }
         
                    $http({
                        method : method,
                        url : url,
                        data : angular.toJson($scope.form),
                        headers : {
                            'Content-Type' : 'application/json'
                        }
                    }).then( _success, _error );
                };
         
                //HTTP DELETE- delete student by Id
                $scope.removeStudent = function(student) {
                    $http({
                        method : 'DELETE',
                        url : 'students/' + student.id
                    }).then(_success, _error);
                };
 
                //In case of edit student, populate form with student data
                $scope.editStudent = function(student) {
                	$scope.form.id = student.id;
                	$scope.form.firstName = student.firstName;
                    $scope.form.lastName = student.lastName;
                    $scope.form.courseName = student.courseName;
                    $scope.form.universityName = student.universityName;
                    $scope.form.address = student.address;
                    $scope.form.phone = student.phone;
                    $scope.form.email = student.email;
                    $scope.form.zip = student.zip;
                };
                 
         
                /* Private Methods */
                //HTTP GET- get all students collection
                function _refreshPageData() {
                    $http({
                        method : 'GET',
                        url : 'http://localhost:8000/fetchRegisteredStudents'
                    }).then(function successCallback(response) {
                        $scope.students = response.data.students;
                    }, function errorCallback(response) {
                        console.log(response.statusText);
                    });
                }
         
                function _success(response) {
                	alert("saved successfully. Please click on view registered students link  to see the details");
                    _refreshPageData();
                    _clearForm()
                }
         
                function _error(response) {
                	alert("saved successfully. Please click on view registered students link  to see the details");
                	_refreshPageData();
                    _clearForm()
                    console.log(response.statusText);
                }
         
                //Clear the form
                function _clearForm() {
                    $scope.form.firstName = "";
                    $scope.form.lastName = "";
                    $scope.form.email = "";
                    $scope.form.id = -1;
                    
                  	$scope.form.courseName = "";
                    $scope.form.universityName ="";
                    $scope.form.address = "";
                    $scope.form.phone = "";
                   
                    $scope.form.zip = "";
                };
            });
        </script>
<div ng-app="StudentManagement" ng-controller="StudentManagementController">
<form ng-submit="submitStudent()">
	<table border='0' width='480px' cellpadding='0' cellspacing='0'
		align='center'>
		<center>
			<tr>
				<td><h1>Registration Form For Course</h1></td>
			</tr>
			<center>


				<table border='0' width='480px' cellpadding='0' cellspacing='0'
					align='center'>
					<tr>
						<td align='center'>First Name:</td>
						<td><input type='text' ng-model="form.firstName"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td align='center'>Last Name:</td>
						<td><input type='text' ng-model="form.lastName"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td align='center'>Course Name:</td>
						<td><input type='text' ng-model="form.courseName"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td align='center'>University Name:</td>
						<td><input type='text' ng-model="form.universityName"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td align='center'>Address:</td>
						<td><input type='text' ng-model="form.address"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td align='center'>Phone:</td>
						<td><input type='text' ng-model="form.phone"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td align='center'>Email:</td>
						<td><input type='text' ng-model="form.email"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td align='center'>Zip:</td>
						<td><input type='text' ng-model="form.zip"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<table border='0' cellpadding='0' cellspacing='0' width='480px'
						align='center'>
						<tr>
							<td align='center'><input type='submit' 
								value="Register"></td>
								
						</tr>
					
					</table>
					
					<table border='0' cellpadding='0' cellspacing='0' width='480px'
						align='center'>
						<tr><br><br>
						
							
								<td align='center'><a href="http://localhost:8000/viewRegisteredStudents">View Registered students</a><br><br></td>
						</tr>
					
					</table>
				</table>
	</table>
	</form>
	</div>
<div>


</div>
</body>
</html>