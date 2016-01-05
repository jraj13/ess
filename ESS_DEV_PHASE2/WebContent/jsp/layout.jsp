<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>

<head><link rel="stylesheet" type="text/css" media="all" href="csstiles/style.css" /></head>
<body id="home">

 <div id="header">
    <tiles:insertAttribute name="header" />
</div>
<div id="wrap">
<div id="sidebar">
        <tiles:insertAttribute name="menu" />
    </div>
    <div id="content">
        <tiles:insertAttribute name="body" />
    </div>
    
    <div id="footer">
        <tiles:insertAttribute name="footer" />
    </div> 
</div>
 
       
        
</body> 
</html>
