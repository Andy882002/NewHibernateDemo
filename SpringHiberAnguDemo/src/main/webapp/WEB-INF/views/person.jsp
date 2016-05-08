<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<html> 
<head> 
<title>Spring MVC Form Handling</title> 
</head> 
<body> 
<h2>Person  Information</h2> 
<form:form method="POST" action="/controller/addperson">
<table> 
<tr> 
<td><form:label path="name">Name</form:label></td> 
<td><form:input path="name" /></td> 
</tr>
<tr> 
<td><form:label path="address">address</form:label></td> 
<td><form:input path="address" /></td> 
</tr> 
<tr> 
<td><form:label path="salary">salary</form:label></td> 
<td><form:input path="salary" /></td> 
</tr> 
<tr> 
<td><form:label path="age">age</form:label></td> 
<td><form:input path="age" /></td> 
</tr> 
<tr> 
<td colspan="2"> 
<input type="submit" value="Submit"/> 
</td> 
</tr> 
</table> 
</form:form> 
</body> 
</html> 