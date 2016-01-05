<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html class="cufon-active cufon-ready" dir="ltr" lang="en-US">
<head>

<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<title>HR Solutions</title>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->

<!--HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries --> 
<!--[if lt IE 9]> 
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script> 
<script src="assets/js/respond.min.js"></script>
<![endif]-->
<link href='http://fonts.googleapis.com/css?family=Londrina+Solid|Open+Sans:400,700|Shadows+Into+Light+Two' rel='stylesheet' type='text/css'>
    <!-- Bootstrap core CSS -->




<!------------------boootstrap files integration------------------>
<!-- Latest compiled and minified CSS -->
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    
  <script src="js/respond.js"></script>
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
  
  
  <!-- it works the same with all jquery version from 1.x to 2.x -->
<script src="js/jssor.slider.mini.js"></script>
<script>
    jQuery(document).ready(function ($) {
        var options = { $AutoPlay: true };
        var jssor_slider1 = new $JssorSlider$('slider1_container', options);
    });
</script>
<link rel="stylesheet" href="calender/tcal.css">
 <script type="text/javascript" src="calender/tcal.js"></script>
 
<%--  <link rel="stylesheet" href="calender/bootstrap.min.css">
<link rel="stylesheet" href="calender/date.css">
 <script type="text/javascript" src="js/jquery-1.js"></script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script> --%>
 <%--  <script>
  $(function() {
	 // alert("am in datepicker");
    $( "#datepicker" ).datepicker();
  });
  </script> --%>
<link href="css/style-new.css" rel="stylesheet" type="text/css">



<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  
    <style>
  .ui-datepicker {
    width: 19em;
    padding: .2em .2em 0;
    display: none;
}
  </style>

  
  <script>
  $(function() {
    $( "#datepicker" ).datepicker();
  });
  </script>


<!----------------end bootstrap file integration------------------------>



<!-- ////////////////////////////////// -->
<!-- //      Javascript Files        // -->
<!-- ////////////////////////////////// -->



<!--[if IE]>
<script type="text/JavaScript">
$(document).ready(function() {
 $('.box, .boxcolor').cornerz({
      radius: 5
      })
})
</script>
<![endif]-->

</head>

<body > 

 
<div class="container">

      <div class="row row-offcanvas row-offcanvas-right">
      
 

  <div class="col-9 col-sm-12 col-lg-9">
 <img src="images/logo.png" class="img-responsive" alt="Responsive image"  >

<!----------------------nav block------------->

<!----------------------nav block------------->
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
    <a class="navbar-brand" href="#">Home</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
      
       
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Emplyoyee HanBook <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">Action</a></li>
      
          </ul>
        </li>
        
        
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Forms GuideLines <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">Action</a></li>
      
          </ul>
        </li>
        
           
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Quick Links <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">Action</a></li>
      
          </ul>
        </li>
        
           
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Who's Who <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">Action</a></li>
      
          </ul>
        </li>
        
           
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">President Desk<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">Action</a></li>
      
          </ul>
        </li>
        
            
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Contact Us<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><li><a href="jsp/mailAction.jsp">Mail Push</a></li></li>
      
          </ul>
        </li>
        
      </ul>
    
      
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<!----------------en dnav-block--------------->

<!---------------slider part---------------->
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="images/slide1.jpg" alt="...">
    <div class="carousel-caption">
  
              <p>
                    <strong>Performance Management System</strong> <br/>
                    We at NCSS Believe in Performance driven culture, where the employee Career Progression, Compensation & Rewards System is directly agigned to the Organization's and Employee performance.
                    </p>
          
            </div>
      
    </div>
    
    
 <div class="item">
      <img src="images/personal.jpg" alt="personal">
       
       <div class="carousel-caption">
             <p>
                    <strong>Personal Services</strong> <br/>
NCSS personanel Management provides streamlined, comprehensive and fully integrated personnel data structure. Its user-friendly, intuitive online navigation coupled with its process-oriented data entry which provides speedy and effecient data maintenance.  </p>
          
            </div>
       
    </div>


    
    <div class="item">
      <img src="images/slide2.jpg" alt="...">
    <div class="carousel-caption">
               <p><strong>Payroll Services </strong><br/>
               We at NCSS have automated payroll system in SAP for emloyee salary, statutory related payments etc. It also helps employee on line to know thier compensation details, CTC Statements, Salary Slips, Income Tax projections, tax liabilities etc.
               </p>
          
            </div>
    </div>
    
    
    
    

 <div class="item">
      <img src="images/self-service.jpg" alt="Self services">
       
       <div class="carousel-caption">
             <p>
                    <strong>Employee Self Service</strong> <br/>
                    NCSS Employee Self Service empowers employees to view and modify their own personal information.
Attendance, Leave application, IT projections, Compensation related details, statutory benefits and claim reimbursements.
                    </p>
          
            </div>
       
    </div>




     <div class="item">
      <img src="images/slide3.jpg" alt="...">
       
       <div class="carousel-caption">
               <p><strong>Travel Management</strong><br/>We have the entire travel Management process covering travel creation, approval, Ticket Booking, expenses setlement to enable the employee to conduct companies business commensure with the image of the organization effectively & efficiently.</p>
          
            </div>
       
    </div>





     <div class="item">
      <img src="images/recruitemnt.JPG" alt="Recritment">
       
       <div class="carousel-caption">
               <p><strong>Recruitment Services</strong><br/>An end to end integrated Recruitment system to achieve efficiencies. It will enable the HR professionls in acquiring right kind of talent for the organization to deliver business goals and to ensure timely & quality recruitment in a cost effective manner.</p>
          
            </div>
       
    </div>








 <div class="item">
      <img src="images/slide4-time.jpg" alt="time managment">
       
       <div class="carousel-caption">
             <p>
                    <strong>Time management System</strong> <br/>
Time Management offers a wide ranage of option for the palnning, organizing, scheduling adminstrating, tracking, recording, monitoring and evalution of employee time date so time management can be effeciently utilized for Business requiremt.                    </p>
          
            </div>
       
    </div>
    
    
    


   







  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
 </div>
<!-----------------end slider part------------------>




<!--------------3 section layout-------------->

            <div class=" col-md-6 col-sm-6 col-lg-4"  style="" >
     
     <div class="panel panel-primary" style="margin-bottom:0px">
            <div class="panel-heading">
              <h3 class="panel-title">Birthdays</h3>
            </div>
            <div class="panel-body" style="background-image:url('images/birth3.jpg');color:#66CDAA;font-size: 20px;height:216px; ">
             
             <marquee  behavior="scroll" direction="up" onmouseover="this.stop()" onmouseout="this.start()" ><ul>
            <li><b><i>RAMANJI</i></b></li>
             <li><b><i>YOGESH</i></b></li>
              <li><b><i>AMARANATH</i></b></li>
               <li><b><i>ASWATHY</i></b></li>
                <li><b><i>MOHAN</i></b></li>
                <li><b><i>JAYARAJ</i></b></li>
                <li><b><i>BALAJI</i></b></li>
            </ul></marquee>
             
              
            </div>
          </div>
            </div>
            
             <div class=" col-sm-6 col-lg-4 col-md-6"  style=""  >
      <div class="panel panel-primary" style="margin-bottom:0px;">
            <div class="panel-heading">
              <h3 class="panel-title">Corporate Aniversay</h3>
            </div>
            <div class="panel-body" style="background-image:url('images/av1.jpg');color: #66CDAA;font-size: 20px;height:216px;">
            <marquee  behavior="scroll" direction="up" scrollamount="3" onmouseover="this.stop()" onmouseout="this.start()">
             <span class="carousel slide"><b><i>MOHAN </i></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2Years</span></br>
              <span class="carousel slide"><b><i>BALAJI</i></b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2Years</span></br>
               <span class="carousel slide"><b><i>SANDESH</i></b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2Years</span></br>
               <span class="carousel slide"><b><i>ASAWATHY</i></b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2Years</span></br>
               <span class="carousel slide"><b><i>SYED</i></b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2Years</span></br>
               
               
             </marquee>
            </div>
          </div>
            </div>
            
             <div class="col-md-6 col-sm-6 col-lg-4"  style="" >
      <div class="panel panel-primary" style="margin-bottom:0px;">
            <div class="panel-heading"  >
              <h3 class="panel-title">What's New</h3>
            </div>
           <div class="panel-body" style="background-image:url('images/box-3.jpg');width:285px;height: 216px">
             <!-- <img src="images/box-3.jpg" class="img-responsive" alt="box-3"> -->
            </div> 
          </div>
            
            </div>
            
            
            
           
            

            
<!--------------end 3 section layout------------------>
							
    </div>
    

  <div class="col-3 col-sm-12 col-lg-3 sidebar-offcanvas">  

  <img src="images/right-1.JPG" class="img-responsive" alt="Responsive image">
  
  <p>&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;</p>           
  <s:actionerror />
  <form class="form-horizontal" name="loginForm" method="post" action="login">
  <div class="form-group" class="col-2" >
    <label for="loginBean.userId" class="col-sm-5 control-label">User Name</label>
    <div class="col-sm-6">
      <input type="email" class="form-control" name="loginBean.userId" id="inputEmail3" placeholder="UserName">
    </div>
  </div>
  <div class="form-group">
    <label for="loginBean.password" class="col-sm-5 control-label">Password</label>
    <div class="col-sm-6">
      <input type="password" class="form-control" name="loginBean.password" id="inputPassword3" placeholder="Password">
    </div>
  </div>
  
  <div class="form-group" class="col-2">
    <div class="col-sm-offset-2 col-sm-10">
<button type="submit" name="login" class="btn btn-primary">Login</button>
<br/><br/>

<a href="" style="color:#fff"> Forget Password?</a>

    </div>
  </div>
</form>        

<!-- <form class="form-horizontal">
  <div class="form-group"  class="col-2">
    <label for="inputEmail3" class="col-sm-5 control-label">User Name</label>
    <div class="col-sm-6">
      <input type="email" class="form-control" id="inputEmail3" placeholder="Email">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-5 control-label">Password &nbsp;</label>
    <div class="col-sm-6">
      <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
    </div>
  </div>
  
  <div class="form-group"  class="col-2">
    <div class="col-sm-offset-2 col-sm-10">
<button type="button" class="btn btn-primary">Login</button>
<br/><br/>

<a href="" style="color:#fff"> Forget Password?</a>
    </div>
  </div>
</form> -->
<!-- <div id="datepicker"></div> -->
<!-- <br> -->
<!-- <div > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="date" class="tcal" value="" />  </div>
</div> -->

 <div class="form-group" class="col-2"> 
    <!-- <div class="col-sm-offset-2 col-sm-10">  -->
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
<div id="datepicker"></div>
<!-- </div> -->
</div>


</div>

       <!------------------calender data static-------------> 		

</div> 
  <footer>
    <hr style="margin-bottom:5px;margin-top:10px;">
    <center>
   
        &copy;2015  Nali clock software solution | For best View IE9+ Onwards
        
  </center>
  
    </footer>


</div>
 





</body></html>