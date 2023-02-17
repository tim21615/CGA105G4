<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.mem.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
    MemService memSvc = new MemService();
    List<MemVO> list = memSvc.getAll();
    pageContext.setAttribute("list",list);
%>

<!DOCTYPE html>
<html>
<head>
<title>�Ҧ��|����� - �o�O����~!!!</title>
<style>
  table#table-1 {
	background-color: #FFB5B5;
    border: 1px solid gray;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: deeppink;
    display: inline;
  }
</style>

<style>
  table {
	width: 1200px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid black;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

<meta charset="BIG5">
<title>Insert title here</title>
</head>
<body>
<h4>�����m�߱ĥ� EL ���g�k����:</h4>
<table id="table-1">
	<tr><td>
		 <h3>�Ҧ����u���</h3>
		<img src="images/images.png" width="100" height="65" border="0">
		 <h4><a href="select_page.jsp">�^����</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>�|���s��</th>
		<th>�|���b��</th>
		<th>�|���K�X</th>
		<th>�|���ʺ�</th>
		<th>���U���</th>
		<th>�|�����A</th>
		<th>�u��m�W</th>
		<th>�ʧO</th>
		<th>�ͤ�</th>
		<th>Email</th>
		<th>�q��</th>
		<th>��}</th>
		<th>�Ӥ�</th>
		<th>�Ȧ�b��</th>
		<th>�ק�</th>
		<th>�R��</th>
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="memVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${memVO.memberId}</td>
			<td>${memVO.memberAccount}</td>
			<td>${memVO.memberPassword}</td>
			<td>${memVO.memberNickname}</td>
			<td>${memVO.signUpDatetime}</td>
			<td>${memVO.memberStatus}</td> 
			<td>${memVO.memberName}</td>
			<td>${memVO.memberGender}</td>
			<td>${memVO.dateOfBirth}</td>
			<td>${memVO.memberEmail}</td>
			<td>${memVO.memberPhone}</td>
			<td>${memVO.memberAddress}</td>
			<td><img src="<%=request.getContextPath()%>/ImageServlet?memberID=${memVO.memberId}"width=300px height=200px></td>
			<td>${memVO.bankAccount}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/mem/mem.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�ק�">
			     <input type="hidden" name="memberID"  value="${memVO.memberId}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/mem/mem.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�R��">
			     <input type="hidden" name="memberID"  value="${memVO.memberId}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>
</body>
</html>