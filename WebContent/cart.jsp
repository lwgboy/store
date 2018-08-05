<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>黑马商城购物车</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>

<script type="text/javascript">
	function deleteCartProduct(pid) {
		location.href = "${pageContext.request.contextPath}/productCentre?method=deleteCartProduct&pid="
				+ pid;
	}
	$(function() {
		$("#clear")
				.click(
						function() {
							var flag = confirm("确认要清空购物车吗？");
							if (flag) {
								location.href = "${pageContext.request.contextPath}/productCentre?method=clearCart";
							}
						})
	});
</script>

<!-- 引入自定义css文件 style.css -->
<link rel="stylesheet" href="css/style.css" type="text/css" />
<style>
body {
	margin-top: 20px;
	margin: 0 auto;
}

.carousel-inner .item img {
	width: 100%;
	height: 300px;
}

font {
	color: #3164af;
	font-size: 18px;
	font-weight: normal;
	padding: 0 10px;
}
</style>
</head>

<body>
	<!-- 引入header.jsp -->
	<jsp:include page="/header.jsp"></jsp:include>



	<div class="container">
		<div class="row">
			<c:if test="${!empty cart.cartmap}">
				<div style="margin: 0 auto; margin-top: 10px; width: 950px;">
					<strong style="font-size: 16px; margin: 5px 0;">订单详情</strong>
					<table class="table table-bordered">
						<tbody>
							<tr class="warning">
								<th>图片</th>
								<th>商品</th>
								<th>价格</th>
								<th>数量</th>
								<th>小计</th>
								<th>操作</th>
							</tr>


							<c:forEach items="${cart.cartmap }" var="entry">

								<tr class="active">
									<td width="60" width="40%"><input type="hidden" name="id"
										value="22"> <img src="${entry.value.pro.pimage }"
										width="70" height="60"></td>
									<td width="30%"><a target="_blank">${entry.value.pro.pname }</a>
									</td>
									<td width="20%">${entry.value.pro.shop_price }</td>
									<td width="10%"><input type="text" name="quantity"
										value="${entry.value.buyNum}" maxlength="4" size="10">
									</td>
									<td width="15%"><span class="subtotal">￥${entry.value.subtotal }</span>
									</td>
									<td><a href="javascript:;" class="delete"
										onclick="deleteCartProduct('${entry.value.pro.pid}')">删除</a></td>
								</tr>
							</c:forEach>


						</tbody>
					</table>
				</div>
			</c:if>
		</div>
		
		<c:if test="${empty cart.cartmap}">
			<div><img alt="" src="${pageContext.request.contextPath }/img/cart-empty.png"></div>
			<a href="${pageContext.request.contextPath }/productCentre?method=index">返回首页</a>
		</c:if>



		<div style="margin-right: 130px;">
			<div style="text-align: right;">
				<em style="color: #ff6600;"> 登录后确认是否享有优惠&nbsp;&nbsp; </em> 赠送积分: <em
					style="color: #ff6600;">${cart.total }</em>&nbsp; 商品金额: <strong
					style="color: #ff6600;">￥${cart.total }元</strong>
			</div>
			<div
				style="text-align: right; margin-top: 10px; margin-bottom: 10px;">
				<a href="javascript:void(0)" id="clear" class="clear">清空购物车</a> 
				
				
				
				<a href="${pageContext.request.contextPath}/productCentre?method=submitOrder"> <input type="submit" width="100"
					value="提交订单" name="submit" border="0"
					style="background: url('./images/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px; width: 100px; color: white;">
				</a>
			</div>
		</div>

	</div>

	<!-- 引入footer.jsp -->
	<jsp:include page="/footer.jsp"></jsp:include>

</body>

</html>