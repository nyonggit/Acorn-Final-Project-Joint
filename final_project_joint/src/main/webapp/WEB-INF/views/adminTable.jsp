<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="cc" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>BLOCKS - Bootstrap Dashboard Theme</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Le styles -->
<link rel="stylesheet" type="text/css" href="resources/admin/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="resources/admin/css/adminTable.css" />

<!-- DATA TABLE CSS -->
<link href="resources/admin/css/table.css" rel="stylesheet">

<!-- <script type="text/javascript" src="resources/admin/js/jquery.js"></script> -->
<script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>    
<script type="text/javascript" src="resources/admin/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/admin/js/admin.js"></script>
<!-- <script type="text/javascript" src="resources/admin/js/jqueryadminTable.js"></script> -->

<!-- Google Fonts call. Font Used Open Sans -->
<link href="http://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" type="text/css">
<!-- DataTables Initialization -->
<script type="text/javascript" src="resources/admin/js/datatables/jquery.dataTables.js"></script>


<style type="text/css">
body {
	padding-top: 60px;
}
</style>
<script type="text/javascript" charset="utf-8">
$(document).ready(function () {
	$('#dt1').dataTable();
	
});

//선물 이벤트 관련 이메일 전송
function send(anum, wno) {
	var to = $("#compose-to").val();
	var subject = $("#compose-subject").val();
	var message = $("#compose-message").val();
	
	
	$.ajax({
		type:"post",
		url:"send",
		data: {"receiver":to,"subject":subject,"content":message,"w_lock":anum, "w_no":wno},
		dataType: "json",
		success: function(boardData){
			if(boardData.suc == true){
				$("#mailcheck").modal()
				$("#compose-modal").modal("hide");
			}else{
				$("#mailcheck #modal-title").empty();
				$("#mailcheck #modal-title").val("전송 실패");
				$("#mailcheck").modal()
				$("#compose-modal").modal("hide");
			}
		},
		error: function(){
			alert("에러 발생");
		}
	});
}

//특정 User의 게시판 보기
function showUserBoard(m_no){
	$.ajax({
		type:"post",
		url:"showPartBoard",
		data: {"m_no":m_no},
		dataType: "json",
		success: function(boardData){
			var ch;
			var str;
			str += '<table class="display" id="dt1">';
			str += '<thead><tr><th>Board No</th><th>Content</th><th>Upload Date</th><th>Like</th><th>Image</th></tr></thead>';
			str += '<tbody>';
			var list = boardData.boardlist;
			if(list.length == 0){
				str += '<tr class="odd gradeX">';
				str += '<td colspan="5" class="center">게시글이 없습니다.</td></tr>';
			}
			$(list).each(function(index, objArr){
				//alert(list.length == 0);
				str += '<tr class="odd gradeC">';
				str += '<td class="center">' + objArr["b_no"] + '</td>';
				str += '<td>' + objArr["b_content"] + '</td>';
				str += '<td>' + objArr["b_date"] + '</td>';
				str += '<td class="center">' + objArr["b_like"] + '</td>';
				str += '<td><img src="' + objArr["b_image"] + '" style="height: 50px; width: 50px;"></td></tr>';	
				
			});
			str += '</tbody></table>'
			
			$("#boardlist").html(str);
		},
		error: function(){
			alert("에러 발생");
		}
	});
}

function detailM(b_no){				//Board 상세보기
	$.ajax({
		type:"post",
		url:"AdminBoardDetail",
		data: {"b_no":b_no},
		dataType: "json",
		success: function(dto){
			//DetailImage DetailDate DetailContent
			$("#boardNumber").val(b_no);
			$("#DetailImage").attr("src", dto.b_image);
			$("#DetailDate").html(dto.b_date);
			$("#DetailContent").val(dto.b_content);
			$("#DetailModal").modal();
		},
		error: function(){
			alert("에러 발생");
		}
	});
}


function sendingEmail(m_email, m_name, w_pname){
	$("#compose-to").val(m_email);
	$("#compose-subject").val(m_name + " 님 이벤트에 당첨되었습니다!!")
	$("#compose-message").val("<" + m_name + "> 님이 선물 받기를 희망하시는 <" + w_pname + "> 는 2주 안에 주문될 예정이므로 관리자에 의하여 상품이 Lock됩니다. 앞으로도 많은 상품을 WishList을 올려서 공짜로 받아야지... 응?... 안그래?")
}


$(document).ready(function() {
    $('#example').dataTable( {
        "sDom": "<'row'<'span6'l><'span6'f>r>t<'row'<'span6'i><'span6'p>>"
    } );
} );

$.extend( $.fn.dataTableExt.oStdClasses, {
    "sWrapper": "dataTables_wrapper form-inline"
} );

function outmember(){
	document.adminGroupForm.action = "adminmemberout";
    document.adminGroupForm.method = "post";
    document.adminGroupForm.submit();
}
</script>
</head>
<body>
  
<!-- TOP MENU -->
<div class="navbar-nav navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="MainAdmin"><img src="resources/images/boomerang-logo-white.png" style="height: 15px; width: 60px" alt=""> RE:MIND ADMIN</a>
		</div> 
		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li><a href="MainAdmin"><i class="icon-home icon-white"></i> Home</a></li>              
				<li class="active"><a href="showAdminTable"><i class="icon-th icon-white"></i> Tables</a></li>
				<%if (session.getAttribute("adno") != ""){ %>
					<li><a href="adminLogout"><i class="icon-lock icon-white"></i> Logout</a></li>
				<%}else{%>
					<li><a href=adminLogin.jsp><i class="icon-lock icon-white"></i> Login</a></li>
				<%} %>	
				<li><a href="index.jsp"><i class="icon-user icon-white"></i> User</a></li>
			</ul>
		</div>
	</div>
</div>

<div class="container">
	<div class="row">
		<div class="col-sm-12 col-lg-12">
			<!--첫번째 테이블  -->
			<h4><strong>Member Table</strong></h4>
			<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
					<thead>
						<tr>
							<th style="display:none;"></th>
							<th>사용자 번호</th>
							<th>성명</th>
							<th>E-mail</th>
							<th>성별</th>
							<th>비밀번호</th>
							<th style="width: 60px">강퇴</th>
						</tr>
					</thead>
					
					<tbody>
						<cc:forEach var="Member" items="${showMem}">
							<tr class="odd gradeC">
								<td style="display:none;"></td>
								<td>${Member.m_no }</td>
								<td>${Member.m_name}</td>
								<td>${Member.m_email}</td>
								<cc:choose>
									<cc:when test="${Member.m_gender == 1}">
										<td>남</td>
									</cc:when>
									<cc:when test="${Member.m_gender == 2}">
										<td>여</td>
									</cc:when>
								</cc:choose>
								<td>${Member.m_password}</td>
								<td>
									<%if (session.getAttribute("adno") != ""){ %>
									<form action="adminmemberout" method="post" name="adminGroupForm">
										<input type="hidden" name="m_no" value="${Member.m_no}">
										<input type="hidden" name="m_name" value="${Member.m_name}">
										<button type="submit" class="btn btn-default" style="width:100%" >강퇴</button>
									</form>
									<%}%>
								</td>
							</tr>
						</cc:forEach>
					</tbody>
					
				</table>
			
			
			
			<!--두번째 Table -->
			<h4><strong>Board Table</strong></h4>
			<div id="boardlist">
				<table class="display" id="dt1" border="1">
					<thead>
						<tr>
							<th style="display:none;"></th>
							<th>Board No</th>
							<th>Content</th>
							<th>Upload Date</th>
							<th>Like</th>
							<th>Image</th>
						</tr>
					</thead>
					
					<tbody>
						<cc:forEach var="Board" items="${showBoard}">
							<tr class="">
								<td style="display:none;"></td>
								<td class="center">${Board.b_no}</td>
								<td>${Board.b_content}</td>
								<td>${Board.b_date}</td>
								<td class="center">${Board.b_like}</td>
								<td><a href="javascript:void(0)" onclick="detailM('${Board.b_no}')"><img src="${Board.b_image}" style="height: 50px; width: 50px;"></a></td>
							</tr>
						</cc:forEach>
					</tbody>
				</table><!--/END 두번쨰 TABLE -->
			</div>
			
		</div><!--/span12 -->
	</div><!-- /row -->
</div> <!-- /container -->
<br>

<div class="container">
	<h4><strong>선물 증정 이벤트 Table</strong></h4>
	<!-- <a href="showAdminTable">
		<i class="glyphicon glyphicon-refresh"></i>
	</a><br/><br/> -->
	
	<div class="row">
		<cc:forEach var="random" items="${randomList}">
			<div class="col-sm-3 col-lg-3">
				<div id="hosting-table">
					<div class="table_style4"> 
						<div class="column">
							<ul>
								<li><strong>놀라움을 선물 하세요</strong></li>
								<li class="header_row"><h1>${random.m_name}</h1></li>
								<li>${random.w_pname}</li>
								<li>${random.w_price}</li> 
								<li>${random.w_detail}</li>
								<li><img src="${random.w_image}" style="height: 70px; width: 80px;"></li>
								<li class="footer_row">
									<!-- <a href="javascript:void(0);" class="hosting-button" onclick="">증정하기</a> -->
									<a href="#compose-modal" data-toggle="modal" id="compose-button" class="hosting-button" onclick="sendingEmail('${random.m_email}','${random.m_name}','${random.w_pname}')">Compose</a>
								</li>
							</ul>
						</div>
					</div>
				</div>	
			</div>
			<%-- <cc:set var="w_noA" value="${random.w_no}"/> --%>
		</cc:forEach>
		
	</div><!-- row END-->
</div><!-- container END-->
<br>

<!-- Footer -->	
<div id="footerwrap">
	<footer class="clearfix"></footer>
	<div class="container">
		<div class="row">
			<div class="col-sm-12 col-lg-12">
				<p><img src="resources/images/boomerang-logo-white.png" alt=""></p>
				<p>Blocks Dashboard Theme - Crafted With Love - Copyright By Sim 2016</p>
			</div>
			</div><!-- row END-->
	</div><!-- container END-->		
</div><!-- footerwrap END-->


<!--Email Modal-->
<div class="modal fade" id="compose-modal" tabindex="-1" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">Compose</h4>
			</div>
			<form action="send" method="post">
				<div class="modal-body">
					<div class="form-group">
						<input type="email" class="form-control" id="compose-to" name="receiver" placeholder="To" required />
					</div>

					<div class="form-group">
						<input type="text" class="form-control" id="compose-subject" name="subject" placeholder="Subject" required />
					</div>

					<div class="form-group">
						<textarea class="form-control" id="compose-message" name="content" placeholder="Message" rows="10" required></textarea>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" id="send-button" class="btn btn-primary" onclick="send('3', '${w_noA}','999')">Send</button>
				</div>
			</form>
		</div>
	</div>
</div>

<!--메일전송 확인 MODAL -->
<div class="modal fade" id="mailcheck" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
            
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">전송 완료</h4>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
			</div>
               
		</div>
	</div>
</div>

<!-- Detail 모달 팝업 BEGINNING-->
<div class="modal fade" id="DetailModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="updateModalLabel">Detail</h4>
			</div>
			<div class="modal-body">
				<form action="AdminBoardDelete" method="post">
					<div class="form-group6">
						<label class="form-control-label">Board Image</label> 
						<img id="DetailImage" class="img-responsive">
						<input type="hidden" name="b_no" id="boardNumber">
					</div><br>
					<div class="form-group6">
						<label class="form-control-label">Update Date : </label> 
						<span id="DetailDate"></span>
					</div><br>
					<div class="form-group7">
						<label for="message-text" class="form-control-label">Board Content : </label>
						<textarea class="form-control" id="DetailContent" name="b_detail" readonly="readonly"></textarea>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary" id="delBoardA">Delete</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
   <!-- 수정모달 팝업 END-->

</body>
</html>