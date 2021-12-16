<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 

<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<body>
	<div class="container px-4 px-lg-5">
		<a class="navbar-brand" href="home.do"><img src="${path }/resources/template/img/logo_jobdamoa.png" class="img-fluid"></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
				<!-- <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Home</a></li> -->
				<!-- <li class="nav-item"><a class="nav-link" href="#!">About</a></li> -->
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">채용공고
						확인</a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item" href="scrapProgrammers.do">프로그래머스</a></li>
						<!-- <li><a class="dropdown-item" href="#!">잡코리아</a></li> -->
						<li><a class="dropdown-item" href="scrapSaramin.do">사람인</a></li>
					</ul></li>
				<li class="nav-item"><a class="nav-link" href="annList.do">기업 채용 공고</a></li>
			</ul>
			<div class="d-flex">
			<c:choose>
				<c:when test="${empty user_dist }">
				<div class="dropdown">
					<button class="btn btn-outline-dark" type="button" onclick="location.href='memberLoginForm.do'">
						<i class="bi bi-box-arrow-in-right"></i> 로그인 / 회원가입
					</button> <!-- 드랍박스가 아닌 화면 구성 시 로그인 페이지를 별도로 연결하여, 탭으로 회원 선택 및 구분 -->
				</div> <!-- 드랍박스가 아닌 화면 구성 시 로그인 페이지를 별도로 연결하여, 탭으로 회원 선택 및 구분 -->
				<!--  <button class="btn btn-dark" type="button" onclick="location.href='memberJoinForm.do'">
					<i class="bi bi-person-plus"></i> 회원가입
				</button>-->
				</c:when>
				<c:when test="${user_dist == '0' }">
				<div class="dropdown">
					<button class="btn btn-outline-dark dropdown-toggle bi bi-person-circle" type="button" id="loginSelectButton" data-bs-toggle="dropdown" aria-expanded="false">
						마이페이지
					</button>
					<ul class="dropdown-menu" aria-labelledby="loginSelectButton">
    					<li><a class="dropdown-item" href="memInfo.do">회원정보</a></li>
    					<li><a class="dropdown-item" href="myFavList.do">저장공고</a></li>
    					<li><a class="dropdown-item" href="myScrapList.do">스크랩공고</a></li>
			    		<li><hr class="dropdown-divider"></li>
    					<li><a class="dropdown-item" href="memberLogout.do">로그아웃</a>
  					</ul>
				</div>
				</c:when>
				<c:when test="${user_dist == '1' }">
				<div class="dropdown">
					<button class="btn btn-outline-dark dropdown-toggle bi bi-building" type="button" id="loginSelectButton" data-bs-toggle="dropdown" aria-expanded="false">
						마이페이지
					</button>
					<ul class="dropdown-menu" aria-labelledby="loginSelectButton">
    					<li><a class="dropdown-item" href="comInfo.do">기업정보</a></li>
    					<li><a class="dropdown-item" href="myAnnList.do">나의 공고</a></li>
    					<li><hr class="dropdown-divider"></li>
    					<li><a class="dropdown-item" href="companyLogout.do">로그아웃</a>
  					</ul>  					
				</div>
				</c:when>
				<c:when test="${user_dist == '2' }">
				<div class="dropdown">
					<button class="btn btn-warning btn-outline-dark dropdown-toggle bi bi-file-person-fill" type="button" id="loginSelectButton" data-bs-toggle="dropdown" aria-expanded="false">
						관리메뉴
					</button>
					<ul class="dropdown-menu" aria-labelledby="loginSelectButton">
    					<li><a class="dropdown-item" href="memberManageForm.do">회원관리</a></li>
    					<li><a class="dropdown-item" href="companyManageForm.do">기업회원관리</a></li>
    					<li><hr class="dropdown-divider"></li>
    					<li><a class="dropdown-item" href="manageAnnouncementForm.do">채용공고 관리</a></li>
    					<li><hr class="dropdown-divider"></li>
    					<li><a class="dropdown-item" href="managerLogout.do">로그아웃</a>
  					</ul>  					
				</div>
				</c:when>
			</c:choose>
			</div>
		</div>
	</div>
</body>
</html>