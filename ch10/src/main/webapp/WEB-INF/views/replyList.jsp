<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function rDelete(bno,rno) {
		var sendData = 'bno='+bno+'&rno='+rno;
		$.post('${path}/rDelete', sendData, function(data) {
			alert("댓글이 삭제 되었습니다");
			$('#rbdListDisp').html(data);
		});
	}
	function rUpdate(bno,rno) {
		// 댓글을 읽어서 textarea에 넣고 수정 가능하게 만들어야 한 
		// input, textarea에 있는 데이터를 읽을 때는 jquery val()
		// td등 일반태그에 있는 데이터를 읽을 때는 jquery에서는 text()로 읽는다
		var txt = $('#td_' + rno).text();
		// 클릭한 위치에 있는 댓글을 읽어서 수정할수 있도록 textarea에 넣기
		$('#td_' + rno).html("<textarea rows='3' cols='30' id='rt_"+rno+'>" + txt + "</textarea>");
		// 현재의 버튼을 수정하고 난 후에 확인, 취소로 변경
		$('#btn_' + rno).html("<input type='button' onclick='up(" + bno + "," + rno + ")' class='btn btn-sm btn-danger' value='확인'>" + 
				" <input type='button' onclick='lst(" + bno + ")' class='btn btn-sm btn-info' value='취소'>");
	}
	function lst(bno) {
		$('#rbdListDisp').load('${path}/replyList/bno/' + bno);
	}
	function up(bno, rno) {
		var sendData = "replytext=" + $('#rt_'+rno).val() + "&bno=" + bno + "&rno=" + rno;
		$.post("${path}/rUpdate", sendData, function(data) {
			alert('댓글 수정 완료');
			$('#rbdListDisp').html(data);
		})
	}
</script></head><body>
<c:if test="${not empty rbdList }">
	<h3 class="text-primary">댓글</h3>
<table class="table table-striped">
	<tr><th>작성자</th><th>내용</th><th>수정일</th><th></th></tr>
<c:forEach var="rbd" items="${rbdList }">
	<c:if test="${rbd.del == 'y' }">
		<tr><td colspan="4">삭제된 댓글입니다</td></tr>
	</c:if>
	<c:if test="${rbd.del != 'y' }">
		<tr><td>${rbd.replyer }</td>
			<td id="td_${rbd.rno }"><pre>${rbd.replytext }</pre></td>
			<td>${rbd.updatedate }</td>
<!-- 	회원 게시판에서는 댓글 작성자하고 로그인한 ID(작성자, 별명) 비교해서 같으면 수정/삭제가 보임
		회원 게시판 아니라서 임시로 게시판 작성자 이름과 비교 -->
		<c:if test="${rbd.replyer == board.writer }">
			<td id="btn_${rbd.rno }"><input type="button" class="btn btn-warning btn-sm" 
					value="수정" onclick="rUpdate(${rbd.bno},${rbd.rno})">
				<input type="button" class="btn btn-danger btn-sm" 
					value="삭제" onclick="rDelete(${rbd.bno},${rbd.rno})">
			</td>
		</c:if>
		<c:if test="${rbd.replyer != board.writer }"><td></td></c:if>
		</tr>
	</c:if>	
</c:forEach>
</table>
</c:if>
</body>
</html>