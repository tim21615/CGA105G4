<!-- 目前最新都用這個檔案 -->
<%@page import="com.prodopt.model.ProdOptVO"%>
<%@page import="com.prodopt.model.ProdOptService"%>
<%@page import="com.shopprod.model.ShopProdVO"%>
<%@page import="com.shopprod.model.ShopProdService"%>
<%@page import="com.prodtype.model.ProdTypeVO"%>
<%@page import="com.prodtype.model.ProdTypeService"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--需要裝兩個檔案才不會出現錯誤 --%>
<%@ page import="java.util.*"%>
<%@ page import="com.order.model.*"%>
<%@ page import="com.orderlist.model.*"%>



<%
ShopProdService shopProdSvc = new ShopProdService();
ShopProdVO productVO = shopProdSvc.getOneShopProd(Integer.parseInt(request.getParameter("productId")));

ProdOptService prodOptSvc = new ProdOptService();
List<ProdOptVO> prodOptList = prodOptSvc.getProdOpts(Integer.parseInt(request.getParameter("productId")));


pageContext.setAttribute("productVO", productVO);
pageContext.setAttribute("prodOptList", prodOptList);
%>

<!DOCTYPE html>



<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Dashboard - SB Admin</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="../css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<title>所有訂單資料</title>

<style>
table#table-1 {
	background-color: white;
	/* 	border: 2px solid black; */
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
	width: 1000px;
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
<body class="sb-nav-fixed">
	<%@ include file="/back_end/navbar/navbar.jsp"%>
	<div id="layoutSidenav">
	<%@ include file="/back_end/sidebar/sidebar.jsp"%>
		<div id="layoutSidenav_content">
			<main>

				<div class="container my-5 mx-4">

					<!--=========================請注意: 寫你要的內容 -->
					<h3 class="mb-3">新增商品選項</h3>
					<div class="product d-flex">
						<div class="productImg">
							<img
								src="<%=request.getContextPath()%>/ShowProdImgServlet?productId=${productVO.productId}"
								style="width: 120px;"
								onerror="this.src='<%=request.getContextPath()%>/back_end/assets/img/error-404-monochrome.svg'">
						</div>
						<h4 class="title">${productVO.productName }</h4>
					</div>
					<table class="table table-borderless table-hover existProductOption">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">商品選項</th>
								<th scope="col">商品選項價格</th>
								<th scope="col">庫存</th>
								
							</tr>
							
							
						</thead>
						
						<tbody>
							<c:forEach var="prodOptVO" items="${ prodOptList }">
								<tr>
									<th scope="row"><img
										src="<%=request.getContextPath()%>/ShowProdOptionImgServlet?productOptionId=${prodOptVO.productOptionId}" style="width: 80px;" onerror="this.src='<%=request.getContextPath()%>/back_end/assets/img/error-404-monochrome.svg'"></th>
									<td>${prodOptVO.productOptionName }</td>
									<td>${prodOptVO.productOptionPrice }</td>
									<td>${prodOptVO.productOptionInventory }</td>
									<td><form method="post" action="<%=request.getContextPath() %>/DeleteProdOptServlet"><input type="hidden" name="productOptionId" value="${prodOptVO.productOptionId }"><input type="hidden" name="productId" value="${prodOptVO.productId }"><button type="submit"><i class="fa-solid fa-trash"></i></button></form></td>
								</tr>
							</c:forEach>

						</tbody>
					</table>

					<form
						action="<%=request.getContextPath()%>/AddProductOptionServlet"
						method="post" enctype="multipart/form-data">
						<input type="hidden" name="action" value="addProductOption">
						<input type="hidden" name="productId" value="${param.productId }">


						<div class="row my-3">
							<div
								class="col-1 d-flex justify-content-center align-items-center"
								style="font-size: 18px">1</div>
							<div class="col-4">
								<label for="productOptionName">商品選項名稱</label> <input type="text"
									class="form-control" id="productOptionName"
									name="productOptionName" placeholder="Enter productOptionName">
							</div>
							<div class="col-2">
								<label for="productOptionPrice">商品選項價格</label> <input
									type="text" class="form-control" id="productOptionPrice"
									name="productOptionPrice"
									placeholder="Enter productOptionPrice">
							</div>
							<div class="col-1">
								<label for="productOptionInventory">庫存</label> <input
									type="text" class="form-control" id="productOptionInventory"
									name="productOptionInventory"
									placeholder="Enter productOptionInventory">
							</div>
							<div class="col-4">
								<label for="productOptionPicture">選項圖片</label> <br> <input
									type="file" class="form-control-file" id="productOptionPicture"
									name="productOptionPicture1">
							</div>


						</div>


						<button type="submit" class="btn btn-primary addProdOptBtn">提交</button>
						<button class="btn btn-secondary addOptionBtn">新增商品選項</button>


					</form>




				</div>

				<!--=========================請注意: 結束要的內容 -->

			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Your Website 2022</div>
						<div>
							<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"
		integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="../assets/demo/chart-area-demo.js"></script>
	<script src="../assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>

	<script>
	
	$('.addOptionBtn').on('click', function(e){
		
		e.preventDefault();
		
		let count = $('.row').length;
		
		let addRowTemplate =`<div class="row my-3">
			<div
			class="col-1 d-flex justify-content-center align-items-center"
			style="font-size: 18px">`+(count+1)+`</div>
		<div class="col-4">
			<label for="productOptionName">商品選項名稱</label> <input type="text"
				class="form-control" id="productOptionName"
				name="productOptionName" placeholder="Enter productOptionName">
		</div>
		<div class="col-2">
			<label for="productOptionPrice">商品選項價格</label> <input
				type="text" class="form-control" id="productOptionPrice"
				name="productOptionPrice"
				placeholder="Enter productOptionPrice">
		</div>
		<div class="col-1">
			<label for="productOptionInventory">庫存</label> <input
				type="text" class="form-control" id="productOptionInventory"
				name="productOptionInventory"
				placeholder="Enter productOptionInventory">
		</div>
		<div class="col-4">
			<label for="productOptionPicture">選項圖片</label> <br> <input
				type="file" class="form-control-file" id="productOptionPicture`+(count+1)+`"
				name="productOptionPicture`+(count+1)+`">
		</div>


	</div>`;
		
	
	$('.addProdOptBtn').before(addRowTemplate);
		
	})
	

		
	
	
	</script>
</body>
</html>