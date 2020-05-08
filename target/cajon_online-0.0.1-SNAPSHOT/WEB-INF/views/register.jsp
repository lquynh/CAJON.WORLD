<%@include file="header.jsp"%>
<%@page import="com.cajon.utils.Values"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
<title>Cajon Online :: Create new account</title>
<style>
table {
  width: 100%;
}
</style>
</head>
<body>
  <div class="absoluteCenter">
    <form id="formReigsterAccount" action="registerAccount" method="post" accept-charset="ISO-8859-1">
      <table border="1">
        <tr>
          <th colspan="2">Nhập thông tin tài khoản</th>
        </tr>
        <tr>
          <td><b>Tên đăng nhập (*)</b></td>
          <td><input type="text" id="username" name="username" /></td>
        </tr>
        <tr>
          <td><b>Mật khẩu (*)</b></td>
          <td><input type="password" id="password" name="password" /></td>
        </tr>
        <tr>
          <td><b>Họ tên (*)</b></td>
          <td><input type="text" id="name" name="name" /></td>
        </tr>
        <tr>
          <td><b>Địa chỉ (*)</b></td>
          <td><input type="text" id="address" name="address" /></td>
        </tr>
        <tr>
          <td><b>Số điện thoại (*)</b></td>
          <td><input type="text" id="phone" name="phone" /></td>
        </tr>
        <tr>
          <td colspan="2"><input type="submit" value="Tạo tài khoản" /></td>
        </tr>
      </table>
      <div style='text-align: center;'>
        <span class="error" id="error-message">${message}</span><br />
      </div>
    </form>
    <a href="home">Về trang chủ</a>
  </div>
  <script>
			$(document).ready(function() {
				verifyInputs();
				$("#formReigsterAccount").submit(function(event) {
					var username = $("#username").val();
					var password = $("#password").val();
					var name = $("#name").val();
					var address = $("#address").val();
					var phone = $("#phone").val();
					
					if (!checkInput(LABEL_USERNAME, username, MIN_LEN, ONLY_NUMBERS_ALPHABETS)) {
						event.preventDefault();
					}
					if (!checkInput(LABEL_PASSWORD, password, MIN_LEN, ONLY_NUMBERS_ALPHABETS)) {
						event.preventDefault();
					}
					if (!checkInput(LABEL_NAME, name, MIN_LEN, ONLY_ALPHABETS)) {
						event.preventDefault();
					}
					if (!checkInput(LABEL_ADDRESS, address, MIN_LEN, ONLY_NUMBERS_ALPHABETS_COMMA)) {
						event.preventDefault();
					}
					if (!checkInput(LABEL_PHONE, phone, MAX_LEN_PHONE, ONLY_NUMBERS)) {
						event.preventDefault();
					}
					
				});
			});
		</script>
</body>
</html>