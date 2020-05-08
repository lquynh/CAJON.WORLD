<%@include file="header.jsp"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
<title>Cart Online :: Make Order</title>
<style>
input {
  width: 100%;
}
</style>
</head>
<body>
  <%@include file="nav.jsp"%>
  <br />
  <br />
  <table border="1">
    <tr>
      <th colspan="5"><b>Xem lại giỏ hàng</b></th>
    </tr>
    <tr>
      <th>Hình</th>
      <th>Tên SP</th>
      <th>Đơn giá</th>
      <th>Số lượng</th>
      <th>Thành tiền</th>
    </tr>
    <c:forEach items="${info.cartItems}" var="c">
      <tr>
        <td><img class="product-img" src="/cajon_online/images/products/${c.p.image}" /></td>
        <td><b>${c.p.name}</b></td>
        <td><span class="unit-price">${c.p.unitPrice}</span></td>
        <td pid="${c.p.id}" uid="<% out.print(infoUserId); %>"><span class="quantity">${c.quantity}</span></td>
        <td><span class="price" quantity="${c.quantity}" uprice="${c.p.unitPrice}"></span></td>
      </tr>
    </c:forEach>
    <tr>
      <td></td>
      <td></td>
      <td></td>
      <td><span class="quantity" id="total_quantity"></span></td>
      <td><span class="price" id="total_price"></span></td>
    </tr>
  </table>
  <br />
  <form id="formMakeOrder" action="makeOrder" method="post" accept-charset="ISO-8859-1">
    <table border="1">
      <tr>
        <th colspan="2">Thông tin đặt hàng</th>
      </tr>
      <tr>
        <td><b>Tên:</b></td>
        <td><input type="text" id="name" name="name" value="${info.user.name}" /></td>
      </tr>
      <tr>
        <td><b>Địa chỉ:</b></td>
        <td><input type="text" id="address" name="address" value="${info.user.address}" /></td>
      </tr>
      <tr>
        <td><b>Số điện thoại:</b></td>
        <td><input type="text" id="phone" name="phone" value="${info.user.phone}" /></td>
      </tr>
      <tr>
        <td colspan="2"><span class="error" id="error-message"></span><br /> <input type="submit" value="Xác nhận đặt hàng" /></td>
      </tr>
    </table>
  </form>
  <br />


  <script>
			$(".unit-price").each(function() {
				var unit_price = parseInt($(this).text());
				var quantity = parseInt($(this).attr("quantity"));
				$(this).text(formatMoney(unit_price) + "đ");
			});

			var total_price = 0;
			$(".price").not(":last").each(function() {
				var unit_price = parseInt($(this).attr("uprice"));
				var quantity = parseInt($(this).attr("quantity"));
				total_price += (unit_price * quantity);
				$(this).text(formatMoney(unit_price * quantity) + "đ");
				$("#total_price").text(formatMoney(total_price) + "đ");
			});

			var total_quantity = 0;
			$(".quantity").not(":last").each(function() {
				var quantity = parseInt($(this).text());
				total_quantity += quantity;
				$("#total_quantity").text(total_quantity);
			});

			verifyInputs();

			$("#formMakeOrder").submit(
					function(event) {
						var uid = $(this).attr("userId");
						var name = $("#name").val();
						var address = $("#address").val();
						var phone = $("#phone").val();

						if (!checkInput(LABEL_NAME, name, MIN_LEN,
								ONLY_ALPHABETS)) {
							event.preventDefault();
						}
						if (!checkInput(LABEL_ADDRESS, address, MIN_LEN,
								ONLY_NUMBERS_ALPHABETS_COMMA)) {
							event.preventDefault();
						}
						if (!checkInput(LABEL_PHONE, phone, MAX_LEN_PHONE,
								ONLY_NUMBERS)) {
							event.preventDefault();
						}

					});
		</script>
</body>
</html>