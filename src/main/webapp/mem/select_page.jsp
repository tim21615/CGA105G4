<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>�|������-����</title>
<style>
table#table-1 {
	width: 450px;
	background-color: #FFB5B5;
	margin-top: 5px;
	margin-bottom: 10px;
    border: 1px ridge Gray;
    height: 80px;
    text-align: center;
  }
  table#table-1 h4 {
    color: white;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

</head>

<body bgcolor = 'white'>
<table id="table-1" >
   <tr><td><h3>�|������</h3><h4><img src="images/main.png" width="100" height="100" border="0"></h4></td></tr>
</table>


<h3>��Ƭd��:</h3>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>


<ul>
  <li><a href='listAllMem.jsp'>�I�ڬd��</a> �Ҧ��|����� <br><br></li>
 
  <li>
    <FORM METHOD="post" ACTION="mem.do" >
        <b>��J�|��ID (�p1):</b>
        <input type="text" name="memberID">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="�e�X">
    </FORM>
  </li>
 
 <jsp:useBean id="memberSvc" scope="page" class="com.mem.model.MemService" />
  
  <li>
     <FORM METHOD="post" ACTION="mem.do" >
       <b>��ܷ|��ID:</b>
       <select size="1" name="memberID">
         <c:forEach var="memVO" items="${memberSvc.all}" > 
          <option value="${memVO.memberID}">${memVO.memberID}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
    </FORM>
  </li>
  
</ul>
<h3>�|���޲z</h3>

<ul>
  <li><a href='addMem.jsp'>�I�o��</a>�s�W�@�ӷ|�����</li>
</ul>  
</body>
</html>