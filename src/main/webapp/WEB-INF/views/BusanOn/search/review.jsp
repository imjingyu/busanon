<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.css" rel="stylesheet" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/detailReplyStyle.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/fileupload/review.js"></script>

         <div id="tabmenu" class="container tab-pane fade"><br>
         <article id="review" class="review on" >
         <!-- Reply area Start -->
            <div class="score_top">
               <p><b>만족해요</b></p>
               <!-- 별 그려보기 -->
               <div class="row col-7 mx-auto" style="max-width: 67%;">
                  <c:choose>
                  <c:when test="${fn:length(avg.AVG.toString()) == 0}">
                  <div class="text-warning display-3 col-10 float-right" id="paintStar">
                    <c:forEach var="i" begin="1" end="5" step="1">
                   			<i class="fas fa-star"></i>
                    </c:forEach>
                  </div>
                  	<div class="num col-2 display-3 text-left">5</div>
                  </c:when>
                  <c:otherwise>
	                  <div class="text-warning display-3 col-10 float-right" id="paintStar">
	                    <c:forEach var="i" begin="1" end="5" step="1">
	                    	<c:choose>
	                    		<c:when test="${i <= avg.AVG}">
	                    			<i class="fas fa-star"></i>
	                    		</c:when>
	                    		<c:otherwise>
	                    			<i class="far fa-star"></i>
	                    		</c:otherwise>
	                    	</c:choose>
	                    </c:forEach>
	                  </div>
                  	<div class="num col-2 display-3 text-left">${avg.AVG}</div>
                  </c:otherwise>
                  </c:choose>
                   
               </div>
               <p style="text-align: center;">전체 리뷰 <b>${avg.R_COUNT}</b> <span>|</span> 제휴점 답변 <b>${avg.A_COUNT}</b></p>
            </div>
            <c:if test="${sessionScope.user_id != null}">
            	<div class="text-right">
                  <button type="button" class="btn btn-primary mb-3 mr-4 replyEvent" id="replyEvent">이용후기 남기기</button>
               </div>
            </c:if>
               <div class="card shadow mb-4" id="replyForm" style="display: none;">
                     <div class="card-header py-3" style="padding: 16px 20px; height: 52px;">
                        <h6 class="m-0 font-weight-bold text-primary float-left">이용 후기</h6>
                     </div>
                     <div class="card-body">
                     <form action="reviewPro?pen_name=${param.pen_name}&rm_checkin=${param.rm_checkin }&rm_checkout=${param.rm_checkout }" method="post" onsubmit="return fileupload()">
                        <div class="form-group row">
                           <div class="col-7">
                              <label for="pensionid">이용 펜션</label>
                              <input type="text" class="form-control" id="pen_id" name="pen_id" readonly value="${param.pen_id}">
                           </div>
                           <div class="col-5">
                              <label for="starRate">별점</label>
                              <input type="number" min="0" max="5" step="1" class="form-control" placeholder="별점" id="rev_star" name="rev_star" value="5">
                           </div>
                        </div>
                        <div class="form-group row">
                           <div class="col-10">
                              <label for="title">댓글 제목</label>
                              <input type="text" class="form-control" placeholder="댓글 제목을 입력해주세요." id="rev_title" name="rev_title">
                           </div>
                           <div class="col-2">
                              <label for="writer">작성자</label>
                              <input type="text" class="form-control" id="user_name" name="user_name" readonly value='${sessionScope.user_name}'>
                              <input type="hidden" id="user_id" name="user_id" value="${sessionScope.user_id}">
                              <input type="hidden" id="user_type" name="user_type" value="${sessionScope.user_type}">
                              <input type="hidden" id="reply" name="reply" value="N">
                           </div>
                        </div>
                        <div class="form-group">
                           <label for="content">댓글 내용</label>
                           <input type="text" class="form-control" placeholder="댓글 내용을 입력해주세요." id="rev_content" name="rev_content">
                        </div>
                        <div class="form-group uploadDiv">
                           <label for="attach" class="btn btn-info btn-sm">첨부</label>
                           <input type="file" class="form-control d-none" placeholder="attach" id="attach" name="attach" multiple>
                        </div>
                        
                        <div class="card shadow mb-4">
                           <div class="card-header py-3">
                              <h6 class="m-0 font-weight-bold text-primary float-left">Files</h6>
                           </div>
                           <div class="card-body">
                              <ul class="list-group small container px-1 upload-files" id="fileList1">
                              </ul>
                           <div class="container pt-3 px-1">
                              <div class="row thumbs">
                                 
                              </div>
                           </div>
                           </div>
                        </div>
                        <button type="submit" class="btn btn-warning" id="btnReg">작성</button>
                        <a href="/board/list" type="submit" class="btn btn-dark">목록</a>
                     </form>
                  </div>
               </div>
               <c:if test="${sessionScope.user_id == null}">
               	 <div class="text-center py-4">
                    <a href="${pageContext.request.contextPath}/member/login" style="color: #0d6efd;text-decoration: underline;">댓글 등록은 로그인 이후에 가능합니다.</a>
                 </div>
               </c:if>
            <!-- 댓글 들어가는 곳 -->
		<div class="chat" id="chat">
		<c:forEach items="${List}" var="review">
         <ul>
         	<li>
              <div class="guest">
                   <p class="pic" style="margin-top: 0;"><img src="//image.goodchoice.kr/profile/ico/ico_22.png" alt='image'></p>
              <div>
                <span class="best_review">베스트 리뷰</span> 
                 <strong>${review.rev_num}</strong> 
                <strong id="title">${review.rev_title}</strong> 
                <div class="score_wrap_sm">
               <div class="score_star star_50">
               </div> 
           	<div class="num">별점 : 
           	<c:forEach var="i" begin="1" end="5">
               <c:choose>
               <c:when test="${i <= review.rev_star}">
                 <i class="fa fa-star" style="color: #fdae5c"></i>
                 </c:when>
                <c:otherwise>
               <i class="fa fa-star" style="color: #fdae5c; font-weight: 100;"></i>
               </c:otherwise>
              </c:choose> 
           </c:forEach>
           ${review.rev_star}점
           	</div>
           	</div> 
        	 <div class="name"><b>팬션이름 객실 이용 - ${review.user_name}</b></div> 
		         <div class="txt"  id="content">${review.rev_content}</div> 
      		</div>	

			<div class="gallery_re">
	    		<div class="swiper-container swiper-type-3 swiper-container-horizontal" style="cursor: grab;">
	                  <ul class="swiper-wrapper">
	              <c:if test="${review.image != null}">
	              		<c:set var="limage" value="${fn:split(review.image,',')}"></c:set>
	              	<c:forEach items="${limage}" var="item">
	          			  <li class="swiper-slide swiper-slide-active" style="max-width: 350px; max-height:250px; overflow:hidden">
				       			<img src="${pageContext.request.contextPath }/resources/images/reviewimage/${item}" alt="Image" class="img-fluid"  style="filter: brightness(100%);">
				          </li>   
	              	</c:forEach>
	              </c:if>
				      </ul>
				 <div class="swiper-button-next">
				         </div> 
				     <div class="swiper-button-prev swiper-button-disabled">
				         </div>
				  </div>
				  </div> 
                  <span class="date">${review.rev_date}</span>
              	 </div> 
              	 	<c:if test="${review.reply == 'Y'}">
              	 	<div class="boss">
		                  <p class="pic" style="margin-top: 0;">
		                     <img src="//image.goodchoice.kr/profile/ico/ico_owner.png" alt="제휴점 답변">
		                  </p> <strong>제휴점 답변</strong> 
		                  <div class="txt">${review.ans_content}
		                  </div> 
		                  <span class="date">${review.ans_date}</span>
			            </div>
              	 	</c:if>
		         	</li>
		         </ul>
		         </c:forEach>
            </div>
            <div class="p-3">
               <button class="btn btn-info btn-block btn-more" id="more_btn" onclick="moreReview()">더보기</button>
            </div>
         <!-- Reply area End -->
         <hr>
             </article>
         </div>
         
<script type="text/javascript">
var index = 0;
var check = true;
function moreReview(){
	$(document).ready(() => {
		debugger;
		if(!check){
			return;
		}
		index += 1;
		check = false;
	    $.ajax({
	        url : 'reviewajax',
	        type : "get",
	        data : {'amount': 1, 'index' : index, 'pen_id' : '${param.pen_id}'},
	   		success:(data) => {
				if(data.length == 0){
					alert('마지막 리뷰입니다.');
					index -= 1;
					check = true;
					return;
				}  
    			$.each(data, function (index, review) {
    				var result = "";
    				result += ('<ul>'+
 	    	            	'<li>'+
 	    	               '<div class="guest">'+
 	    	                    '<p class="pic" style="margin-top: 0;"><img src="//image.goodchoice.kr/profile/ico/ico_22.png" alt="image"></p>'+
 	    	               '<div>'+
 	    	                 '<span class="best_review">베스트 리뷰</span> '+
 	    	                  '<strong>'+review.rev_num+'</strong> '+
 	    	                 '<strong id="title">'+review.rev_title+'</strong> '+
 	    	                 '<div class="score_wrap_sm">'+
 	    	                '<div class="score_star star_50">'+
 	    	                '</div> '+
 	    	            	'<div class="num">별점 : ');
 	    	            	for(i = 1; i < 6; i++){
 	       					if(i <= review.rev_star){
 	       						result += ('<i class="fa fa-star" style="color: #fdae5c"></i> ')
 	       					}else{
 	       						result += ('<i class="fa fa-star" style="color: #fdae5c; font-weight: 100;"></i> ')
 	       					}
 	       				}
 	    	           		result += (''+review.rev_star+'점'+
 	    	            	'</div>'+
 	    	            	'</div> '+
 	   	 	         	 '<div class="name"><b>팬션이름 객실 이용 - '+review.user_name+'</b></div> '+
 	   	 	 		         '<div class="txt"  id="content">'+review.rev_content+'</div> '+
 	   	 	       		'</div>	'+
 	   	
 	   	 	 			'<div class="gallery_re">'+
 	   	 	 	    		'<div class="swiper-container swiper-type-3 swiper-container-horizontal" style="cursor: grab;">'+
 	   	 	 	                  '<ul class="swiper-wrapper">');
 	    	            	if(review.image != null){
 	    	            		var image = review.image.split(',');
 	    	            		for(i = 0; i < image.length; i++){
 	    	            			result += (
 	    	            					'<li class="swiper-slide swiper-slide-active" style="max-width: 350px; max-height:250px; overflow:hidden">'+
 	    	 	 				       		'	<img src="${pageContext.request.contextPath }/resources/images/reviewimage/'+image[i]+'" alt="Image" class="img-fluid"  style="filter: brightness(100%);">'+
 	    	 	 	 				        '  </li>   ');
 	    	            		}
 	    	            	}
 	    	           		result += (
 	    	 				   '   </ul>'+
 	    	 				 '<div class="swiper-button-next">'+
 	    	 				 '        </div> '+
 	    	 				 '    <div class="swiper-button-prev swiper-button-disabled">'+
 	    	 				 '        </div>'+
 	    	 				 ' </div>'+
 	    	 				 ' </div> '+
 	    	                 '  <span class="date">'+review.rev_date+'</span>'+
 	    	               	 '</div> ');
 	    	            	if(review.reply == 'Y'){
 	    	            		result += ( '<div class="boss">'+
 	       		 	 		          '        <p class="pic" style="margin-top: 0;">'+
 	       		 	 		           '          <img src="//image.goodchoice.kr/profile/ico/ico_owner.png" alt="제휴점 답변">'+
 	       		 	 		            '      </p> <strong>제휴점 답변</strong> '+
 	       		 	 		             '     <div class="txt">'+review.ans_content+''+
 	       		 	 		                '  </div> '+
 	       		 	 		                '  <span class="date">'+review.ans_date+'</span>'+
 	       		 	 			            '</div>');
 	       					}
 	    	           		result += ('</li></ul>');
 	    	           		$('#chat').append(result);
 	   	   				});
	   				check = true;
	    		}
		})

	});
}
</script>