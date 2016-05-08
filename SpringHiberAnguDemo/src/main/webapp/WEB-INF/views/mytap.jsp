<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
  
  <!--  -->
  <!-- <meta charset="utf-8"> -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
   <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.3/angular.min.js"></script>
  
   <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
 
  
</head>
<body ng-app='myApp'>
      <div ng-controller='myCtrl'>
        The Errors: {{status}}<hr>
        <input type="number" ng-model="number" />
        <button ng-click="getOne(number)">get One</button></br>
        <p>{{emps | json}}</p>
        <p>This is what I need:  {{names.id}} {{names.name}} {{names.address}}  {{names.salary}} {{names.age}}</p>
        <p><my-update edit="edit(employee)" employee="employee"></my-update></p>
         <table>
       <tr ng-repeat="x in userlist">
       <td>{{x.Name }}</td>
       <td>   {{x.City}}</td>
        <td>{{x.Country}}</td>
      </tr>
   </table>
   
   <hr>
    
     <!-- -->
       <div class="panel panel-default">
        <div class="panel-heading"><span class="lead">List of Users </span>
          <div class="tablecontainer">
            <table class="table table-hover">
                      <thead>
                          <tr>
                              <th>ID.</th>
                              <th>Name</th>
                              <th>Address</th>
                              <th>Salary</th>
                              <th>Age</th>
                              <th width="40%">Edit    and     Remove</th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr ng-repeat="u in data">
                             <td><span ng-bind="u.id"></span></td>
                              <td><span ng-bind="u.name"></span></td>
                              <td><span ng-bind="u.address"></span></td>
                              <td><span ng-bind="u.salary"></span></td>
                              <td><span ng-bind="u.age"></span></td>
                              <td>
                                <div class="container">
                               <button type="button" ng-click="getOne(u.id)" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Edit</button>
                               <button type="button" ng-click="ctrl.remove(u.id)" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal_2" >Remove</button>
                             
                              </div> 
                             </td>
                          </tr>
                      </tbody>
                  </table>
                  </div>
        </div>
      </div>
       
   
          <!--  -->      
           <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">
          <p>Some text in the modal.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
         <!-- -->
      </div><!-- this is end of div -->
   
        
   <script>
     var app=angular.module('myApp', []);
     app.controller('myCtrl',['$scope','$http','$templateCache','$window','$q', function($scope,$http, $templateCache, $window,$q){
    	 $scope.url='http://localhost:8080/controller/showall';
    	 $scope.method='GET';
    	 $scope.updata="upshow";
    	 $scope.names="looking value";
    	 $scope.emps={};
    	 
    	 $scope.employee={
    			           id :'', 
    			           name :'',
    			           address :'',
    			           salary :'',
    			           age :''
    			        }; //"empty";
    	
    	 $scope.erstatus="";
    	
    	$http.get('http://www.w3schools.com/website/customers_mysql.php')
               .then(function (response) {$scope.userlist = response.data;
                //$scope.names=angular.copy(response);
               });	
    	
    	 $http({
    	      method: $scope.method,
    	      url: $scope.url,
    	      headers:{"Content-Type":"application/json","Accept":"application/json, text/plain, */*"},
    	      cache: $templateCache
    	      }).then(function successCallback(response) {
    	   
    	       $scope.status=response.status;
    	        $scope.data = response.data;
    	        $scope.headers=response.transformResponse;
    	        $scope.configs=response.config.headers;
    	        $scope.error=response.status;
    	        $scope.statutext=response.statusText;
    	        $window.alert("Test Checking");

    	     }, function errorCallback(response) {
    	     if (response.status ==404) {
    	      console.log("Error : "+response.status);
    	      $window.alert($q.reject(response.status));
    	      $scope.error=response.status;
    	     };
    	      $scope.data =response.data || "Request failed";
    	       $scope.status =response.status;
    	       $scope.ResponseDetails =  "<hr />status: " + response.status +
    	                    "<hr />headers: " + response.headers ;
    	                   
    	  });//end http
    	  //this function get employee id as variable to get a employee
    	  $scope.getOne=function(id){
    		 
    		  $http.get('http://localhost:8080/controller/employees/'+id)
              .then(function (response) {$scope.emps = response.data;
              var objt =JSON.stringify($scope.emps);
              $window.alert("emps object It is looking for...   "+objt);
              $scope.employee=$scope.emps[0];
              
            
               $window.alert("getOne function pass data to employee  for...   "+$scope.employee.id);
              
               angular.forEach($scope.data, function(value, key) {
            	   var tvalue=JSON.stringify(value);
            	   //$window.alert("It is value...   "+tvalue);
             if (angular.equals(value, $scope.employee)) {
              $window.alert("search getOne() It is funde here   "+key);
               $scope.names=angular.copy(value);
              };
            
          }); //end foreach
               
               
              });
    	  };
    	   //this function pass in employee object as variable. It is called by customer directive
    	   // by reference two way binding. If you change employee property it will reflact on controller
    	   //data that will updated to controller to databases.
    	  $scope.edit=function(obj){
    		  var id=obj.id;
    		  //confirm the employee id
    		  $window.alert(obj.id);
    		  // convert the javascript object to json in order to display on web page
    		  var obj =JSON.stringify(obj);
    		  
	          $window.alert( "edit function updates now message: " +obj);
	         
    		  $http({
        	      method:'PUT',
        	      url:'http://localhost:8080/controller/employee/'+id ,
        	      data: JSON.parse(obj),  // $scope.employee, //JSON.parse(obj),
        	      headers:{"Content-Type":"application/json","Accept":"application/json, text/plain, */*"},
        	      cache: $templateCache
        	      }).then(function successCallback(data, status, headers, config) {
        	    	 
        	    	  var obj2=JSON.stringify(data.data);
        	    	  $scope.updata=obj2;
        	    	 
        	          $window.alert( "updated new message: " + obj2);
        	          //$window.alert("update Test Checking"+ obj1);

        	     }, function errorCallback(data, status, headers, config) {
        	    
        	    	 $window.alert( "failure message: " + JSON.stringify({data: data}));
        	                   
        	  });//end http
    	  };//end function
    	
     }]);
     app.directive("myUpdate", function(){
    	 return {
    	    restrict: 'EAC',
    	    //this directive pass value by reference and a function in order updated employee data
    	    //from databases
    	    scope : {
    	    	employee: '=',
    	    	edit : '&'
    	    },
    	    template: '<div>' + 
    	        '<form ng-submit="edit(employee)">' +
    	         '<input type="text" name="id" ng-model="employee.id"><br>'+
    	          '<input type="text" name="name" ng-model="employee.name"><br>' +
    	          '<input type="text" name="address" ng-model="employee.address"><br>'+
    	          '<input type="text" name="salary" ng-model="employee.salary"><br>'+
    	          '<input type="text" name="age" ng-model="employee.age"><br>'+ 	
    	         '<input type="submit" value="Submit" />'+ 		  
    	          '</form>'+
    	          '<hr />'+
    	         ' {{ employee | json }}'+
    	    '</div>'
    	 };
     });
     
   </script>

</body>
</html>