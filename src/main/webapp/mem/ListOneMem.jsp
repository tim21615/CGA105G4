<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.mem.model.*"%>
<!DOCTYPE html>
<%
  MemVO memVO = (MemVO) request.getAttribute("memVO"); //EmpServlet.java(Concroller), �s�Jreq��empVO����
%>

<html>
<head>
<title>�|����� - listOneEmp.jsp</title>

<style>
  table#table-1 {
	background-color: #FFB5B5;
    border: 1px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width:1000px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='white'>

<h4>�����Ƚm�߱ĥ� Script ���g�k����:</h4>
<table id="table-1">
	<tr><td>
		 <h3>���u��� - ListOneEmp.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/main.png" width="100" height="100" border="0">�^����</a></h4>
	</td></tr>
</table>
<table>
	<tr>
		<th>�|���s��</th>
		<th>�|���b��</th>
		<th>�|���K�X</th>
		<th>�ʺ�</th>
		<th>���U���</th>
		<th>�|�����A</th>
		<th>�|���m�W</th>
		<th>�ʧO</th>
		<th>�ͤ�</th>
		<th>Email</th>
		<th>������X</th>
		<th>�a�}</th>
		<th>�Ӥ�</th>
		<th>�Ȧ�b��</th>
	</tr>
	<tr>
		<td><%=memVO.getMemberId()%></td>
		<td><%=memVO.getMemberAccount()%></td>
		<td><%=memVO.getMemberPassword()%></td>
		<td><%=memVO.getMemberNickname()%></td>
		<td><%=memVO.getSignUpDatetime()%></td>
		<td><%=memVO.getMemberStatus()%></td>
		<td><%=memVO.getMemberName()%></td>
		<td><%=memVO.getMemberGender()%></td>
		<td><%=memVO.getDateOfBirth()%></td>
		<td><%=memVO.getMemberEmail()%></td>
		<td><%=memVO.getMemberPhone()%></td>
		<td><%=memVO.getMemberAddress()%></td>
		<td><img src="<%=request.getContextPath()%>/ImageServlet?memberID=${memVO.memberID}"width=300px height=200px></td>
		<td><%=memVO.getBankAccount()%></td>
	</tr>
</table>

</body>
</html>