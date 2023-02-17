<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>

<%
  MemVO memVO = (MemVO) request.getAttribute("memVO"); //EmpServlet.java (Concroller) �s�Jreq��empVO���� (�]�A�������X��empVO, �]�]�A��J��ƿ��~�ɪ�empVO����)
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>�|����ƭק� - update_mem_input.jsp</title>

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
	width: 700px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
  }
  table, th, td {
    border: 0px solid #CCCCFF;
  }
  th, td {
    padding: 1px;
  }
</style>

</head>

<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>�|����ƭק� - update_mem_input.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/main.png" width="100" height="85" border="0">�^����</a></h4>
	</td></tr>
</table>

<h3>��ƭק�:</h3>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
<FORM METHOD="post" ACTION="mem.do" name="form1"enctype="multipart/form-data">
		<table>
		
		<tr>
		<td>�|���s��:<font color=red><b>*</b></font></td>
		<td><%=memVO.getMemberId()%></td>
	</tr>
			<tr>
				<td>�|���b��:</td>
				<td><input type="TEXT" name="memberAccount" size="45" value="<%=memVO.getMemberAccount()%>" /></td>
			</tr>
			<tr>
				<td>�|���K�X:</td>
				<td><input type="TEXT" name="memberPassword" size="45" value="<%=memVO.getMemberPassword()%>" /></td>		
			</tr>

			<tr>
				<td>�ʺ�:</td>
				<td><input type="TEXT" name="memberNickName" size="45" value="<%=memVO.getMemberNickname()%>" /></td>
			</tr>

			<tr>
				<td>�����Ҧr��:</td>
				<td><input type="TEXT" name="idNumber" size="45" value="<%=(memVO==null)? "10000" : memVO.getIdNumber()%>" /></td>
			</tr>

			<tr>
				<td>�|�����A:</td>
				<td><input type="TEXT" name="memberStatus" size="45" value="<%=memVO.getMemberStatus()%>" /></td>
			</tr>

			<tr>
				<td>�|���W��:</td>
				<td><input type="TEXT" name="memberName" size="45" value="<%=memVO.getMemberName()%>" /></td>
					
			</tr>

				<tr>
				<td>�ʧO:</td>
				<td><input type="TEXT" name="memberGender" size="45" value="<%=memVO.getMemberGender()%>" /></td>
			</tr>

			<tr>
				<td>�X�ͤ��:</td>
				<td><input name="dateOfBirth" id="f_date2" type="text"></td>
			</tr>

				<tr>
				<td>�q�l�a�}:</td>
				<td><input type="TEXT" name="memberEmail" size="45" value="<%=memVO.getMemberEmail()%>" /></td>
			</tr>

			<tr>
				<td>�|���q��:</td>
				<td><input type="TEXT" name="memberPhone" size="45" value="<%=memVO.getMemberPhone()%>" /></td>
			</tr>

			<tr>
				<td>�|���a�}:</td>
				<td><input type="TEXT" name="memberAddress" size="45" value="<%=memVO.getMemberAddress()%>" /></td>
			</tr>

			<tr>
				<td>�ק�Ϥ�:</td>
						<td><input type="file" name="upfile1" size="45" value="<%=memVO.getProfilePhoto()%>"/></td>
	
			</tr>
<tr>
<td><img src="<%=request.getContextPath()%>/ImageServlet?memberID=${memVO.memberID}"width=300px height=200px></td>
</tr>
			<tr>
				<td>�Ȧ�b��:</td>
				<td><input type="TEXT" name="bankAccount" size="45" value="<%=memVO.getBankAccount()%>" /></td>
			</tr>
		</table>
		<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="memberID" value="<%=memVO.getMemberId()%>">
<input type="submit" value="�e�X�ק�"></FORM>

</body>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>

<script>
        $.datetimepicker.setLocale('zh');
        $('#f_date2').datetimepicker({
           theme: '',              //theme: 'dark',
 	       timepicker:false,       //timepicker:true,
 	       step: 1,                //step: 60 (�o�Otimepicker���w�]���j60����)
 	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
 		   value: '<%=memVO.getDateOfBirth()%>', // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // �h���S�w���t
           //startDate:	            '2017/07/10',  // �_�l��
           //minDate:               '-1970-01-01', // �h������(���t)���e
           //maxDate:               '+1970-01-01'  // �h������(���t)����
        });

        </script>
</html>