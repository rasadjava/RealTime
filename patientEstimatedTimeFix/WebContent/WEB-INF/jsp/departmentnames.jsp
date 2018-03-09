<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>






<option>--Select--</option>
<c:forEach var="doc" items="${doct1}">  
<option value="${doc.doctorid}:${doc.doctorname}">${doc.doctorname}</option>
</c:forEach>   










<c:forEach var="doctor" items="${time}">  
<option value="${doctor.doctortime}">${doctor.doctortime}</option>
</c:forEach> 

<%-- <!DOCTYPE html>
<html lang="en">
<head>

</head>
<body>
	<%
		String dep = request.getParameter("name");
		request.setAttribute("doctorQuery", "SELECT doctorname from doctor where departmentname='" + dep + "'");
	%>

	<sql:setDataSource var="dt" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/hospital" user="root" password="" />
	<sql:query var="listTimings" dataSource="${dt}"
		sql="SELECT doctorname from doctor where departmentname=?">
		<sql:param value="${param.name}">
		</sql:param>
	</sql:query>
	<c:forEach var="doctor" items="${listTimings.rows}">
		<option value="${doctor.doctorname}">${doctor.doctorname}</option>
	</c:forEach>



</body>
</html> --%>