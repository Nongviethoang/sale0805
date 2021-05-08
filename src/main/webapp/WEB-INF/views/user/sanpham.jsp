<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tag" uri="/WEB-INF/taglibs/pagingTagLibs.tld"%>
<!doctype html>
<html class="no-js" lang="zxx">

<!-- shopping-cart31:32-->
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Ngọc Hưng Computer</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="/WEB-INF/views/user/layout/css.jsp"></jsp:include>
</head>
<body>

	<!-- Begin Body Wrapper -->
	<div class="body-wrapper">
		<jsp:include page="/WEB-INF/views/user/layout/header.jsp"></jsp:include>
		<!-- Begin Li's Breadcrumb Area -->
		<div class="breadcrumb-area">
			<div class="container">
				<div class="breadcrumb-content">
					<ul>
						<li><a href="/">Trang chủ</a></li>
						<li class="active">Tất cả sản phẩm</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- Begin Li's Content Wraper Area -->
		<div class="content-wraper pt-60 pb-60">
			<div class="container">
				<div class="row">
					<div class="col-lg-9 order-1 order-lg-2">
						<!-- Begin Li's Banner Area -->
						<div class="single-banner shop-page-banner">
							<a href="#"> <img src="${base}/user/images/bg-banner/5.jpg"
								alt="Li's Static Banner">
							</a>
						</div>
						<!-- Li's Banner Area End Here -->
						<!-- shop-top-bar start -->
						<div class="shop-top-bar mt-30">
							<div class="shop-bar-inner">
								<div class="product-view-mode">
									<!-- shop-item-filter-list start -->
									<ul class="nav shop-item-filter-list" role="tablist">
										<li class="active" role="presentation"><a
											aria-selected="true" class="active show" data-toggle="tab"
											role="tab" aria-controls="grid-view" href="#grid-view"><i
												class="fa fa-th"></i></a></li>
										<li role="presentation"><a data-toggle="tab" role="tab"
											aria-controls="list-view" href="#list-view"><i
												class="fa fa-th-list"></i></a></li>
									</ul>
									<!-- shop-item-filter-list end -->
								</div>
								<div class="toolbar-amount">
									<span>Hiển thị 1 đến 12 trong ${total} sản phẩm </span>
								</div>
							</div>
							<!-- product-select-box start -->
							<div class="product-select-box">
								<div class="product-short">
									<p>Sắp xếp:</p>
									<form action="${base}/all-product" method="get">
										<select class="nice-select" name="sort">
											<option>Tất cả</option>
											<c:if test="${sort!=null&&sort!=''}">
											<option value="${sort}" selected="selected">${sort}</option>
											</c:if>
											<option value="Tên (A - Z)">Tên (A - Z)</option>
											<option value="Tên (Z - A)">Tên (Z - A)</option>
											<option value="Giá (Thấp - Cao)">Giá (Thấp &gt; Cao)</option>
											<option value="Giá (Cao - Thấp)">Giá (Cao &gt; Thấp)</option>

										</select> <input style="height: 42px;" class="btn" id="btnSubmit"
											type="submit" value="Sắp xếp">
									</form>
								</div>
							</div>
							<!-- product-select-box end -->
						</div>
						<!-- shop-top-bar end -->
						<!-- shop-products-wrapper start -->
						<div class="shop-products-wrapper">
							<div class="tab-content">
								<div id="grid-view" class="tab-pane fade active show"
									role="tabpanel">
									<div class="product-area shop-product-area">
										<div class="row">
											<c:forEach items="${list}" var="sp">
												<div class="col-lg-4 col-md-4 col-sm-6 mt-40">
													<!-- single-product-wrap start -->
													<div class="single-product-wrap">
														<div class="product-image">
															<a href="${base}/sanphamchitiet/${sp.id}"> <img
																src="${base }/upload${sp.anhs.get(0).path}"
																alt="Li's Product Image">
															</a>

														</div>
														<div class="product_desc">
															<div class="product_desc_info">
																<div class="product-review">
																	<h5 class="manufacturer">
																		<a href="${base}/sanphamchitiet/${sp.id}">Mã sản
																			phẩm:${sp.seo}</a>
																	</h5>

																</div>
																<h4>
																	<a class="product_name"
																		href="${base}/sanphamchitiet/${sp.id}">${sp.tenSanPham}</a>
																</h4>
																<div class="price-box">
																	Giá bán: <span class="new-price"><fmt:setLocale
																			value="vi_VN" scope="session" /> <fmt:formatNumber
																			value="${sp.gia}" type="currency" /> </span> <br> <span
																		class="old-price"> <fmt:setLocale value="vi_VN"
																			scope="session" /> <fmt:formatNumber
																			value="${sp.giaGoc}" type="currency" />
																	</span><span class="discount-percentage">Tiết kiệm
																		${sp.phanTramGiam}%</span>
																</div>
															</div>

															<div class="add-actions">
																<ul class="add-actions-link">
																	<li class="add-cart active"><c:if
																			test="${user==null}">

																			<button class="btn btn-success"
																				onclick="alert('Bạn cần đăng nhập để thêm vào giỏ hàng')">Thêm
																				vào giỏ</button>
																		</c:if> <c:if test="${user!=null}">

																			<button class="btn btn-success"
																				onclick="addToCart(${sp.id},1)">Thêm vào
																				giỏ</button>
																		</c:if></li>
																</ul>
															</div>
														</div>
													</div>
													<!-- single-product-wrap end -->
												</div>
											</c:forEach>
										</div>

									</div>
								</div>
								<div id="list-view" class="tab-pane fade product-list-view "
									role="tabpanel">
									<div class="row">
										<div class="col">
											<c:forEach items="${list}" var="sp">
												<div class="row product-layout-list">
													<div class="col-lg-3 col-md-5 ">
														<div class="product-image">
															<a href="${base}/sanphamchitiet/${sp.id}"> <img
																src="${base }/upload${sp.anhs.get(0).path}"
																alt="Li's Product Image" style="padding-right: 10px;">
															</a>

														</div>
													</div>
													<div class="col-lg-5 col-md-7">
														<div class="product_desc">
															<div class="product_desc_info">
																<div class="product-review">
																	<h5 class="manufacturer">
																		<a href="${base}/sanphamchitiet/${sp.id}">Mã sản
																			phẩm:${sp.seo}</a>
																	</h5>

																</div>
																<h4>
																	<a class="product_name"
																		href="${base}/sanphamchitiet/${sp.id}">${sp.tenSanPham}</a>
																</h4>
																<div class="price-box">
																	Giá bán: <span class="new-price"><fmt:setLocale
																			value="vi_VN" scope="session" /> <fmt:formatNumber
																			value="${sp.gia}" type="currency" /> </span> <br> <span
																		class="old-price"> <fmt:setLocale value="vi_VN"
																			scope="session" /> <fmt:formatNumber
																			value="${sp.giaGoc}" type="currency" />
																	</span><span class="discount-percentage">Tiết kiệm
																		${sp.phanTramGiam}%</span>
																</div>

															</div>
														</div>
													</div>
													<div class="col-lg-4">
														<div class="shop-add-action mb-xs-30">
															<ul class="add-actions-link">
																<li class="add-cart active"><c:if
																		test="${user==null}">

																		<button class="btn btn-success"
																			onclick="alert('Bạn cần đăng nhập để thêm vào giỏ hàng')">Thêm
																			vào giỏ</button>
																	</c:if> <c:if test="${user!=null}">

																		<button class="btn btn-success"
																			onclick="addToCart(${sp.id},1)">Thêm vào
																			giỏ</button>
																	</c:if></li>

															</ul>
														</div>
													</div>
												</div>
											</c:forEach>
										</div>
									</div>
								</div>
								<div class="paginatoin-area">
									<div class="row">
										<div class="col-lg-6 col-md-6">
											
										</div>
										<div class="col-lg-6 col-md-6 pt-xs-15">

											<!-- Phân trang -->
											<tag:paginate offset="${page.offset}" count="${page.count }"
												uri="${pageUrl}" />
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- shop-products-wrapper end -->
					</div>
					<div class="col-lg-3 order-2 order-lg-1">
						<!--sidebar-categores-box start  -->
						<div class="sidebar-categores-box">
						<form action="#" method="get">
							<div class="sidebar-title">
								<h2>Lọc bởi</h2>
							</div>
							<!-- btn-clear-all start -->
							<a href="${base}/all-product" class="btn-clear-all mb-sm-30 mb-xs-30" ">Làm mới</a> 
							<!-- btn-clear-all end -->
							<!-- filter-sub-area start -->
							<div class="filter-sub-area">
								
									<h5 class="filter-sub-titel">Thương hiệu</h5>
									<div class="categori-checkbox">
									<select name="thuong-hieu">
									<option value=" ">--Thương hiệu--</option>
									<c:if test="${thuonghieu!=null&&!thuonghieu.isEmpty()}">
									<option value="${thuonghieu}" selected="selected">${thuonghieu}</option>
									</c:if>									
									<c:forEach items="${th}" var="th">
									<option value="${th.tenThuongHieu}">${th.tenThuongHieu}</option>
									</c:forEach>
									</select>
									</div>
							</div>
							<!-- filter-sub-area end -->
							<!-- filter-sub-area start -->
							<div class="filter-sub-area pt-sm-10 pt-xs-10">
								<h5 class="filter-sub-titel">CPU</h5>
								<div class="categori-checkbox">
								<select name="cpu">
								<option value="">--CPU--</option>
								<c:if test="${chip!=null}">
								<option value="${chip}" selected="selected">${chip}</option>
								</c:if>
								<c:forEach items="${cpu}" var="item">
								<option value="${item}">${item}</option>
								</c:forEach>
								</select>
								</div>
							</div>
							<!-- filter-sub-area end -->
							<!-- filter-sub-area start -->
							<div class="filter-sub-area pt-sm-10 pt-xs-10">
								<h5 class="filter-sub-titel">RAM</h5>
								<div class="color-categoriy">

									<select name="ram">
									
								<option value="">--RAM--</option>
								<c:if test="${rams!=null}">
								<option value="${rams}" selected="selected">${rams}</option>
								</c:if>
								<c:forEach items="${ram}" var="item">
								<option value="${item}">${item}</option>
								</c:forEach>
								</select>

								</div>
							</div>
							<!-- filter-sub-area end -->
							<!-- filter-sub-area start -->
							<div class="filter-sub-area pt-sm-10 pt-xs-10">
								<h5 class="filter-sub-titel">Ổ cứng</h5>
								<div class="color-categoriy">

									<select name="ocung">
									
								<option value="">--Ổ cứng--</option>
								<c:if test="${oCungs!=null}">
								<option value="${oCungs}" selected="selected">${oCungs}</option>
								</c:if>
								<c:forEach items="${ocung}" var="item">
								<option value="${item}">${item}</option>
								</c:forEach>
								</select>

								</div>
							</div>
							<!-- filter-sub-area end -->
							<!-- filter-sub-area start -->
							<div class="filter-sub-area pt-sm-10 pt-xs-10">
								<h5 class="filter-sub-titel">Màu sắc</h5>
								<div class="size-checkbox">

									<select name="mau">
								<option value="">--Màu sắc--</option>
								<c:if test="${maus!=null}">
								<option value="${maus}" selected="selected">${maus}</option>
								</c:if>
								<c:forEach items="${mau}" var="item">
								<option value="${item}">${item}</option>
								</c:forEach>
								</select>

								</div>
							</div>
							<!-- filter-sub-area end -->
							<!-- filter-sub-area start -->
							<div class="filter-sub-area pt-sm-10 pt-xs-10">
								<h5 class="filter-sub-titel">Màn hình</h5>
								<div class="color-categoriy">

									<select name="manhinh">
								<option value="">--Màn hình--</option>
								<c:if test="${manhinhs!=null}">
								<option value="${manhinhs}" selected="selected">${manhinhs}</option>
								</c:if>
								<c:forEach items="${manhinh}" var="item">
								<option value="${item}">${item}</option>
								</c:forEach>
								</select>

								</div>
							</div>
							<!-- filter-sub-area end -->
							<!-- filter-sub-area start -->
							<div class="filter-sub-area pt-sm-10 pb-sm-15 pb-xs-15">
								<h5 class="filter-sub-titel">Hệ điều hành</h5>
								<div class="categori-checkbox">
								<select name="hdh">
								<option value="">--Hệ điều hành--</option>
								<c:if test="${hdhs!=null}">
								<option value="${hdhs}" selected="selected">${hdhs}</option>
								</c:if>
								<c:forEach items="${os}" var="item">
								<option value="${item}">${item}</option>
								</c:forEach>
								</select>

								</div>
							</div>
							<button class="btn btn-primary mb-sm-30 mb-xs-30">Lọc</button>
							</form>
							<!-- filter-sub-area end -->
						</div>
						<!--sidebar-categores-box end  -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Content Wraper Area End Here -->
	<jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>
	</div>
	<jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>
</body>
<script type="text/javascript">
/* Checkbox */
function sort() {
	
				alert("Cảm ơn bạn đã gui mail");
		
}
/* Checkbox */
function Check() {
	$.ajax({
		url: "/all-product",
		type: "get",
		contentType: "application/json",
		data: JSON.stringify({}),
		dataType: "json",
		success: function(jsonResult) {	
				alert("Cảm ơn bạn đã checkbox");
		},
		error: function (jqXhr, textStatus, errorMessage) { // error callback 
   
	    }
	});
}
/* Checkbox */
</script>
<!-- shopping-cart31:32-->
</html>
