<?xml version="1.0" encoding="utf-8" ?>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"></link>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="Static/css/Css.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<title>Admin đăng nhập</title>
</head>
<body>
<div class="container" style="padding-top: 60px;">
		<h2 class="text-sm-center">Đăng nhập</h2>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-sm-8 offset-2">
				<form action="/login-admin"  method="post" >
					<div class="card">
						<div class="card-body">
							 <c:choose>
							<c:when test="${message =='Saitk' }">
								<div id="error" class="alert alert-danger">
									<strong>Error!</strong>Tên tài khoản hoặc mật khẩu sai!
								</div>
								
							</c:when>
							
							
							</c:choose>
							<fieldset class="form-group">
								<label for="username">Tên đăng nhập<span style="color: red;">(*)</span></label>
								<input type="text" class="form-control" name="username" id="username" placeholder="Nhập tên đăng nhập" required/>
								<div id="error_tendangnhap" class="alert alert-danger">
									<strong>Error!</strong> Chưa điền tên đăng nhập!
								</div>
							</fieldset>
							<fieldset class="form-group">

								<label for="password">Mật khẩu<span style="color: red;">(*)</span></label>
								<input type="password" name="password" class="form-control" id="password" placeholder="Nhập mật khẩu" required/>
								<div id="error_mk" class="alert alert-danger">
									<strong>Error!</strong> Chưa điền mật khẩu!
								</div>
							</fieldset>
							
							<input type="submit" class="btn btn-outline-primary btn-block" id="login" value="Đăng nhập"/>
						</div>
					</div>
				</form>
			</div>	
		</div>
	</div>
<script>
	$( document ).ready( function () {

		
		$( "#error_tendangnhap" ).hide();
		$( "#error_mk" ).hide();
		var error_tendangnhap = true;
		var error_mk = true;
		$( '#username' ).focusout( function () {
			check_input_username();

		} );
		$( '#password' ).focusout( function () {
			check_input_password();

		} );

		function check_input_username() {
			var lenght = $( '#username' ).val().length;
			if ( lenght == 0 ) {
				$( "#error_tendangnhap" ).show();
				error_tendangnhap = true;
			} else {
				$( "#error_tendangnhap" ).hide();
				error_tendangnhap = false;
			}
		}

		function check_input_password() {
			var lenght = $( '#password' ).val().length;
			if ( lenght == 0 ) {
				$( "#error_mk" ).show();
				error_mk = true;
			} else {
				$( "#error_mk" ).hide();
				error_mk = false;
			}
		}

		$( '#login' ).click( function () {
			if ( error_tendangnhap == false && error_mk == false ) {
				$( "#error_tendangnhap" ).hide();
				$( "#error_mk" ).hide();
				
			} else {
				$( "#error_tendangnhap" ).show();
				$( "#error_mk" ).show();
			}

		} );
			
	} );
</script>

</body>
</html>