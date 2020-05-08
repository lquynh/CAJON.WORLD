<%@include file="header.jsp"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
<title>Cajon Online :: Add Product</title>
<style>
input[type="text"],input[type="file"],textarea {
  width: 100%;
}
</style>
</head>
<body>
  <%@include file="nav.jsp"%>
  <br />
  <br />
  <form action="uploadImageForNewProduct" method="post" enctype="multipart/form-data">
    <table border="1">
      <tr>
        <th colspan="2">Tải lên ảnh sản phẩm</th>
      </tr>
      <tr>
        <td><b>Chọn ảnh</b></td>
        <td><input type="file" name="image" accept="image/*" /></td>
      </tr>
      <%
      	if (info.getTempProduct() != null) {
      %>
      <tr>
        <td colspan="2" style="text-align: center;"><img src="<%out.print(Values.ROOT_DIR);%>/images/products/<%out.print(info.getTempProduct().getImage());%>" style="width: 100px;" /></td>
      </tr>
      <%
      	}
      %>
      <tr>
        <td colspan="2"><input type="submit" value="Tải ảnh lên" /></td>
      </tr>
    </table>
  </form>
  <br />

  <form action="addNewProduct" id="formAddProduct" method="post" accept-charset="ISO-8859-1">
    <table border="1">
      <tr>
        <th colspan="2">Nhập thông tin sản phẩm</th>
      </tr>
      <tr>
        <td><b>Tên sản phẩm</b></td>
        <td><input type="text" id="name" name="name" /></td>
      </tr>
      <tr>
        <td><b>Hình ảnh</b></td>
        <td><input readonly="readonly" id="image" type="text" name="image" value="${info.tempProduct.image}" /></td>
      </tr>
      <tr>
        <td><b>Mô tả</b></td>
        <td><textarea id="description" name="description" rows="5"></textarea></td>
      </tr>
      <tr>
        <td><b>Đơn giá</b></td>
        <td><input id="price" class="price" type="text" name="price" /></td>
      </tr>
      <tr>
        <td colspan="2"><span class="error" id="error-message"></span><br /><input type="submit" id="btnAddProduct" value="Thêm vào CSDL" /></td>
      </tr>
    </table>
  </form>
  <script>
			$(document).ready(
					
					function() {
						var image = $("#image").val();
						var name = $("#name").val();
						var description = $("#description").text();
						var price = $("#price").val();
						
						if (image == "") {
							thongbaoloi("Chưa có hình!");
							$("#name").attr("disabled", "disabled");
							$("#description").attr("disabled", "disabled");
							$("#price").attr("disabled", "disabled");
							$("#btnAddProduct").attr("disabled", "disabled");
						}
						verifyInputs();
						$("#formAddProduct").submit(
								function(event) {
									
									var image = $("#image").val();
									var name = $("#name").val();
									var description = $("#description").text();
									var price = $("#price").val();
									
									if (!checkInput("Tên sản phẩm", name,
											MIN_LEN, ONLY_NUMBERS_ALPHABETS)) {
										event.preventDefault();
									}
									
									if (!checkInput("Tiền", price,
											6, ONLY_NUMBERS)) {
										event.preventDefault();
									}
									
									if (image == '') {
										thongbaoloi("Chưa có hình!");
										event.preventDefault();
									}
								});
					});
		</script>
</body>
</html>