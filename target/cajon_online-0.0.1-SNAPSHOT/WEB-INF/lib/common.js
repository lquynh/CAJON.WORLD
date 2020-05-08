var ONLY_NUMBERS = 1;
var ONLY_ALPHABETS = 2;
var ONLY_NUMBERS_ALPHABETS = 3;
var ONLY_NUMBERS_ALPHABETS_COMMA = 4;
var LABEL_USERNAME = "Tên đăng nhập";
var LABEL_PASSWORD = "Mật khẩu";
var LABEL_NAME = "Họ tên";
var LABEL_ADDRESS = "Địa chỉ";
var LABEL_PHONE = "Số điện thoại";
var MIN_LEN = 10;
var MAX_LEN_ADDRESS = 150;
var MAX_LEN_PHONE = 10;
var MAX_LEN_PRICE = 10;
var MAX_LEN_NAME = 50;

function formatMoney(num) {
	return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');
}

function thongbaoloi(msg) {
	$("#error-message").text(msg);
}

function xoathongbaoloi() {
	$("#error-message").text("");
}

function notContainsNumbersOnly(p) {
	// return any characters which is not these characters below
	var result = /[^0-9]/g.test(p);
	return result;
}

function notContainsAlphabetsOnly(p) {
	// return any characters which is not these characters below
	var result = /[^a-zA-ZáàạãảâấầậẫẩăắằặẳẵđéèẹẽẻêếềệểễóòọõỏôốồộổỗơớờợỡởúùụũủưứừựữửíìịĩỉýỳỵỹỷAÁÀẠÃẢÂẤẦẬẪẨĂẮẰẶẴẲĐÉÈẸẼẺÊẾỀỆỄỂÓÒỌÕỎÔỐỒỘỖỔƠỚỜỢỠỞÚÙỤŨỦƯỨỪỰỮỬÍÌỊĨỈÝỲỴỸỶ ]/g
			.test(p);
	return result;
}

function notContainsNumbersAlphabetsCommaOnly(p) {
	// return any characters which is not these characters below
	var result = /[^a-zA-Z0-9áàạãảâấầậẫẩăắằặẳẵđéèẹẽẻêếềệểễóòọõỏôốồộổỗơớờợỡởúùụũủưứừựữửíìịĩỉýỳỵỹỷAÁÀẠÃẢÂẤẦẬẪẨĂẮẰẶẴẲĐÉÈẸẼẺÊẾỀỆỄỂÓÒỌÕỎÔỐỒỘỖỔƠỚỜỢỠỞÚÙỤŨỦƯỨỪỰỮỬÍÌỊĨỈÝỲỴỸỶ,.\/ ]/g
			.test(p);
	return result;
}

function containsInvalidCharacters(p) {
	// return any characters which is not these characters below
	var result = /[^A-Za-z0-9áàạãảâấầậẫẩăắằặẳẵđéèẹẽẻêếềệểễóòọõỏôốồộổỗơớờợỡởúùụũủưứừựữửíìịĩỉýỳỵỹỷAÁÀẠÃẢÂẤẦẬẪẨĂẮẰẶẴẲĐÉÈẸẼẺÊẾỀỆỄỂÓÒỌÕỎÔỐỒỘỖỔƠỚỜỢỠỞÚÙỤŨỦƯỨỪỰỮỬÍÌỊĨỈÝỲỴỸỶ ]/g
			.test(p);
	return result;
}

function checkInput(label, input, length, criteria) {
	if (input == "" || input.length < length) {
		thongbaoloi(label + " phải có ít nhất " + length + " ký tự!");
		return false;
	}
	if (criteria == ONLY_NUMBERS) {
		if (notContainsNumbersOnly(input)) {
			thongbaoloi(label + " chỉ được nhập số!");
			return false;
		}
	}
	if (criteria == ONLY_ALPHABETS) {
		if (notContainsAlphabetsOnly(input)) {
			thongbaoloi(label + " chỉ được nhập chữ!");
			return false;
		}
	}
	if (criteria == ONLY_NUMBERS_ALPHABETS) {
		if (containsInvalidCharacters(input)) {
			thongbaoloi(label + " chỉ được nhập chữ hoặc số!");
			return false;
		}
	}
	if (criteria == ONLY_NUMBERS_ALPHABETS_COMMA) {
		if (notContainsNumbersAlphabetsCommaOnly(input)) {
			thongbaoloi(label + " chỉ được nhập chữ hoặc số!");
			return false;
		}
	}
	return true;
}

function verifyInputs() {
	$("input[type='text']").keypress(function(e) {
		var key = String.fromCharCode(e.which);
		console.log("key=" + key);
		var id = $(this).attr("id");
		var len = $(this).val().length;

		if (len == 0) {
			if (key == 32) {
				e.preventDefault();
			}
		}
		if (id.includes("phone")) {
			if (len == 0) {
				if (key != '0') {
					thongbaoloi("Số điện thoại phải bắt đầu bằng số 0!");
					e.preventDefault();
				}
			}
			if (len >= MAX_LEN_PHONE) {
				e.preventDefault();
			}
			if (notContainsNumbersOnly(key)) {
				thongbaoloi("Chỉ được nhập số!");
				e.preventDefault();
			}
		}
		if (id.includes("price")) {
			if (len == 0) {
				if (key == '0') {
					thongbaoloi("Giá tiền không được bắt đầu bằng số 0!");
					e.preventDefault();
				}
			}
			if (len >= MAX_LEN_PRICE) {
				e.preventDefault();
			}
			if (notContainsNumbersOnly(key)) {
				thongbaoloi("Chỉ được nhập số!");
				e.preventDefault();
			}
		}
	});
}