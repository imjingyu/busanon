<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>

    <jsp:include page="b_head.jsp"/>

    <title>부산온나 : 숙소등록</title>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/daum_address_api.js"></script>
    <style>
     img {width: 250px;}
    </style>
</head>

<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">

        <jsp:include page="b_sidebar.jsp"/>
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
		
		    <!-- Main Content -->
		    <div id="content">
		        <jsp:include page="b_nav.jsp"/>
		    
				<div class="p-5 m-5 border bg-white">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">숙소 등록</h1>
                            </div>
                            <form class="user" method="post" action="${pageContext.request.contextPath }/business/roomRegisterPro" enctype="multipart/form-data">
                            	<div class="form-group">
                                	<label for="penNum">펜션 번호</label>
                                    <input type="text" class="form-control form-control-user" id="penNum" name="PEN_ID" value="${pen_id}" readonly>
                                </div>
                            	<div class="form-group">
                                	<label for="penname">펜션 이름</label>
                                    <input type="text" class="form-control form-control-user" id="penname" name="PEN_NAME" required>
                                </div>
                                <div class="form-group">
                                	<label for="penTel">펜션 전화번호</label>
                                    <input type="text" class="form-control form-control-user" id="penTel" name="PEN_TEL" required>
                                </div>
                                <div class="form-group">
                                	<div style="margin-bottom: 10px">
                                	<label for="add_dup">펜션 주소</label>
                                	<button type="button" class="btn btn-danger" id="add_dup" onclick="addressSearch()">검색</button>
                                	</div>
                                    <input type="text" class="form-control form-control-user" id="postNum" name="postNum" placeholder="우편번호(검색 버튼 클릭)" readonly style="width: 200px; margin-bottom: 10px;">
                                    <input type="text" class="form-control form-control-user" id="user_address" name="user_address" placeholder="주소(검색 버튼 클릭)" readonly style="margin-bottom: 10px;">
                                    <input type="text" class="form-control form-control-user" id="user_address2" name="user_address2" placeholder="상세주소" required>
                                </div>
                                
                                <hr>
                                <div class="form-group uploadDiv">
							   		<label class="btn btn-success btn-sm" for="attach">펜션 사진첨부</label>
								    <input type="file" class="form-control d-none" placeholder="attach" id="attach" name="PEN_IMAGE" required accept="image/*" onchange="setThumbnail(event);">
							    </div>
							    <span id="image_name"><!-- 업로드 이미지 이름 표시 영역 --></span>
							    <div id="image_container"><!--  업로드 이미지 표시 영역 --></div>
							    <hr>
								<h1 style="font-family: sans-serif; font-size: 18px;">객실 세부정보</h1>

								<div id="roomInfoadd"></div>
								<hr>
								<input type="button" id="my-btn" onclick="roomInfoAdd()" value="객실세부정보 추가" class="btn btn-danger" style="margin-bottom: 10px;">

		<script>
	  var cnt = 0;
	  function roomInfoAdd(){
		  for (var i = 0; i < cnt; i++) {
			$("#collapse"+i).attr('class','collapse')
			}
		  var roomInfo=`<div id="c\${cnt}"><div class="container" ><hr>
			  <div id="accordion">
			    <div class="card" style="background: #efefef;">
			    <div class="card-header">
			    <a href="javascript:deleteForm(\${cnt})" style="text-align: right; position: relative;">삭제</a><br>
		      <a class="card-link" data-toggle="collapse" href="#collapse\${cnt}">
			    접기/펼치기
		      </a>
			<div class="form-group">
            	<label for="rm_name">객실 이름</label>
                <input type="text" class="form-control form-control-user" id="rm_name" name="RM_NAME" required>
            </div>
		    
		</div>
		    <div id="collapse\${cnt}" class="collapse show" data-parent="#accordion">
		      <div class="card-body">
		      
		      <div class="form-group" style="width: 200px; float: left; margin-right: 5px;">
          		<label for="checkIn">체크인 시간</label>
                <input type="time" class="form-control form-control-user" id="checkIn" name="checkin" required>
          	  </div>
          	  <div class="form-group" style="width: 200px; float: left; margin-right: 5px;">
      			<label for="checkOut">체크아웃 시간</label>
          		<input type="time" class="form-control form-control-user" id="checkOut" name="checkout" required>
     	      </div>
     	      <div class="form-group" style="width: 200px; float: left;">
   		    	<label for="people">객실이용 가능인원</label>
       	    	<input type="text" class="form-control form-control-user" id="people" name="people" required>
   	  	  	  </div>
          	  <div class="form-group" style="clear: both;">
          		<label for="price">객실 가격</label>
              	<input type="text" class="form-control form-control-user" id="price" name="RM_Price" required>
          	  </div>
					 <label>
					    <p class="label-txt">대표이미지</p>
					    <input type="file" name="RM_IMAGE" class="input" required>
					    <div class="line-box">
					      <div class="line"></div>
					    </div>
					  </label>
					 
					</div>
					</div>
					</div>
					</div>
					</div>
		    </div>
		  </div>`;
		  $("#roomInfoadd").append(roomInfo);
		  cnt++;
	  }
	  function deleteForm(delCount){
		  if($("#roomInfoadd").children().length!=1){
			  $("#c"+delCount).remove();
		  }else{
			  alert('최소 1개 이상의 세부정보가 포함되어야 합니다.')
		  }
	  }
  </script>
						        
						        
						        
						        
                                <button class="btn btn-primary btn-user btn-block" id="btnReg">
                                    숙소 등록하기
                                </button>
                            </form>
                        </div>
            		</div>
            <!-- End of Main Content -->

            <jsp:include page="b_footer.jsp"/>

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

	<!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath }/resources/assets/admin/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath }/resources/assets/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath }/resources/assets/admin/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="${pageContext.request.contextPath }/resources/assets/admin/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${pageContext.request.contextPath }/resources/assets/admin/js/demo/chart-area-demo.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/admin/js/demo/chart-pie-demo.js"></script>

    <!-- Page level plugins -->
    <script src="${pageContext.request.contextPath }/resources/assets/admin/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${pageContext.request.contextPath }/resources/assets/admin/js/demo/datatables-demo.js"></script>
    
<script type="text/javascript">

function setThumbnail(event) {
    var reader = new FileReader();
	const files = event.currentTarget.files;
	
	// 파일 타입 검사
    [...files].forEach(file => {
    	
    	// 파일 타입이 이미지 파일이 아닐 때 
        if (!file.type.match("image/.*")) {
          alert('이미지 파일만 업로드가 가능합니다.');
          return false;
        }
        //  파일 타입이 이미지 파일이 업로드될 때
        if(file.type.match("image/.*")) {
        	
    	    reader.onload = function(event) {
    	        var img = document.createElement("img");
    	        img.setAttribute("src", event.target.result);
    	      
    	        document.querySelector("div#image_container").innerHTML = '';
    	        document.querySelector("div#image_container").appendChild(img);
    	      
    	    };
    	    reader.readAsDataURL(event.target.files[0]);
        } 
      
      
    });
}
</script>
<script type="text/javascript">
	$(document).ready(function() {
		document.getElementById("my-btn").click();
	});
</script>
<script>
	$(function() {
		var spanElem = document.getElementById("image_name");
		
		$("#attach").change(function() {
			var str = "";
			$(this.files).each(function() {
				console.log(this.name);
				str = this.name;
// 				"<p>" + this.name + "</p>";	
// 				spanElem.innerHTML = str;
// 				console.log(spanElem.innerHTML);
			})
			spanElem.innerHTML = str;
// 			$(this).next().html(str);
		})
	});	
</script>

</body>
</html>
