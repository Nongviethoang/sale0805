<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" type="image/png" sizes="16x16"
	href="plugins/images/favicon.png">
<title>Administrator</title>
<jsp:include page="/WEB-INF/views/admin/layout/css.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/valiable.jsp"></jsp:include>
</head>

<body class="fix-header">
	<!-- ============================================================== -->
	<!-- Preloader -->
	<!-- ============================================================== -->
	<div class="preloader">
		<svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none"
				stroke-width="2" stroke-miterlimit="10" />
        </svg>
	</div>
	<!-- ============================================================== -->
	<!-- Wrapper -->
	<!-- ============================================================== -->
	<div id="wrapper">
		<!-- ============================================================== -->
		<jsp:include page="/WEB-INF/views/admin/layout/header.jsp"></jsp:include>

		<!-- ============================================================== -->
		<!-- Page Content -->
		<!-- ============================================================== -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row bg-title">
					<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
						<h4 class="page-title">Thêm sản phẩm</h4>
					</div>
					<div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
						<ol class="breadcrumb">

							<li class="active">Thêm sản phẩm</li>
						</ol>
					</div>
				</div>
				<!-- /.row -->
				<!-- .row -->
				<div class="row row-main">

					<div class="col-md-12 col-xs-12">
						<div class="white-box">
							<sf:form class="form-horizontal form-material"
								modelAttribute="sanpham"
								action="${base}/admin1/sanpham/themsanpham" method="post"
								enctype="multipart/form-data">
								<sf:hidden path="id" />
								<sf:hidden path="seo" />
								<div class="row form-group">
									<label class="col-md-12">Tên sản phẩm</label>
									<div class="col-md-12">
										<sf:input path="tenSanPham" required="required" type="text"
											placeholder="Tên sản phẩm" name="tensanpham"
											class="form-control form-control-line" />
									</div>
								</div>
								<div class="row form-group">
									<label class="col-md-1" for="cpu">CPU</label>
									<div class="col-md-3">
										<sf:select path="CPU">
											<option value="">Chọn loại CPU</option>
											<sf:option value="Intel core i3">Intel core i3</sf:option>
											<sf:option value="Intel core i5">Intel core i5</sf:option>
											<sf:option value="Intel core i7">Intel core i7</sf:option>
											<sf:option value="Intel core i9">Intel core i9</sf:option>
											<sf:option value="Intel core M3">Intel core M3</sf:option>
											<sf:option value="Intel Xeon">Intel Xeon</sf:option>
											<sf:option value="AMD Ryzen 3">AMD Ryzen 3</sf:option>
											<sf:option value="AMD Ryzen 5">AMD Ryzen 5</sf:option>
											<sf:option value="AMD Ryzen 7">AMD Ryzen 7</sf:option>
											<sf:option value="AMD Ryzen 9">AMD Ryzen 9</sf:option>
										</sf:select>
									</div>
									<label class="col-md-1" for="ram">RAM</label>
									<div class="col-md-3">
										<sf:select path="RAM">
										<option value="">Chọn RAM</option>
											<sf:option value="4G">4G</sf:option>
											<sf:option value="8G">8G</sf:option>
											<sf:option value="16G">16G</sf:option>
											<sf:option value="32G">32G</sf:option>
											<sf:option value=">32G">>32G</sf:option>
										</sf:select>
									</div>
									<label class="col-md-1" for="ram">Ổ cứng</label>
									<div class="col-md-3">
										<sf:select path="oCung">
											<option value="">Chọn ổ cứng</option>
											<sf:option value="64G SSD">64G SSD</sf:option>
											<sf:option value="128G SSD">128G SSD</sf:option>
											<sf:option value="256G SSD">256G SSD</sf:option>
											<sf:option value="512G SSD">512G SSD</sf:option>
											<sf:option value="1T SSD">1T SSD</sf:option>
											<sf:option value="500G HDD">500G HDD</sf:option>
											<sf:option value="1T HDD">1T HDD</sf:option>
											<sf:option value="128 SSD 500G HDD">128G SSD+500G HDD</sf:option>
											<sf:option value="128G SSD 1T HDD">128G SSD+1T HDD</sf:option>
											<sf:option value="256G SSD 500G HDD">256G SSD+500G HDD</sf:option>
											<sf:option value="256G SSD 1T HDD">256G SSD+1T HDD</sf:option>
												<sf:option value="521G SSD+500G HDD">512G SSD+500G HDD</sf:option>
											<sf:option value="512G SSD+1T HDD">512G SSD+1T HDD</sf:option>
											<sf:option value="1T SSD+500G HDD">1T SSD+500G HDD</sf:option>
											<sf:option value="1G SSD+1T GHDD">1T SSD+1T HDD</sf:option>
										</sf:select>
									</div>

								</div>
								<div class="row form-group">
								<label  class="col-md-1" for="mau">Màu</label>
									<div class="col-md-3">
										<sf:select path="mau">
											<option value="">Chọn màu</option>
											<sf:option value="Đỏ">Đỏ</sf:option>
											<sf:option value="Trắng">Trắng</sf:option>
											<sf:option value="Đen">Đen</sf:option>
											<sf:option value="Xám">Xám</sf:option>
											<sf:option value="Vàng">Vàng</sf:option>
											<sf:option value="Bạc">Bạc</sf:option>
										</sf:select>
									</div>
									<label class="col-md-1" for="cpu">Màn hình</label>
									<div class="col-md-3">
										<sf:select path="manHinh">
											<option value="">Chọn màn hình</option>
											<sf:option value="12.3 inch">12.3 inch</sf:option>
											<sf:option value="12.4 inch">12.4 inch</sf:option>
											<sf:option value="12.5 inch">12.5 inch</sf:option>
											<sf:option value="13.3 inch">13.3 inch</sf:option>
											<sf:option value="13.4 inch">13.4 inch</sf:option>
											<sf:option value="14 inch">14 inch</sf:option>
											<sf:option value="15 inch">15 inch</sf:option>
											<sf:option value="15.6 inch">15.6 inch</sf:option>
											<sf:option value="16 inch">16 inch</sf:option>
											<sf:option value="khác">Khác</sf:option>
										</sf:select>
									</div>
									
									<label class="col-md-1" for="ram">Hệ điều hành</label>
									<div class="col-md-3">
										<sf:select path="heDieuHanh">
											<option >Chọn hệ điều hành</option>
											<sf:option value="window 10">Window 10</sf:option>
											<sf:option value="linux">Linux</sf:option>
											<sf:option value="Mac OS">Mac OS</sf:option>
										</sf:select>
									</div>

								</div>
								
								<div class="row form-group">
									<label for="soluong" class="col-md-1">Số lượng</label>
									<div class="col-md-3">
										<sf:input path="soLuong" required="required" type="number"
											id="number" placeholder="Tên sản phẩm" name="soLuong"
											class="form-control form-control-line" />
									</div>
									<label for="price" class="col-md-1">Giá bán</label>
									<div class="col-md-3">
										<sf:input path="gia" required="required" type="text"
											placeholder="Giá bán" id="price" name="gia"
											class="form-control form-control-line" />
									</div>
									<label for="pricesale" class="col-md-1">Giá gốc</label>
									<div class="col-md-3">
										<sf:input path="giaGoc" required="required" type="text"
											placeholder="Giá gốc" id="pricesale" name="giagoc"
											class="form-control form-control-line" />
									</div>
								</div>	
								<div class="form-group">
									<label class="col-md-12">Ảnh</label>
									<div class="col-md-12">
									<c:if test="${sanpham.id==null}">
										<input name="anh" id="gallery-photo-add" required="required"
											type="file" multiple="multiple"
											class="form-control form-control-line">
											</c:if>
									<c:if test="${sanpham.id!=null}">
										<input name="anh" id="gallery-photo-add"
											type="file" multiple="multiple"
											class="form-control form-control-line">
											</c:if>
									</div>
									<div class="row">
									<div class="gallery"></div>
									</div>
									
								</div>
								<div class="col-md-12"></div>
								<div class="form-group">
									<label class="col-md-12">Thương hiệu</label>
									<div class="col-md-12">
										<sf:select class="form-control form-control-line"
											path="thuongHieus.id">
											<%--  <sf:option  value="${}"></sf:option> --%>
											<sf:options items="${listThuongHieu}"
												itemLabel="tenThuongHieu" itemValue="id" />
										</sf:select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-12">Danh mục</label>
									<div class="col-md-12">
										<sf:select class="form-control form-control-line"
											path="danhMucs.id">
											<%--  <sf:option  value="${}"></sf:option> --%>
											<sf:options items="${listDanhMuc}" itemLabel="tenDanhMuc"
												itemValue="id" />

										</sf:select>
									</div>
								</div>

								<div class="form-group">
									<label class="col-md-12">Cấu hình</label>
									<div class="col-md-12">
										<sf:textarea required="required" path="cauHinh" type="text"
											id="motasanpham" name="cauhinh" placeholder="Cấu hình"
											class="form-control form-control-line" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-12">Đánh giá</label>
									<div class="col-md-12">
										<sf:textarea required="required" path="gioiThieu" type="text"
											id="gioithieu" name="cauhinh" placeholder="Cấu hình"
											class="form-control form-control-line" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-12">Thời gian bảo hành</label>
									<div class="col-md-12">
										<sf:select required="required" path="baoHanh">
											<sf:option value="1">6 tháng</sf:option>
											<sf:option value="2">12 tháng</sf:option>
											<sf:option value="3">24 tháng</sf:option>
										</sf:select>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-12">
										<button type="submit" onclick="return checkNumber();"
											class="btn btn-success">${sanpham.id==null?'Thêm':'Sửa' }</button>
									</div>
								</div>
							</sf:form>
						</div>
					</div>
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->

		</div>

	</div>
	<jsp:include page="/WEB-INF/views/admin/layout/js.jsp"></jsp:include>

	<script type="text/javascript">
		$(function() {
			// Multiple images preview in browser
			var imagesPreview = function(input, placeToInsertImagePreview) {

				if (input.files) {
					var filesAmount = input.files.length;

					for (i = 0; i < filesAmount; i++) {
						var reader = new FileReader();

						reader.onload = function(event) {
							$($.parseHTML('<img class="col-md-3">')).attr('src',
									event.target.result).appendTo(
									placeToInsertImagePreview);
						}

						reader.readAsDataURL(input.files[i]);
					}
				}

			};

			$('#gallery-photo-add').on('change', function() {
				imagesPreview(this, 'div.gallery');
			});
		});
	</script>
</body>

</html>
