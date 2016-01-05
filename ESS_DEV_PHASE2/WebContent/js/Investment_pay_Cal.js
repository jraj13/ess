function lipp() {
		var lipp1 = document.getElementById('lipp1').value;
		if (lipp1 < 1) {
			document.getElementById('lipp1').value = '0';
			document.getElementById('lipp1').focus();
		}
		else
			{
			document.getElementById('ppf1').focus();
			}
		
	}
	function ppf() {
		var ppf1 = document.getElementById('ppf1').value;
		if (ppf1 < 1) {
			document.getElementById('ppf1').value = '0';
			document.getElementById('ppf1').focus();
		}
		else
			{
			document.getElementById('nss1').focus();
			}
		
	}
	function nss() {
		var nss1 = document.getElementById('nss1').value;
		if (nss1 < 1) {
			document.getElementById('nss1').value = '0';
			document.getElementById('nss1').focus();
		}
		else
			{
			document.getElementById('nsc1').focus();
			}
	}
	function nsc() {
		var nsc1 = document.getElementById('nsc1').value;
		if (nsc1 < 1) {
			document.getElementById('nsc1').value = '0';
			document.getElementById('nsc1').focus();
		}
		else
			{
			document.getElementById('cgb1').focus();
			}
		
	}
	function cgb() {
		var cgb1 = document.getElementById('cgb1').value;
		if (cgb1 < 1) {
			document.getElementById('cgb1').value = '0';
			document.getElementById('cgb1').focus();
		}
		else
			{
			document.getElementById('lap1').focus();
			}
	}
	function lap() {
		var lap1 = document.getElementById('lap1').value;
		if (lap1 < 1) {
			document.getElementById('lap1').value = '0';
			document.getElementById('lap1').focus();
		}
		else
			{
			document.getElementById('elss1').focus();
			}
	}
	function elss() {
		var elss1 = document.getElementById('elss1').value;
		if (elss1 < 1) {
			document.getElementById('elss1').value = '0';
		}
		else
			{
			document.getElementById('npf1').focus();
			}
	}
	function npf() {
		var npf1 = document.getElementById('npf1').value;
		if (npf1 < 1) {
			document.getElementById('npf1').value = '0';
			document.getElementById('npf1').focus();
		}
		else
			{
			document.getElementById('npf1').focus();
			}
	}
	function db() {
		var db1 = document.getElementById('db1').value;
		if (db1 < 1) {
			document.getElementById('npf1').value = '0';
		}
		else
			{
			document.getElementById('hlr1').focus();
			}
	}

	function hlr() {
		var hlr1 = document.getElementById('hlr1').value;
		if (hlr1 < 1) {
			document.getElementById('hlr1').value = '0';
			document.getElementById('hlr1').focus();
			
		}
		else
			{
			document.getElementById('ies1').focus();
			}
	}
	function ies() {
		var ies1 = document.getElementById('ies1').value;
		if (ies1 < 1) {
			document.getElementById('ies1').value = '0';
			document.getElementById('ies1').focus();
		}
		else{
			document.getElementById('imf1').focus();
		}
	}
	function imf() {
		var imf1 = document.getElementById('imf1').value;
		if (imf1 < 1) {
			document.getElementById('imf1').value = '0';
			document.getElementById('imf1').focus();
		}
		else
			{
			document.getElementById('tfc1').focus();
			}
	}
	function tf1() {
		var tfc1 = document.getElementById('tfc1').value;
		if (tfc1 < 1) {
			document.getElementById('tfc1').value = '0';
			document.getElementById('tfc1').focus();
		}
	}

	function jeevan() {
		var jsp1 = document.getElementById('jsp1').value;
		var jsp2 = document.getElementById('jsp2');
		var jsp22 = (jsp1 - 1000);
		jsp2.value = jsp22;
		if (jsp1 < 1000) {
			alert("Entered value should not less than 1000");
			jsp2.value = '0';
			document.getElementById('jsp1').value = '0';
			document.getElementById('jsp1').focus();
		} else if (jsp1 > 10000) {
			alert("You must submit LIC JEEVAN SURAKSHA-PENSION FUND Documents");
			document.getElementById('mpn1').focus();
		}
	}
	function mpn() {
		var mpn1 = document.getElementById('mpn1').value;
		var mpn2 = document.getElementById('mpn2');
		var mpn22 = (mpn1 - 1000);
		mpn2.value = mpn22;
		if (mpn1 < 1000) {
			alert("Entered value should not less than 1000");
			mpn2.value = '0';
			document.getElementById('mpn1').value = '0';
			document.getElementById('mpn1').focus();
		} else if (mpn1 > 15000) {
			alert("You must submit MEDICLAIM-PARENT(NON SENIOR CITIZEN) Documents");
			document.getElementById('mps1').focus();
		}
	}
	function mps() {
		var mps1 = document.getElementById('mps1').value;
		var mps2 = document.getElementById('mps2');
		var mps22 = (mps1 - 1000);
		mps2.value = mps22;
		if (mps1 < 1000) {
			alert("Entered value should not less than 1000");
			mps2.value = '0';
			document.getElementById('mps1').value = '0';
			document.getElementById('mps1').focus();
		} else if (mps1 > 20000) {
			alert("You must  submit MEDICLAIM-PARENT(SENIOR CITIZEN) Documents");
			document.getElementById('ms1').focus();
		}
	}
	function ms() {
		var ms1 = document.getElementById('ms1').value;
		var ms2 = document.getElementById('ms2');
		var ms22 = (ms1 - 1000);
		ms2.value = ms22;
		if (ms1 < 1000) {
			alert("Entered value should not less than 1000");
			ms2.value = '0';
			document.getElementById('ms1').value = '0';
			document.getElementById('ms1').focus();
		} else if (ms1 > 15000) {
			alert("You must submit MEDICLAIM-SELF/SPOUSE/CHILDREN Documents");
			document.getElementById('mth1').focus();
		}
	}
	function mth() {
		var mth1 = document.getElementById('mth1').value;
		var mth2 = document.getElementById('mth2');
		var mth22 = (mth1 - 1000);
		mth2.value = mth22;
		if (mth1 < 1000) {
			alert("Entered value should not less than 1000");
			mth2.value = '0';
			document.getElementById('mth1').value = '0';
			document.getElementById('mth1').focus();
		} else if (mth1 > 75000) {
			alert("You must submit MEDCL TRMNT-HANDICAPPED DEPENDENT Documents");
			document.getElementById('mts1').focus();
		}
	}
	function mts() {
		var mts1 = document.getElementById('mts1').value;
		var mts2 = document.getElementById('mts2');
		var mts22 = (mts1 - 1000);
		mts2.value = mts22;
		if (mts1 <= 1000) {
			alert("Entered value should not less than 1000");
			mts2.value = '0';
			document.getElementById('mts1').value = '0';
			document.getElementById('mts1').focus();
		} else if (mts1 > 40000) {
			alert("You must  submit MEDCL TRMNT-SPECF DISEASE-SELF/DEPENDENT Documents");
			document.getElementById('mtsc1').focus();
		}
	}
	function mtsc() {
		var mtsc1 = document.getElementById('mtsc1').value;
		var mtsc2 = document.getElementById('mtsc2');
		var mtsc22 = (mtsc1 - 1000);
		mtsc2.value = mtsc22;
		if (mtsc1 < 1000) {
			alert("Entered value should not less than 1000");
			mtsc2.value = '0';
			document.getElementById('mtsc1').value = '0';
			document.getElementById('mtsc1').focus();
		} else if (mtsc1 > 60000) {
			alert("You must  MEDCL TRMNT-SPECF DISEASE-SENIOR CITIZEN Documents");
		}

	}
	function calculate() {
		if (MyForm.certify.checked) {

			//80cc
			var lipp1 = document.getElementById('lipp1').value;
			var ppf1 = document.getElementById('ppf1').value;
			var nss1 = document.getElementById('nss1').value;
			var nsc1 = document.getElementById('nsc1').value;
			var cgb1 = document.getElementById('cgb1').value;
			var lap1 = document.getElementById('lap1').value;
			var elss1 = document.getElementById('elss1').value;
			var npf1 = document.getElementById('npf1').value;
			var db1 = document.getElementById('db1').value;
			var hlr1 = document.getElementById('hlr1').value;
			var ies1 = document.getElementById('ies1').value;
			var imf1 = document.getElementById('imf1').value;
			var tfc1 = document.getElementById('tfc1').value;
			var tu1 = document.getElementById('tu1').value;
			var tot1 = parseFloat(lipp1) + parseFloat(ppf1) + parseFloat(nss1)
					+ parseFloat(nsc1) + parseFloat(cgb1) + parseFloat(lap1)
					+ parseFloat(elss1) + parseFloat(npf1) + parseFloat(db1)
					+ parseFloat(hlr1) + parseFloat(ies1) + parseFloat(imf1)
					+ parseFloat(tfc1);
			//var tot1=+lipp1 + +ppf1;
			/* tu1.value=tot1; */
			document.getElementById('tu1').value = tot1;

			var jsp1 = document.getElementById('jsp1').value;
			var mpn1 = document.getElementById('mpn1').value;
			var mps1 = document.getElementById('mps1').value;
			var ms1 = document.getElementById('ms1').value;
			var mth1 = document.getElementById('mth1').value;
			var mts1 = document.getElementById('mts1').value;
			var mtsc1 = document.getElementById('mtsc1').value;
			var tu1 = document.getElementById('tu11').value;
			var tot2 = parseFloat(jsp1) + parseFloat(mpn1) + parseFloat(mps1)
					+ parseFloat(ms1) + parseFloat(mth1) + parseFloat(mts1)
					+ parseFloat(mtsc1);
			document.getElementById('tu11').value = tot2;
			
			document.getElementById('tu2').value='0';

			var jsp2 = document.getElementById('jsp2').value;
			var mpn2 = document.getElementById('mpn2').value;
			var mps2 = document.getElementById('mps2').value;
			var ms2 = document.getElementById('ms2').value;
			var mth2 = document.getElementById('mth2').value;
			var mts2 = document.getElementById('mts2').value;
			var mtsc2 = document.getElementById('mtsc2').value;
			var tu2 = document.getElementById('tu12').value;
			var total = parseFloat(jsp2) + parseFloat(mpn2) + parseFloat(mps2)
					+ parseFloat(ms2) + parseFloat(mth2) + parseFloat(mts2)
					+ parseFloat(mtsc2);
			document.getElementById('tu12').value = total;
			

		}
		 
	}
	
