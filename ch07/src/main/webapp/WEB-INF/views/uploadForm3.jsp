<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	/*  drag & drop */
	.drag-over { background-color:  yellow; }
	.thumb { width: 100px; padding: 5px; float: left; }
	.thumb > img { width: 50%; }
	.thumb > .close { position: absolute; background-color: red; cursor: pointer; }
	#drop { border: 1px solid black; width: 500px; height: 200px; padding:  3px; }
</style>
<script type="text/javascript">
	// drag & drop
/* 	$(document).on("drop", function(e) {
		$('input[type="file"]')
			.prop("files",e.originalEvent.dataTransfer.files); // 태그에 파일 넣기
	}); */
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
				preview(file, size - 1); // 미리보기
			}
		});	
		$('#submit').on('click', function() {
			var formData = new FormData();
			formData.append('id', frm.id.value);
			formData.append('name', frm.name.value);
			$.each(uploadfiles, function(i, file) {
				if (file.upload != 'disable') // 사용하지 파일은 제외하고
					formData.append('file',file,file.name);
			});
			$.ajax({
				url:'upload3.do', data:formData,type:'post',
				contentType:false,	processData:false,	enctype:'multipart/form-data',
				success: function(data) {
					$('form').hide();
					$('#disp').html(data);
				}
			});
		});
		$("#thumbnails").on('click', function(e) {
			var $target = $(e.target);
			var idx = $target.attr('data-idx');
			uploadfiles[idx].upload = 'disable';  // 삭제된 항목은 업로드 금지
			$target.parent().remove(); // x를 클릭한 그림 삭제
		});
	});
	function preview(file, idx) {
		var reader = new FileReader();
		reader.onload = (function(f, idx) {
			return function(e) {
				var div = '<div class="thumb"><div class="close" data-idx="'+idx+
					'">X</div><img src="'+e.target.result+ '" title="'+escape(f.name)+'"/></div>';
				$("#thumbnails").append(div);
			};
		})(file,idx);
		reader.readAsDataURL(file);
		// readAsDataURL : 컨텐츠를 특정 Blob 이나 File에서 읽어 오는 역할을 합니다
	}	
</script>
</head><body>
<div class="container" align="center">
<!-- enctype encoding type 문자를 binary변경 반대 decoding -->
<form action="upload3.do" method="post" enctype="multipart/form-data" name="frm">
	<h2 class="text-primary">회원 가입</h2>
<table class="table table-bordered">
	<tr><td>아이디</td><td><input type="text" name="id" 
		required="required" autofocus="autofocus"></td></tr>
	<tr><td>이름</td><td><input type="text" name="name" 
		required="required" ></td></tr>
	<!-- <tr><td>사진 <span class="glyphicon glyphicon-picture"></span></td>
		<td><input type="file" name="file" multiple="multiple"
		required="required"></td></tr> -->
	<!-- drag & drop -->
	<tr><td>사진  <span class="glyphicon glyphicon-picture"></span></td>
		<td><div id="drop"><div id="thumbnails">그림을 올려 놓으시오</div></div></tr>
	<tr><td colspan="2" align="center"><input type="button" id="submit" 
		class="btn btn-success" value="확인"></td></tr>
</table>
</form>
<div id="disp"></div>
</div>
</body>
</html>