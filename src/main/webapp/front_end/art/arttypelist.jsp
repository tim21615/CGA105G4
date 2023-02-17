<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.stream.Collector"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.*"%>
<%@page import="com.arttype.model.*"%>
<%@page import="com.art.model.*"%>
<%@page import="com.artcarousel.model.ArtCarouselVO"%>
<%@page import="com.artcarousel.model.ArtCarouselService"%>
<%@page import="com.artcarousel.model.*"%>
<%
    String location = (request.getQueryString()==null)? request.getRequestURL().toString() :request.getRequestURL().append("?").append(request.getQueryString()).toString();
    HttpSession session1 = request.getSession();
    session1.setAttribute("location", location);
%>


<%
ArtTypeService artTypeSvc = new ArtTypeService();
List<ArtTypeVO> artTypelist = artTypeSvc.getAll();
pageContext.setAttribute("artTypelist", artTypelist);
%>

<%
ArtCarouselService ArtCarouselSvc = new ArtCarouselService();
List<ArtCarouselVO> ArtCarousel_list = ArtCarouselSvc.getAll();
pageContext.setAttribute("ArtCarousel_list", ArtCarousel_list);
%>

<%
ArtVO artVO = (ArtVO) request.getAttribute("artVO");
%>

<%
ArtTypeVO artTypeVO = (ArtTypeVO) session.getAttribute("artTypeVO");
%>


<%
ArtService artSvc = new ArtService();
List<ArtVO> list = artSvc.getAll();
List<ArtVO> filteredList = list.stream()
		.filter(art -> art != null && art.getArticleTypeId() == artTypeVO.getArticleTypeId())
		.collect(Collectors.toList());
pageContext.setAttribute("filteredList", filteredList);
%>


<%-- <%@ page language="java" contentType="text/html; charset=BIG5" --%>
<%--     pageEncoding="BIG5"%> --%>
<!DOCTYPE html>
<html>
<head>


<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Bakix - Crowdfunding Startup Fundraising HTML5 Template</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="manifest" href="site.webmanifest">
<link rel="shortcut icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/front_end/assets/img/favicon.png">
<!-- Place favicon.png in the root directory -->

<!-- CSS here -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front_end/assets/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front_end/assets/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front_end/assets/css/animate.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front_end/assets/css/magnific-popup.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front_end/assets/css/fontawesome-all.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front_end/assets/css/meanmenu.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front_end/assets/css/flaticon.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front_end/assets/css/slick.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front_end/assets/css/style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front_end/assets/css/responsive.css">


<script src="https://kit.fontawesome.com/fb61cff1c9.js"
	crossorigin="anonymous"></script>
<!--請注意: 要引入 fontawesome -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front_end/assets/scss/main.css">
<!--請注意: 可寫css 在main.css內 -->
</head>
<body>
	<!-- preloader -->
	<div id="preloader">
		<div class="preloader">
			<span></span> <span></span>
		</div>
	</div>
	<!-- preloader end  -->

	<%@ include file="/front_end/header/header.jsp"%>

	<main>

		<section class="grey-bg pt-20 pb-20">
			<div class="container">
				<!--請注意: 以下填入你要寫的東西 開始-->
				<main>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="art.jsp">交流區首頁</a></li>
						<li class="breadcrumb-item active" aria-current="page">文章分類</li>
					</ol>

					<!-- page-title-area start -->
					<!-- <section class="page-title-area pt-150 pb-150" data-background="<%=request.getContextPath()%>/front_end/assets/img/bg/page-banner.jpg">
                        <div class="container">
                            <div class="row">
                                <div class="col-xl-7 col-lg-8">
                                    <div class="page-title page-title-white">
                                        <h2>Blog Standard</h2>
                                        <p class="pl-0">List as many team members as you want in two layout modes: standard &
                                            carousel. You can control and change the features of each.</p>
                                        <div class="breadcrumb-list">
                                            <ul>
                                                <li><a href="#">Home</a></li>
                                                <li><a href="#">Pages</a></li>
                                                <li>Blog</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section> -->
					<!--              <div id="carouselExampleControls" class="carousel slide" data-ride="carousel"> -->
					<!-- 					  <div class="carousel-inner"> -->
					<!-- <!-- 							因為bootstrap的輪播圖一定要指定active去標記為第一張才能正常顯示 -->
					<!--                           <div class="carousel-item active" data-interval="1000"> -->
					<!--                             <img src="https://i.ytimg.com/vi/uldPqMh7-AE/maxresdefault.jpg" alt="..."> -->
					<!--                           </div> -->
					<!-- <!--                           forEach 區塊 -->
					<%--                           <c:forEach var="artCarouselVO" items="${ArtCarousel_list}" > --%>
					<!--                           <div class="carousel-item" data-interval="1000"> -->
					<%--                             <img src="<%=request.getContextPath()%>/ImageServlet?articleCarouselId=${artCarouselVO.articleCarouselId}" class="d-block w-100" alt="..."> --%>
					<!--                           </div> -->
					<%--                           </c:forEach> --%>
					<!-- 					  </div> -->
					<!-- 					  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev"> -->
					<!-- 					    <span class="carousel-control-prev-icon" aria-hidden="true"></span> -->
					<!-- 					    <span class="sr-only">Previous</span> -->
					<!-- 					  </a> -->
					<!-- 					  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next"> -->
					<!-- 					    <span class="carousel-control-next-icon" aria-hidden="true"></span> -->
					<!-- 					    <span class="sr-only">Next</span> -->
					<!-- 					  </a> -->
					<!-- 					</div> -->
					<!-- page-title-area end -->

					<!-- blog-area start -->
					<section class="blog-area pt-20 pb-20">
						<div class="container">
							<div class="row">
								<div class="col-lg-8">
									<article class="postbox post format-image mb-40">
										<div class="postbox__thumb">
											<!-- 											<a href="#"> <img src="<%=request.getContextPath()%>/front_end/assets/img/blog/b1.jpg" -->
											<!-- 												alt="blog image"> -->
											<!-- 											</a> -->
										</div>
										<div class="mb-10">
											<div class="postbox__text p-10">
												<c:forEach var="artTypeVO" items="${filteredList}">
													<div calss="article" my-5>
														<br> <br> <br>
														<div class="post-meta my-1" grid-column-gap: 20px>
															<br> <span><i class="far fa-calendar-check"></i>${artTypeVO.articlePostTime}</span>
														</div>
														<h3 class="blog-title">
															<a =${artTypeVO.articleTitle}>${artTypeVO.articleTitle}</a>
															<%-- ${artTypeVO.articleTitle} --%>
														</h3>
														<div class="post-text mb-20">
															<p>${artTypeVO.articleContent}</p>
														</div>


														<FORM METHOD="post" ACTION="art.do">
															<div class="read-more mt-10">

																<input type="hidden" name="articleId"
																	value="${artTypeVO.articleId}"> <input
																	type="hidden" name="action" value="getOne_article">
																<button type="submit" class="btn btn-black">read
																	more</button>
															</div>
														</FORM>
													</div>
												</c:forEach>
											</div>
										</div>
									</article>



									<div class="basic-pagination basic-pagination-2 mb-40">
										<ul>
											<li><a href="#"><i class="fas fa-angle-double-left"></i></a></li>
											<li><a href="#">01</a></li>
											<li><a href="#">02</a></li>
											<li><a href="#">03</a></li>
											<li><a href="#"><i class="fas fa-ellipsis-h"></i></a></li>
											<li><a href="#"><i class="fas fa-angle-double-right"></i></a></li>
										</ul>
									</div>
								</div>
								<div class="col-lg-4">
									<div class="widget mb-40">
										<div class="widget-title-box mb-30">
											<span class="animate-border"></span>
											<h3 class="widget-title">文章搜尋</h3>
										</div>

										<FORM METHOD="post" ACTION="art.do" class="search-form">
											<input type="text" name="article" placeholder="請輸入文章關鍵字">
											<input type="hidden" name="action" value="articlekey">
											<button type="submit" value="送出">
												<i class="fas fa-search"></i>
											</button>
										</FORM>
									</div>

									<!-- 									<div class="widget mb-40"> -->
									<!-- 										<div class="widget-title-box mb-30"> -->
									<!-- 											<span class="animate-border"></span> -->
									<!-- 											<h3 class="widget-title">熱門文章</h3> -->
									<!-- 										</div> -->
									<!-- 										<ul class="recent-posts"> -->
									<!-- 											<li> -->
									<!-- 												<div class="widget-posts-image"> -->
									<!-- 													<a href="#"><img -->
									<%-- 														src="<%=request.getContextPath()%>/front_end/assets/img/blog/details/img1.jpg" --%>
									<!-- 														alt=""></a> -->
									<!-- 												</div> -->
									<!-- 												<div class="widget-posts-body"> -->
									<!-- 													<h6 class="widget-posts-title"> -->
									<!-- 														<a href="#">Lorem ipsum dolor sit cing elit, sed do.</a> -->
									<!-- 													</h6> -->
									<!-- 													<div class="widget-posts-meta">October 18, 2018</div> -->
									<!-- 												</div> -->
									<!-- 											</li> -->
									<!-- 											<li> -->
									<!-- 												<div class="widget-posts-image"> -->
									<!-- 													<a href="#"><img -->
									<%-- 														src="<%=request.getContextPath()%>/front_end/assets/img/blog/details/img2.jpg" --%>
									<!-- 														alt=""></a> -->
									<!-- 												</div> -->
									<!-- 												<div class="widget-posts-body"> -->
									<!-- 													<h6 class="widget-posts-title"> -->
									<!-- 														<a href="#">Lorem ipsum dolor sit cing elit, sed do.</a> -->
									<!-- 													</h6> -->
									<!-- 													<div class="widget-posts-meta">October 24, 2018</div> -->
									<!-- 												</div> -->
									<!-- 											</li> -->
									<!-- 											<li> -->
									<!-- 												<div class="widget-posts-image"> -->
									<!-- 													<a href="#"><img -->
									<%-- 														src="<%=request.getContextPath()%>/front_end/assets/img/blog/details/img3.jpg" --%>
									<!-- 														alt=""></a> -->
									<!-- 												</div> -->
									<!-- 												<div class="widget-posts-body"> -->
									<!-- 													<h6 class="widget-posts-title"> -->
									<!-- 														<a href="#">Lorem ipsum dolor sit cing elit, sed do.</a> -->
									<!-- 													</h6> -->
									<!-- 													<div class="widget-posts-meta">October 28, 2018</div> -->
									<!-- 												</div> -->
									<!-- 											</li> -->
									<!-- 										</ul> -->
									<!-- 									</div> -->
									<div class="widget mb-40">
										<div class="widget-title-box mb-30">
											<span class="animate-border"></span>
											<h3 class="widget-title">文章分類</h3>
										</div>
										<ul class="cat">

											<c:forEach var="artTypeVO" items="${artTypelist}">
												<li><a
													href="<%=request.getContextPath() %>/front_end/art/ArtTypelist.do?articleTypeId=${artTypeVO.articleTypeId }&action=getArtlist">${artTypeVO.articleTypeName}
														<span class="f-right"></span>
												</a></li>
											</c:forEach>

										</ul>
									</div>
									<div class="widget mb-40">
										<div class="widget-title-box mb-30">
											<span class="animate-border"></span>
											<h3 class="widget-title">Social Profile</h3>
										</div>
										<div class="social-profile">
											<a href="https://www.facebook.com/sharer.php?u＝網址"><i
												class="fab fa-facebook-f"></i></a> <a
												href="https://twitter.com/share?text=文字&url=網址"><i
												class="fab fa-twitter"></i></a> <a
												href="http://line.naver.jp/R/msg/text/?網址"><i
												class="fab fa-linkedin-in"></i></a> <a href><i
												class="fab fa-youtube"></i></a>
										</div>
										<!-- 									</div> -->

										<!-- 									<div class="widget mb-40"> -->
										<!-- 										<div class="widget-title-box mb-30"> -->
										<!-- 											<span class="animate-border"></span> -->
										<!-- 											<h3 class="widget-title">熱門分類</h3> -->
										<!-- 										</div> -->
										<!-- 										<div class="tag"> -->
										<!-- 											<a href="#">許願池</a> <a href="#">閒聊</a> <a href="#">時事</a> <a -->
										<!-- 												href="#">音樂</a> <a href="#">運動</a> <a href="#">居家生活</a> <a -->
										<!-- 												href="#">理財</a> <a href="#">試用商品</a> <a href="#">商品使用心得</a> -->
										<!-- 										</div> -->
										<!-- 									</div> -->
<!-- 										<div class="widget mb-40 p-0 b-0"> -->
<!-- 											<div class="banner-widget"> -->
<!-- 												<a href="#"><img -->
<%-- 													src="<%=request.getContextPath()%>/front_end/assets/img/blog/details/banner.jpg" --%>
<!-- 													alt=""></a> -->
<!-- 											</div> -->
<!-- 										</div> -->
									</div>
								</div>
							</div>
					</section>
					<!-- blog-area end -->

					<!--請注意: 以上填入你要寫的東西 結束-->
			</div>
		</section>
		<!--請注意: 依需求，可多新增一個跟上面一樣的 section，新增在main標籤內 -->


	</main>
	<footer
		data-background="<%=request.getContextPath()%>/front_end/assets/img/bg/footer.jpg">

		<div class="footer-area pt-5">
			<div class="container">
				<div class="row">
					<div class="col-xl-2 col-lg-3 col-md-4">
						<div class="footer-widget mb-40">
							<div class="footer-logo mb-25">
								<img
									src="<%=request.getContextPath()%>/front_end/assets/img/logo/Mumu_logo.png"
									alt="">
							</div>
							<div class="social-icon">
								<a href="#"><i class="fab fa-facebook-f"></i></a> <a href="#"><i
									class="fab fa-twitter"></i></a> <a href="#"><i
									class="fab fa-behance"></i></a> <a href="#"><i
									class="fab fa-linkedin-in"></i></a> <a href="#"><i
									class="fab fa-youtube"></i></a>
							</div>
						</div>
					</div>
					<div class="col-xl-2 col-lg-2 col-md-4">
						<div class="footer-widget mb-40">
							<h4 class="footer-title">募募 Mumu</h4>
							<ul class="footer-link">
								<li><a href="#">關於我們</a></li>

							</ul>
						</div>
					</div>
					<div class="col-xl-2 col-lg-3 col-md-4">
						<div class="footer-widget mb-40">
							<h4 class="footer-title">如何使用</h4>
							<ul class="footer-link">
								<li><a href="#">網站使用條款</a></li>


							</ul>
						</div>
					</div>

					<div class="col-xl-2 col-lg-3 col-md-4">
						<div class="footer-widget mb-40">
							<h4 class="footer-title">常見問題</h4>
							<ul class="footer-link">
								<li><a href="#">問答集</a></li>
								<li><a href="#">- 如何發起一個募資</a></li>
								<li><a href="#">- 如何贊助他人的專案</a></li>
								<li><a href="#">- 如何發起許願</a></li>
							</ul>
						</div>
					</div>


				</div>
			</div>
		</div>
		<div class="copyright-area">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div class="copyright-text text-center">
							<p>Copyright All Right Reserved - 2022</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>


	<!-- JS here -->
	<script
		src="<%=request.getContextPath()%>/front_end/assets/js/vendor/jquery-1.12.4.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/front_end/assets/js/popper.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/front_end/assets/js/bootstrap.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/front_end/assets/js/owl.carousel.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/front_end/assets/js/isotope.pkgd.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/front_end/assets/js/instafeed.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/front_end/assets/js/slick.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/front_end/assets/js/jquery.meanmenu.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/front_end/assets/js/ajax-form.js"></script>
	<script
		src="<%=request.getContextPath()%>/front_end/assets/js/wow.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/front_end/assets/js/jquery.scrollUp.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/front_end/assets/js/imagesloaded.pkgd.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/front_end/assets/js/jquery.magnific-popup.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/front_end/assets/js/plugins.js"></script>
	<script src="<%=request.getContextPath()%>/front_end/assets/js/main.js"></script>

	<!-- 請注意: 要引入下方 js，確保 dropdown功能 -->
	<script
		src="<%=request.getContextPath()%>/front_end/assets/js/dropdown.js"></script>

</body>
</html>