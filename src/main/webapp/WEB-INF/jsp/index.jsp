<!DOCTYPE HTML>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="Sat, 01 Dec 2001 00:00:00 GMT">

<title>News Manager</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"></link>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="Static/css/Css.css">
<script src="Static/js/ckeditor/ckeditor.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="Static/ckeditor"></script>

<!--[if lt IE 9]>
		<script src="static/js/html5shiv.min.js"></script>
		<script src="static/js/respond.min.js"></script>
	<![endif]-->
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<!-- Brand/logo -->
		<a class="navbar-brand" href="home">Tin tức</a>

		<!-- Links -->
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="new-task">Thêm
					Tin tức</a></li>

			<li class="nav-item"><a class="nav-link" href="all-tasks">All
					Tin Tức</a></li>
			<li class="nav-item"><a class="nav-link" href="xem"
				target="_blank">Xem tin tức</a></li>

		</ul>
	</nav>

	<c:choose>
		<c:when test="${mode == 'MODE_HOME'}">
			<div class="container" id="homeDiv">
				<div class="jumbotron text-center ">
					<h1>Welcome to News Manager</h1>
				</div>
			</div>
		</c:when>
		<c:when test="${mode == 'MODE_TINTUC'}">
			<div class="container text-center " id="tasksDiv">
				<h3>My News</h3>
				<hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered text-left">
						<thead>
							<tr>
								<th>Id</th>
								<th>Tên tin tức</th>
								<th>Hình ảnh</th>
								<th>Nội dung</th>
								<th>Ngày đăng</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="tintuc" items="${tintucs}">
								<tr>
									<td>${tintuc.id}</td>
									<td>${tintuc.name}</td>
									<td>${tintuc.hinhanh}</td>
									<td class="rut-gon-nd">${tintuc.noidung}</td>
									<td><fmt:formatDate pattern="HH:MM dd/MM/yyyy"
											value="${tintuc.thoigian}" /></td>
									<td><a href="update-task?id=${tintuc.id}"><span><i
												class="fa fa-pencil" aria-hidden="true" style="color: black"></i></span></a></td>
									<td><a href="delete-task?id=${tintuc.id}"><span><i
												class="fa fa-trash" aria-hidden="true" style="color: black"></i></span></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>
		<c:when test="${mode == 'MODE_NEW'|| mode == 'MODE_UPDATE'}">
			<div class="container ">
				<h3 style="text-align: center;">Add News</h3>
				<hr>
				<div class="row">
					<div class="col-lg-8 offset-2">

						<form action="save-task" method="post"
							enctype="multipart/form-data" >
							<div class="card">
								<div class="card-body">
									<div class="form-group">
										<input type="hidden" class="form-control" name="id"
											value="${tintuc.id}">
									</div>
									<div class="form-group">
										<label for="Name">Name:</label> <input type="text"
											class="form-control" id="Name" name="Name"
											value="${tintuc.name}">
									</div>

									<fieldset class="form-group">

										<img width="300" height="300"
											src="http://placehold.it/300x300" class="card-img-top"
											id="blah" />
									</fieldset>

									<div class="form-group">
										<label for="hinhanh">Hình ảnh:</label> <input type="file"
											class="form-control" id="hinhanh" name="hinhanh"
											value="${tintuc.hinhanh}">
									</div>
									<div class="form-group">
										<label for="noidung">Nội dung:</label>
										<textarea class="form-control" id="noidung" name="noidung">${tintuc.noidung}</textarea>
										<script>
											CKEDITOR.replace("noidung");
										</script>
									</div>

									<button type="submit" class="btn btn-primary" value="Save">Submit</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</c:when>
	</c:choose>


		<script type="text/javascript">
		$(document).ready(function() {
			$('#blah').hide();
			function readURL(input) {

				if (input.files && input.files[0]) {
					var reader = new FileReader();

					reader.onload = function(e) {
						$('#blah').attr('src', e.target.result);
					}

					reader.readAsDataURL(input.files[0]);
				}
			}

			$("#hinhanh").change(function() {
				readURL(this);
				$('#blah').show();
			});
		});
	</script>

<!-- 
	<script src="ckeditor/ckeditor.js"></script>
	<script src="ckfinder/ckfinder.js"></script>
	<script>
		CKEDITOR
				.replace(
						'noidung',
						{
							filebrowserBrowseUrl : 'ckfinder/ckfinder.html',
							filebrowserImageBrowseUrl : 'ckfinder/ckfinder.html?type=Images',
							filebrowserFlashBrowseUrl : 'ckfinder/ckfinder.html?type=Flash',
							filebrowserUploadUrl : 'ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files',
							filebrowserImageUploadUrl : 'ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images',
							filebrowserFlashUploadUrl : 'ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash'
						});
	</script>
 -->




</body>
</html>