<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file='/pages/common/common.jsp'%>
<%@include file='/pages/common/taglib.jsp'%>
		<script type='text/javascript' src="<ls:templateResource item='/dwr/engine.js'/>"></script>
		<script type='text/javascript' src="<ls:templateResource item='/dwr/util.js'/>"></script>
		<script type='text/javascript' src="<ls:templateResource item='/dwr/interface/CommonService.js'/>"></script>
	    <link rel="stylesheet" type="text/css" media='screen' href="${pageContext.request.contextPath}/common/css/addtocart.css" />
<!--[if IE]>
   <style type="text/css">
   .facebox {
       background:transparent;
       filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#333333,endColorstr=#333333);
       zoom: 1;
    }
    </style>
<![endif]-->
<a href="javascript:showcart(1)"><img  src="${pageContext.request.contextPath}/img/addtocart.jpg" title='<fmt:message key="add.tocart" />' /></a>&nbsp;
<div id="facebox" style="position: absolute; z-index: 9999; top: 260px; left: 430px; display: none;overflow: hidden;">
	<div>
		<h2><span id="can_AddToCart"><fmt:message key="add.tocart.seccess"/></span></h2>
		<p><fmt:message key="cart.have.products"><fmt:param value='<span id="basket_count">1</span>'/></fmt:message>
		<span id="basket_total_cash">1.00</span>&nbsp;<fmt:message key="curreny.unit"/></p>
		<p style="color:#666">
		   <span id="go_ToCash" style="display: none;"><input type="button" value='<fmt:message key="goto.settlement" />' onclick="javascript:gotoCash();" /></span> 
			<a href="javascript:showcart(0)"><fmt:message key="buy.others" /></a>
			<span id="product_Less" style="display: none;"><a href="${pageContext.request.contextPath}/leaveword${applicationScope.WEB_SUFFIX}"><fmt:message key="notice.product.less"/></a></span>
		</p>
	</div>
</div>
<script type="text/javascript">
<!-- 
function gotoCash(){
		document.getElementById("addtoCart").value = "added";
		document.getElementById("form1").submit();
}

//加入购物车
 function showcart(show){
	var facebox1 = document.getElementById("facebox");
	if(show == 0){
		facebox1.style.display = "none";
	}else{
		   var count = document.getElementById("count");
			if(!isNumber(count.value)){
					alert('<fmt:message key="errors.number"><fmt:param value=""/></fmt:message>');
					count.focus();
					return;
			}
			var carriage = '${prod.carriage}';
			if(carriage == null){
				carriage = 0;
			}
		var prodAttr = getProdAttr();
		if(prodAttr.startWith("error")){
			alert('<fmt:message key="please.select" />：' + prodAttr.substring(5));
			return;
		}
		   CommonService.addtocart('${sessionScope.SPRING_SECURITY_LAST_USERNAME}', '${sessionScope.shopName}', ${prod.prodId},'${prod.pic}', '${prod.name}', '${prod.cash}', carriage, count.value,
		   prodAttr, function(retData){
		       document.getElementById("basket_total_cash").innerHTML = "<b>" + retData.BASKET_TOTAL_CASH + "</b>";
		       document.getElementById("basket_count").innerHTML = retData.BASKET_COUNT;
		       if(retData.BASKET_COUNT > 0){
		       	document.getElementById("go_ToCash").style.display = "";
		       }
		       if(retData.PRODUCT_LESS){
				 document.getElementById("can_AddToCart").innerHTML = '<fmt:message key="product.less" />';
				 document.getElementById("product_Less").style.display = "";
		       }
    
		    });
		    facebox1.style.display = "block";
	}
}
//-->
</script>
