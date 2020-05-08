<%@include file="header.jsp"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
<title>Cajon Online :: Add Product</title>
<style>
input[type="text"],input[type="file"],textarea {
  width: 100%;
}
input[type="file"] {
    display: none;
}
.custom-file-upload {
    border: 1px solid #333;
    background: #ccc;
    display: inline-block;
    padding: 6px 12px;
    cursor: pointer;
    font-weight: bold;
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
        <td>
          <label for="file-upload" class="custom-file-upload">Chọn ảnh từ máy tính...</label>
          <input id="file-upload" type="file" name="image" accept="image/*" />
          <input type="submit" value="Tải ảnh lên" />
          
          <%
          if (info.getTempProduct() != null) {
          %>
          <br />
          <br />
            <img src="<%out.print(Values.ROOT_DIR);%>/images/products/<%out.print(info.getTempProduct().getImage());%>" style="width: 100px;" />
          
          <%
          }
          %>
        </td>
      </tr>
      <tr>
        <td><b>Đường dẫn</b></td>
        <td><input readonly="readonly" id="image" type="text" name="image" value="${info.tempProduct.image}" /></td>
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
        <td><b>Mô tả</b></td>
        <td><textarea id="description" name="description" rows="5"></textarea></td>
      </tr>
      <tr>
        <td><b>Đơn giá (VNĐ)</b></td>
        <td><input id="price" class="price" type="text" name="price" /></td>
      </tr>
      <tr>
        <td colspan="2">
        <input type="submit" id="btnAddProduct" value="Thêm vào CSDL" /></td>
      </tr>
    </table>
  </form>
  <script>
			$(document).ready(function() {
						var image = $("#image").val();
						if (image == "" || image == null) {
							notifyError($("#image"), "Chưa có hình!");
							$("#name").attr("disabled", "disabled");
							$("#description").attr("disabled", "disabled");
							$("#price").attr("disabled", "disabled");
							$("#btnAddProduct").attr("disabled", "disabled");
						}
						
						$("#price").verifyInputRealtime();
						
						$("#formAddProduct").submit(function(e) {
							var isValidName = $("#name").validateInput(MIN_LEN, ONLY_NUMBERS_ALPHABETS);
							var isValidMoney = $("#price").validateInput(6, ONLY_NUMBERS);
							
							if (!isValidName || !isValidMoney) {
								e.preventDefault();
							}
					  });
					});
		</script>
</body>
</html>