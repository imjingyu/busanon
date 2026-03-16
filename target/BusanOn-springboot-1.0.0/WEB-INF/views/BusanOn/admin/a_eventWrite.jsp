<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="a_head.jsp" %>
    <title>이벤트 등록 | 관리자</title>
</head>
<body id="page-top">
<div id="wrapper">
    <%@ include file="a_sidebar.jsp" %>
    <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">
            <%@ include file="a_nav.jsp" %>
            <div class="container-fluid">
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 font-weight-bold">이벤트 등록</h1>
                </div>
                <div class="card shadow">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary"><i class="fas fa-gift"></i> 새 이벤트</h6>
                    </div>
                    <div class="card-body">
                        <form action="${pageContext.request.contextPath}/admin/eventWritePro" method="post">
                            <div class="form-group">
                                <label class="font-weight-bold">이벤트 제목</label>
                                <input type="text" name="title" class="form-control" placeholder="이벤트 제목을 입력하세요" required>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label class="font-weight-bold">시작일</label>
                                    <input type="date" name="start_date" class="form-control" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="font-weight-bold">종료일</label>
                                    <input type="date" name="end_date" class="form-control" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="font-weight-bold">이벤트 내용</label>
                                <textarea name="content" class="form-control" rows="12" placeholder="이벤트 내용을 입력하세요" required></textarea>
                            </div>
                            <div class="d-flex justify-content-end" style="gap: 8px;">
                                <a href="${pageContext.request.contextPath}/event/eventList" class="btn btn-secondary">취소</a>
                                <button type="submit" class="btn btn-primary"><i class="fas fa-save"></i> 등록</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%@ include file="a_footer.jsp" %>
    </div>
</div>
</body>
</html>
