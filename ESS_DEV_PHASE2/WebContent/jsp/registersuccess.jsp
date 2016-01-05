<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<head><link rel="stylesheet" type="text/css" media="all" href="csstiles/style.css" /></head>

<div id="header" >
    <tiles:insertAttribute name="header" />
</div>
    <div id="sidebar" style="margin-top:0.5%;margin-left:-1%">
        <tiles:insertAttribute name="menu" />
    </div>
<div style="height:700px;width:auto:bg-color:#40e0d0;margin-top:10%">
<h2> Welcome <s:property value="regBean.setFname()" />, you have been successfully Registred in ESS</h2><br/>
</div>
<div id="footer" style="margin-left:-1%">
        <tiles:insertAttribute name="footer" />
    </div>
