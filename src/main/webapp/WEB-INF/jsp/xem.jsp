<?xml version="1.0" encoding="utf-8" ?>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="Static/css/Css.css"></link>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<title>Xem tin tức</title>


</head>
<body>


	<div>
		<div class="header">
			<!--<ul>
				<li><a href="#"><i class="fa fa-user-plus"
						aria-hidden="true"></i> Sign Up</a></li>
				<li><a href="#"><i class="fa fa-sign-in" aria-hidden="true"></i>
						Login</a></li>
			</ul>-->
			<img src="Static/image/nd.jpg" style="height: auto; width: 100%;" />

		</div>

	</div>


	<nav class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top"
		id="menutop"> <a class="navbar-brand" href="">Trang chủ</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#collapsibleNavbar">
		<span class="navbar-toggler-icon"></span>
	</button>



	<div class="collapse navbar-collapse" id="collapsibleNavbar">


		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="#">Tin tức</a></li>
			<li class="nav-item"><a class="nav-link" href="#">Liên hệ</a></li>



		</ul>
		<ul class="navbar-nav ml-auto">
			<li class="nav-item">
				<div>
					<form class="form-inline">
						<div class="input-group">

							<input type="text" class="form-control" placeholder="Search..." />
							<button class="input-group-addon" type="submit">
								<i class="fa fa-search" aria-hidden="true"></i>
							</button>
						</div>
					</form>
				</div>
			</li>
		</ul>

	</div>


	</nav>




	<div class="container-fluid">
		<br>
			<div id="main">
				<div class="row">

					<div class="col-md-2 col-lg-2" id="left">
						<!--begin menu left-->
					
					</div>

					<!--end menu left-->
					<div class="col-md-8 col-lg-8" id="center">
						<div class="row"></div>
						<br />

						<!-- Bat dau bai viet -->
						<div class="col-md-12 col-lg-12">
							<div style="text-align: justify">
								<!-- Tieu de Bai viet -->
								<c:choose>
									<c:when test="${mode == 'MODE_tintucchinh'}">
										<div>
											<h2>${tintuc.name}</h2>
											<span style="color: #999;"><fmt:formatDate
													pattern="HH:MM-dd/MM/yyyy" value="${tintuc.thoigian}" /></span>
										</div>

										<!-- Noi dung bai viet -->
										<div>${tintuc.noidung}</div>
									</c:when>
								</c:choose>
							</div>
						</div>


						<!-- Ket thuc bai viet -->






						<div class="clear">
							<br>
						</div>
						<!-- Kết thúcComment bài viết -->


						<!-- 						Bai viet khác -->
						<hr></hr>
						<h3>Xem thêm</h3>
						<c:forEach var="tintuc" items="${lienquan}">
							<div class="row">
								<div style="float: left;"
									class="col-xs-12 col-sm-12 col-md-12 col-lg-4 ">
									<a href="xemthem?id=${tintuc.id}"> <iframe
											src="${tintuc.hinhanh}" width="180" height="120"></iframe>
									</a>
								</div>

								<div style="float: right; padding-left: auto;"
									class="col-xs-12 col-sm-12 col-md-12 col-lg-8">
									<div>
										<h3>${tintuc.name}</h3>
										<span style="color: #999;"><fmt:formatDate
												pattern="HH:MM-dd/MM/yyyy" value="${tintuc.thoigian}" /></span>
									</div>
									<div class="rut-gon">${tintuc.noidung}</div>

									<a style="float: right;" href="xemthem?id=${tintuc.id}">Đọc
										tiếp<i class="fa fa-angle-double-right" aria-hidden="true"></i>
									</a>
								</div>
							</div>
							<hr></hr>
						</c:forEach>



						<div class="clear">
							<br></br>
						</div>

					</div>
				</div>


			</div>
	</div>
	</div>
	<style type="text/css">
.rut-gon {
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 3; /* number of lines to show */
	line-height: 1.4em; /* fallback */
	max-height: 4.2em; /* cái này phải = line-height x 2 */
}
</style>

	<footer class="clearfix" id="footer">
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-lg-4 widget-item" id="about">

				<ul>

					<li><i class="fa fa-envelope" aria-hidden="true"
						style="font-size: 20px;"></i> Gmail thì ở đây</li>
					<li><a href="https://www.facebook.com/uyenellen"
						target="_blank"><i class="fa fa-facebook" aria-hidden="true"
							style="font-size: 20px;"></i> Facebook thì ở đây</a></li>
				</ul>
			</div>
			<div class="col-md-2 col-lg-2 widget-item">
				<h4 class="widget-title">Tài khoản</h4>
				<ul class="widget-menu">
					<li><a href="#">Trang chủ</a></li>

					</li>
					<li><a href="#">Tin tức</a></li>
					<li><a href="#">Liên hệ</a></li>
				</ul>

			</div>




			<div class="col-md-2 col-lg-2 widget-item">
				<h4 class="widget-title">Hướng dẫn</h4>
				<ul class="widget-menu">
					<li><a href="#">Hướng dẫn mua hàng</a></li>

				</ul>

			</div>
		</div>
	</div>
	<div class="bottom-footer">
		<div class="container">
			<div class="row">
				<div class="col-xl-12 col-lg-6 text-left">
					<span class="info-website"> © Bản quyền thuộc về TT Team </span>
				</div>
			</div>
		</div>
	</div>
	</footer>
</body>
</html>