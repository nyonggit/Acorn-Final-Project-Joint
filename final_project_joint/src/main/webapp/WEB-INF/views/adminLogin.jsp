<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>BLOCKS - Bootstrap Dashboard Theme</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Carlos Alvarez - Alvarez.is">

<!-- Le styles -->
<link rel="stylesheet" type="text/css"
	href="resources/admin/bootstrap/css/bootstrap.min.css" />

<link href="resources/admin/css/login.css" rel="stylesheet">

<script type="text/javascript" src="resources/admin/js/jquery.js"></script>
<script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
<script type="text/javascript" src="resources/admin/bootstrap/js/bootstrap.min.js"></script>

<style type="text/css">
body {
	padding-top: 30px;
	background-image: url('resources/admin/images/bg.jpg');
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-position: center; 
}

pbfooter {
	position: relative;
}

.pbfooter {
	position: relative;
}	
</style>
<!-- Google Fonts call. Font Used Open Sans & Raleway -->
<link href="http://fonts.googleapis.com/css?family=Raleway:400,300" rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" type="text/css">
<!-- Jquery Validate Script -->
<script type="text/javascript" src="resources/admin/js/jquery.validate.js"></script>

<script type="text/javascript">
$.validator.setDefaults({
	submitHandler : function() {
		window.open('dashboard.html', '_self', false)
	}
});

$().ready(function() {
	// validate the comment form when it is submitted
	$("#commentForm").validate();

	// validate signup form on keyup and submit
	/* $("#signupForm")
	.validate({
		rules : {
			firstname : "required",
			lastname : "required",
			username : {
				required : true,
				minlength : 1
			},
			password : {
				required : true,
				minlength : 1
			},
			confirm_password : {
				required : true,
				minlength : 2,
				equalTo : "#password"
			},
			email : {
				required : true,
				email : true
			},
			topic : {
				required : "#newsletter:checked",
				minlength : 2
			},
			agree : "required"
			},
			messages : {
				firstname : "Please enter your firstname",
				lastname : "Please enter your lastname",
				username : {
					required : "Please enter a username",
					minlength : "Your username must consist of at least 1 character"
				},
				password : {
					required : "Please provide a password",
					minlength : "Your password must be at least 1 character long"
				},
				confirm_password : {
					required : "Please provide a password",
					minlength : "Your password must be at least 5 characters long",
					equalTo : "Please enter the same password as above"
				},
				email : "Please enter a valid email address",
				agree : "Please accept our policy"
				}
	}); */

	// propose username by combining first- and lastname
	$("#username").focus(function() {
		var firstname = $("#firstname").val();
		var lastname = $("#lastname").val();
		if (firstname && lastname && !this.value) {
			this.value = firstname + "." + lastname;
		}
	});

	//code to hide topic selection, disable for demo
	var newsletter = $("#newsletter");
	// newsletter topics are optional, hide at first
	var inital = newsletter.is(":checked");
	var topics = $("#newsletter_topics")[inital ? "removeClass" : "addClass"]("gray");
	var topicInputs = topics.find("input").attr("disabled",	!inital);
	// show when newsletter is checked
	newsletter.click(function() {
		topics[this.checked ? "removeClass" : "addClass"] ("gray");
	topicInputs.attr("disabled", !this.checked);
	});
	
});

function Adminsubmit(){
    $.ajax({
         type:"post",
         url:"AdminLogin",
         data:$("#signupForm").serialize(),
         dataType:"text",
         success:function(adminlogin){
             if(adminlogin =="fail"){
            	 alert("로그인 실패")
              /*  jQuery("#loginresult").html(
            		   '<div class="modal fade" id="mailcheck" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">' +
            			'<div class="modal-dialog">' +
            				'<div class="modal-content">' +
            					'<div class="modal-header">' +
            						'<button type="button" class="close" data-dismiss="modal">' +
            							'<span aria-hidden="true">×</span><span class="sr-only">Close</span>' +
            						'</button>' +
            						'<h4 class="modal-title" id="myModalLabel">아이디 또는 비밀번호가 틀렸습니다.</h4>'+
            					'</div>' +
            					'<div class="modal-footer">' +
            						'<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>' +
            					'</div>' +
            				'</div>' +
            			'</div>' +
            		'</div>'
               ); */
            }
            else if(adminlogin == "success"){
               window.location.href = "MainAdmin"
            }
         }
    });
}

function adminLogout(){
	window.location.href = "adminLogout"
}

</script>
</head>
<!--style="background-image:url('resources/admin/images/bg.jpg') no-repeat center center; height: 700px;"  -->
<body >

	<!-- NAVIGATION MENU -->
	<div class="navbar-nav navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp">
					<img src="resources/images/boomerang-logo-white.png" style="width: 60px; height: 15px;" alt=""> RE:MIND
				</a>
			</div>
			<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
			<%if (session.getAttribute("adno") == null){ %>
				<li><a href="index.jsp"><i class="icon-user icon-white"></i>User</a></li>
			<%}else{%>
				<li class="active"><a href="MainAdmin"><i class="icon-home icon-white"></i> Home</a></li>                            
				<li><a href="showAdminTable"><i class="icon-th icon-white"></i> Tables</a></li>
				<li><a href="adminLogout"><i class="icon-lock icon-white"></i> Logout</a></li>
				<li><a href="index.jsp"><i class="icon-user icon-white"></i> User</a></li>
			<%} %>
			</ul>
			</div><!--/.nav-collapse -->
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-lg-offset-4 col-lg-4" style="margin-top: 100px">
				<div class="block-unit"
					style="text-align: center; padding: 8px 8px 8px 8px;">
					<img src="resources/images/team/simjy.jpg" style="widows: 100px; height: 100px" alt="" class="img-circle"><br><br>
					<%if (session.getAttribute("adno") == null){ %>
					<form class="cmxform" id="signupForm">
						<fieldset>
							<p>
								<input id="ad_name" name="ad_name" type="text" placeholder="Adminname"> 
								<input id="ad_password" name="ad_password" type="password" placeholder="Password">
							</p>
							<input class="submit btn-success btn btn-large" onclick="Adminsubmit()" value="Login">
						</fieldset>
					</form>
					<%}else{%>
						<fieldset>
							
							<input class="submit btn-success btn btn-large" onclick="adminLogout()" value="Logout">
						</fieldset>
					<%} %>
				</div>
			</div>
		</div>
	</div>


	<!-- Le javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script type="text/javascript" src="resources/admin/js/bootstrap.js"></script>

</body>
</html>