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
        The Status of Communication: {{status}}<hr>
        <input type="number" ng-model="number" />
        <button ng-click="getOne(number)">get One</button></br> 
         <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal_3">Save</button> 
       
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
                              <th width="20%"></th>
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
                                <!-- I have taken off remOne(). It is same as getOne() -->
                               <button type="button" ng-click="getOne(u.id)" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Edit</button>
                               <button type="button" ng-click="getOne(u.id)" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal_2">Remove</button>
                               
                               </div> <!-- end container "remOne(u.id)" -->
                             </td>
                          </tr><!-- end tr repeat -->
                      </tbody><!-- end tbody -->
                  </table> <!-- end table-->
                </div><!-- end tablecontainer -->
              </div><!--end panel-headeing -->
           </div><!--class panel panel-defaul -->
        
           <!-- Modal -->
           <div class="modal fade" id="myModal" role="dialog">
             <div class="modal-dialog">
         <!-- Modal content-->
            <div class="modal-content">
             <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Modal Header</h4>
                  </div><!--end class modal-header -->
             <div class="modal-body">
              <p><my-update edit="edit(employee)" employee="employee"></my-update></p><br>
              <p>Edit the employee data Here and than click submit button.</p>
            </div><!-- end class=modal-body -->
           <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
         </div><!-- end modal-footer -->
         </div><!--end class mdal-content -->
      
        </div> <!-- end modal-dialog -->
       </div> <!-- end modal fade -->
         <!-- -->
         <!--  new modal-2 -->
         <div class="modal fade" id="myModal_2" role="dialog">
             <div class="modal-dialog">
         <!-- Modal content-->
            <div class="modal-content">
             <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Modal Header</h4>
                  </div><!--end class modal-header -->
             <div class="modal-body">
              <!--  here is the customer directive one refer object employee one refers function remove() -->
               <p><my-remove remove="remove(employee)" employee="employee"></my-remove></p>
              <p>Edit the employee data Here and than click submit button.</p>
            </div><!-- end class=modal-body -->
           <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
         </div><!-- end modal-footer -->
         </div><!--end class mdal-content -->
      
        </div> <!-- end modal-dialog -->
       </div> <!-- end modal fade -->
       <!-- new model -->
        <!--  new modal-3 -->
         <div class="modal fade" id="myModal_3" role="dialog">
             <div class="modal-dialog">
         <!-- Modal content-->
            <div class="modal-content">
             <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Modal Header</h4>
                  </div><!--end class modal-header -->
             <div class="modal-body">
              <!--  here is the customer directive one refer object employee one refers function remove() -->
              
               <p><my-saving mysave="mysave()" sname="sname" snadd="snadd" snsl="snsl" snage="snage"></my-saving></p>
              <p>Edit the employee data Here and than click submit button.</p>
            </div><!-- end class=modal-body -->
           <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
         </div><!-- end modal-footer -->
         </div><!--end class mdal-content -->
      
        </div> <!-- end modal-dialog -->
       </div> <!-- end modal fade -->
       
       
       <!-- here is closed div for the whole controller -->
      </div><!-- this is end of div of ng-controller -->
   
        
   <script>
     var app=angular.module('myApp', []);
     app.controller('myCtrl',['$scope','$http','$templateCache','$window','$q', function($scope,$http, $templateCache, $window,$q){
    	 $scope.url='http://localhost:8080/controller/showall';
    	 $scope.method='GET';
    	 $scope.updata="upshow";
    	 $scope.names="looking value";
    	 $scope.emps={};
    	 $scope.sname='';
    	 $scope.snadd='';
    	 $scope.snsl='';
    	 $scope.snage='';
    	
    	 
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
    	$scope.getAll=function(){
    		$http.get('http://localhost:8080/controller/showall')
            .then(function (response) {$scope.userlist = response.data;
             $scope.data=response.data;
            });
    		return $scope.data;
    	}
    	
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
    	       // $window.alert("Test Checking");

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
    	  
    	  $scope.remove=function(obj){
    		  var id=obj.id;
    		  //confirm the employee id
    		  $window.alert(obj.id);
    		  // convert the javascript object to json in order to display on web page
    		  var obj =JSON.stringify(obj);
    		  
	          $window.alert( "edit function updates now message: " +obj);
	         
    		  $http({
        	      method:'DELETE',
        	      url:'http://localhost:8080/controller/deletemp/'+id ,
        	      data: JSON.parse(obj),  // $scope.employee, //JSON.parse(obj),
        	      headers:{"Content-Type":"application/json","Accept":"application/json, text/plain, */*"},
        	      cache: $templateCache
        	      }).then(function successCallback(data, status, headers, config) {
        	    	 
        	    	  var obj2=JSON.stringify(data.data);
        	    	  $scope.updata=obj2;
        	    	  //$scope.data=angular.copy(obj2);
        	    	  var tests=$scope.getAll();
        	         //$window.alert( "updated new second message: " + obj2);
        	          //$window.alert("update Test Checking"+ obj1);

        	     }, function errorCallback(data, status, headers, config) {
        	    
        	    	 $window.alert( "failure message: " + JSON.stringify({data: data}));
        	                   
        	  });//end http
    	  };//end remove function  
    	  
    	  //remove here attention !! I have taken out this function because it is same as getOne() to create $scope.emoployee
    	  $scope.remOne=function(id){
     		 
    		  $http.get('http://localhost:8080/controller/employees/'+id)
              .then(function (response) {$scope.emps = response.data;
              var objt =JSON.stringify($scope.emps);
            //  $window.alert("emps object It is looking for...   "+objt);
              $scope.employee=$scope.emps[0];
              
            
               //$window.alert("getOne function pass data to employee  for...   "+$scope.employee.id);
              
               angular.forEach($scope.data, function(value, key) {
            	   var tvalue=JSON.stringify(value);
            	   //$window.alert("It is value...   "+tvalue);
             if (angular.equals(value, $scope.employee)) {
              $window.alert("search getOne() It is funde here   "+key);
               $scope.names=angular.copy(value);
              };
            
          }); //end foreach
               
               
              });
    	  };//end remove function
    	  
    	  //this function get employee id as variable to get a employee
    	  $scope.getOne=function(id){
    		 
    		  $http.get('http://localhost:8080/controller/employees/'+id)
              .then(function (response) {$scope.emps = response.data;
              var objt =JSON.stringify($scope.emps);
            //  $window.alert("emps object It is looking for...   "+objt);
              $scope.employee=$scope.emps[0];
              
            
               //$window.alert("getOne function pass data to employee  for...   "+$scope.employee.id);
              
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
    		  //$window.alert(obj.id);
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
        	    	  var tdata={data:data};
        	    	  $window.alert("Look me different: "+JSON.stringify(tdata.data));
        	    	  var obj2=JSON.stringify(data.data);
        	    	  $scope.updata=obj2;
        	    	  var tests=$scope.getAll();
        	    	 // $scope.data=angular.copy(obj2);
        	        // $window.alert( "updated new message: " + obj2);
        	          //$window.alert("update Test Checking"+ obj1);

        	     }, function errorCallback(data, status, headers, config) {
        	    
        	    	 $window.alert( "failure message: " + JSON.stringify({data: data}));
        	                   
        	  });//end http
    	  };//end function
    	  
    	  //save function here
    	  
    	  $scope.mysave=function(){
    		 $scope.temps={
    				 name: $scope.sname,
    				 address: $scope.snadd,
    				 salary: $scope.snsl,
    				 age: $scope.snage
    		 };
    		  var obj=$scope.temps;
    		 
    		  // convert the javascript object to json in order to display on web page
    		  var objs =JSON.stringify(obj);
    		  
	          $window.alert( "save function save now message: " +objs);
	         
    		  $http({
        	      method:'POST',
        	      url:'http://localhost:8080/controller/empsave',
        	      data:JSON.parse(objs),   // $scope.employee, //JSON.parse(obj),
        	      headers:{"Content-Type":"application/json","Accept":"application/json, text/plain, */*"},
        	      cache: $templateCache
        	      }).then(function successCallback(data, status, headers, config) {
        	    	 
        	    	  var obj2=JSON.stringify(data.data);
        	    	  $scope.updata=obj2;  
        	    	 
        	    	  var tests=$scope.getAll();
        	        

        	     }, function errorCallback(data, status, headers, config) {
        	    
        	    	 $window.alert( "failure message: " + JSON.stringify({data: data}));
        	                   
        	  });//end http
    	  };//end save function
    	
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
     
     app.directive("myRemove", function() {
    	return {
    	 restrict: 'EAC',
    	 scope :{
    		 employee: '=',
    		 remove : '&'
    	 },
    	 template: '<div>' + 
	        '<form ng-submit="remove(employee)">' +
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
    	
    	 
     }; //end return
     });//end directive remove
     
     app.directive("mySaving", function() {
     	return {
     	 restrict: 'EAC',
     	 scope :{
     		sname: "=", 
     		snadd: "=", 
     		snsl: "=", 
     		snage: "=",
     		mysave : '&'
     	 },
     	 template: '<div>' + 
 	        '<form ng-submit="mysave()">' +
 	          '<input type="text" name="name" ng-model="sname"><br>' +
 	          '<input type="text" name="address" ng-model="snadd"><br>'+
 	          '<input type="text" name="salary" ng-model="snsl"><br>'+
 	          '<input type="text" name="age" ng-model="snage"><br>'+ 	
 	         '<input type="submit" value="Submit" />'+ 		  
 	          '</form>'+
 	         
 	    '</div>'
     	
     	 
      }; //end return
      });//end directive mysaving
     
   </script>

</body>
</html>