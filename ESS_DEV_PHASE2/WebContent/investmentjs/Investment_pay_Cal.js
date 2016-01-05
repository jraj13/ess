function lipp() {
		var lipp1 = document.getElementById('lipp1').value;
		if (lipp1 < 1) {
			document.getElementById('lipp1').value = '0';
			document.getElementById('lipp2').value = '0';
			document.getElementById('lipp1').focus();
	
		}
		else if(lipp1 > 1)
			{
			document.getElementById('lipp2').value=lipp1;
			document.getElementById('ppf1').focus();
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
			document.getElementById('ppf2').value = '0';
			document.getElementById('ppf1').focus();
			
		}
		else if(ppf1 >= 1 && ppf1 <= 150000)
			{
			document.getElementById('ppf2').value =ppf1;
			document.getElementById('nss1').focus();
			}
		else if(ppf1>150000){
			
			alert("Please Enter with in MAX value");
			document.getElementById('ppf1').value = '0';
			document.getElementById('ppf2').value = '0';
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
			document.getElementById('nss2').value = '0';
			document.getElementById('nss1').focus();
		}
		else if(nss1 >1)
			{
			document.getElementById('nss2').value=nss1;
			document.getElementById('nsc1').focus();
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
			document.getElementById('nsc2').value = '0';
			document.getElementById('nsc1').focus();
		}
		else if(nsc1 > 1)
			{
			document.getElementById('nsc2').value = nsc1;
			document.getElementById('cgb1').focus();
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
			document.getElementById('cgb2').value = '0';
			document.getElementById('cgb1').focus();
		}
		else if(cgb1 > 1 && cgb1<=20000)
			{
			document.getElementById('cgb2').value =cgb1;
			document.getElementById('lap1').focus();
			}
		else if(cgb1>20000){
			alert("Please Enter With in MAX value");
			document.getElementById('cgb1').value = '0';
			document.getElementById('cgb2').value = '0';
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
			document.getElementById('lap2').value = '0';
			document.getElementById('lap1').focus();
		}
		else if(lap1 > 1)
			{
			document.getElementById('lap2').value = lap1;
			document.getElementById('elss1').focus();
			
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
			document.getElementById('elss2').value = '0';
			document.getElementById('elss1').focus();
		}
		else if(elss1 > 1){
			
			document.getElementById('elss2').value = elss1;
			document.getElementById('npf1').focus();
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
			document.getElementById('npf2').value = '0';
			document.getElementById('npf1').focus();
		}
		else if(npf1 > 1)
			{
			document.getElementById('npf2').value = npf1;
			document.getElementById('db1').focus();
			}
		else
			{
			document.getElementById('npf1').focus();
			}
	}
	function db() {
		var db1 = document.getElementById('db1').value;
		if (db1 < 1) {
			document.getElementById('db1').value = '0';
			document.getElementById('db2').value = '0';
			document.getElementById('db1').focus();
		}
		else if(db1>1){
			
			document.getElementById('db2').value = db1;
			document.getElementById('hlr1').focus();
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
			document.getElementById('hlr2').value = '0';
			document.getElementById('hlr1').focus();
			
		}
		else if(hlr1 > 1){
			document.getElementById('hlr2').value = hlr1;
			document.getElementById('ies1').focus();
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
			document.getElementById('ies2').value = '0';
			document.getElementById('ies1').focus();
		}
		else if(ies1 > 1){
			document.getElementById('ies2').value = ies1;
			document.getElementById('imf1').focus();
		}
		else{
			document.getElementById('imf1').focus();
		}
	}
	function imf() {
		var imf1 = document.getElementById('imf1').value;
		if (imf1 < 1) {
			document.getElementById('imf1').value = '0';
			document.getElementById('imf2').value = '0';
			document.getElementById('imf1').focus();
		}
		else if(imf1 > 1){
			document.getElementById('imf2').value =imf1;
			document.getElementById('tfc1').focus();
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
			document.getElementById('tfc2').value = '0';
			document.getElementById('tfc1').focus();
		}
		else if(tfc1 > 1){
			document.getElementById('tfc2').value = tfc1;
			document.getElementById('jsp1').focus();
		}
		else
			{
			document.getElementById('jsp1').focus();
			
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
			
			
			//new calculation
			
				var tu2=document.getElementById('tu2').value='0';
			
			var lipp2 = document.getElementById('lipp2').value;
			var ppf2 = document.getElementById('ppf2').value;
			var nss2 = document.getElementById('nss2').value;
			var nsc2 = document.getElementById('nsc2').value;
			var cgb2 = document.getElementById('cgb2').value;
			var lap2 = document.getElementById('lap2').value;
			var elss2 = document.getElementById('elss2').value;
			var npf2 = document.getElementById('npf2').value;
			var db2 = document.getElementById('db2').value;
			var hlr2 = document.getElementById('hlr2').value;
			var ies2 = document.getElementById('ies2').value;
			var imf2 = document.getElementById('imf2').value;
			var tfc2 = document.getElementById('tfc2').value;
		
			
			
			
			var tot9 = parseFloat(lipp2) + parseFloat(ppf2) + parseFloat(nss2)
			+ parseFloat(nsc2) + parseFloat(cgb2) + parseFloat(lap2)
			+ parseFloat(elss2) + parseFloat(npf2) + parseFloat(db2)
			+ parseFloat(hlr2) + parseFloat(ies2) + parseFloat(imf2)
			+ parseFloat(tfc2);
			
			document.getElementById('tu2').value=tot9;
			
			

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
	
