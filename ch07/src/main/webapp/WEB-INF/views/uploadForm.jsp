<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	/*  drag & drop */
	.drag-over { background-color:  yellow; }
	.thumb { width: 200px; padding: 5px; float: left; }
	.thumb > img { width: 100%; }
	.thumb > .close { position: absolute; background-color: red; cursor: pointer; }
	#drop { border: 1px solid black; width: 300px; height: 200px; padding:  3px; }
</style>
<script type="text/javascript">
	// drag & drop
	$(document).on("drop", function(e) {
		$('input[type="file"]')
			.prop("files",e.originalEvent.dataTransfer.files); // 태그에 파일 넣기
	});
	$(function() {
		var uploadfiles = [];
		var $drop = $('#drop');
		$drop.on("dragenter", function(e) { //드래그 요소가 들어왔을떄
			$('#thumbnails').text("");
			$(this).addClass('drag-over');			
		}).on("dragleave", function(e) { //드래그 요소가 나갔을때
			$('#thumbnails').text("그림을 올려 놓으시오");
			$(this).removeClass('drag-over');
		}).on("dragover", function(e) {     // 드래그한 항목을 떨어뜨릴려고 올려 놨울 떄
			e.stopPropagation();  // 이밴트를 전달하지 마라
			e.preventDefault();   // 원래 자체 기능를 하지 마라
		}).on("drop", function(e) {        // 드래그한 항목을 떨어뜨릴 때
			e.preventDefault();  
			$(this).removeClass('drag-over');
			var files = e.originalEvent.dataTransfer.files; // 드래그 한 항복
			for (var i =0; i < files.length; i++) {
				var file = files[i];
				var size = uploadfiles.push(file); // 업로드 목록에 추가
				preview(file); // 미리보기
			}
		});	
		$("#thumbnails").on('click', function(e) {
			var $target = $(e.target);
			var idx = $target.attr('data-idx');
			$target.parent().remove(); // x를 클릭한 그림 삭제
		});
	});
	function preview(file) {
		var reader = new FileReader();
		reader.onload = (function(f) {
			return function(e) {
				var div = '<div class="thumb"><div class="close">X</div><img src="'+ 
					e.target.result+ '"/></div>';
				$("#thumbnails").append(div);
			};
		})(file);
		reader.readAsDataURL(file);
		// readAsDataURL : 컨텐츠를 특정 Blob 이나 File에서 읽어 오는 역할을 합니다
	}	
</script>
</head><body>
<div class="container" align="center">
<!-- enctype encoding type 문자를 binary변경 반대 decoding -->
<!-- <form action="upload.do" method="post" enctype="multipart/form-data" name="frm"> -->
<form action="upload2.do" method="post" enctype="multipart/form-data" name="frm">
	<h2 class="text-primary">회원 가입</h2>
<table class="table table-bordered">
	<tr><td>아이디</td><td><input type="text" name="id" 
		required="required" autofocus="autofocus"></td></tr>
	<tr><td>이름</td><td><input type="text" name="name" 
		required="required" ></td></tr>
	<tr><td>사진 <span class="glyphicon glyphicon-picture"></span></td>
		<td><input type="file" name="file" readonly="readonly"
		required="required"></td></tr>
	<!-- drag & drop -->
	<tr><td>사진  <span class="glyphicon glyphicon-picture"></span></td>
		<td><div id="drop"><div id="thumbnails">그림을 올려 놓으시오</div></div></tr>
	<tr><td colspan="2" align="center"><input type="submit" 
		class="btn btn-success"></td></tr>
</table>
</form>
</div>
</body>
</html>