/**
 * 
 */
function isLoanAmt(evt) {
	var charCode = (evt.charCode) ? evt.which : event.keyCode

	if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46)
		return false;
	else {
		var input = document.getElementById("loan_amount_bnl2").value;
		var len = document.getElementById("loan_amount_bnl2").value.length;
		var index = document.getElementById("loan_amount_bnl2").value
				.indexOf('.');

		if (index > 0 && charCode == 46) {
			return false;
		}
		if (index > 0 || index == 0) {
			var CharAfterdot = (len + 1) - index;
			if (CharAfterdot > 3) {

				return false;
			}
		}
		if (charCode == 46 && input.split('.').length > 2) {
			return false;
		}

	}
	return true;
}

function isBalAmt(evt) {
	var charCode = (evt.charCode) ? evt.which : event.keyCode

	if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46)
		return false;
	else {
		var input = document.getElementById("balance_amount_bnl2").value;
		var len = document.getElementById("balance_amount_bnl2").value.length;
		var index = document.getElementById("balance_amount_bnl2").value
				.indexOf('.');

		if (index > 0 && charCode == 46) {
			return false;
		}
		if (index > 0 || index == 0) {
			var CharAfterdot = (len + 1) - index;
			if (CharAfterdot > 3) {

				return false;
			}
		}
		if (charCode == 46 && input.split('.').length > 2) {
			return false;
		}

	}
	return true;
}

function isRepayAmt(evt) {
	var charCode = (evt.charCode) ? evt.which : event.keyCode

	if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46)
		return false;
	else {
		var input = document.getElementById("repay_amount_bnl2").value;
		var len = document.getElementById("repay_amount_bnl2").value.length;
		var index = document.getElementById("repay_amount_bnl2").value
				.indexOf('.');

		if (index > 0 && charCode == 46) {
			return false;
		}
		if (index > 0 || index == 0) {
			var CharAfterdot = (len + 1) - index;
			if (CharAfterdot > 3) {

				return false;
			}
		}
		if (charCode == 46 && input.split('.').length > 2) {
			return false;
		}

	}
	return true;
}