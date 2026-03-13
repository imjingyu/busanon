<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Free Tour and Travel Website Tempalte | Smarteyeapps.com</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/fav.png" type="image/x-icon">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&display=swap" rel="stylesheet">
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/fav.jpg">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/slider/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/slider/css/owl.theme.default.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/style.css" />
</head>

<body>
<!--헤더 -->
<%@ include file="../header.jsp" %>
 
<!--  ************************* Page Title Starts Here ************************** -->
<div class="page-nav no-margin row">
    <div class="container">
        <div class="row">
            <h2>객실 등록</h2>
            <ul>
                <li> <a href="#"><i class="fas fa-home"></i> 사업자 페이지</a></li>
                <li><i class="fas fa-angle-double-right"></i> 객실 등록</li>
            </ul>
        </div>
    </div>
</div>

<!-- 객실 등록 폼 시작 -->
<div class="container" style="width: 800px; margin-top: 100px; margin-bottom: 50px;">
<h2 style="text-align: center;">객실등록</h2>
  <form action="${pageContext.request.contextPath}/roomInsertPro" method="post" name="f">
    <div class="mb-3 mt-3">
      <label>객실이름 : </label>
      <input type="text" class="form-control" id="RM_NAME" name="RM_NAME" required>
    </div>
    <div class="mb-3">
      <label>가격</label>
      <input type="text" class="form-control" id="RM_PRICE" name="RM_PRICE"  pattern="[0-9]+" required placeholder="숫자만 입력하세요">
    </div>
	    
    <div style="clear:both;"></div>
    
    <div class="mb-3" style="margin-top: 20px;">
    <label>객실이용인원</label>
    <select id="people" name="r_count">
    	<option>1</option>
    	<option>2</option>
    	<option>3</option>
    	<option>4</option>
    </select>
    </div>
	<div class="mb-3" >
    	<label style=" margin-bottom: 10px;" >객실기본정보&nbsp;&nbsp;&nbsp;</label>
    	<span id="byteInfo" style="display: inline;">0</span> /4000bytes
   		<textarea rows="10" cols="100" name="ro_info" onKeyUp="javascript:fnChkByte(this,'4000')" required></textarea>
    </div>

    <label style=" margin-bottom: 10px;">객실사진등록&nbsp;&nbsp;&nbsp;</label>
    <textarea rows="10" cols="100" name="location" required></textarea>
    <button type="submit" class="default_btn rounded mt-1" style="width:100px;margin:auto; display:block;">등록</button>
  </form>
</div>
<!-- 객실 등록 폼 끝 -->
<!-- 객실 등록 폼 기능 시작-->
<script type="text/javascript">

//Byte 수 체크 제한
function fnChkByte(obj, maxByte)
{
    var str = obj.value;
    var str_len = str.length;
    var rbyte = 0;
    var rlen = 0;
    var one_char = "";
    var str2 = "";
    for(var i=0; i<str_len; i++)
    {
        one_char = str.charAt(i);
        if(escape(one_char).length > 4) {
            rbyte += 3;                                         //한글3Byte
        }else{
            rbyte++;                                            //영문 등 나머지 1Byte
        }
        if(rbyte <= maxByte){
            rlen = i+1;                                          //return할 문자열 갯수
        }
     }
     if(rbyte > maxByte)
     {
        // alert("한글 "+(maxByte/2)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
        alert("메세지는 최대 " + maxByte + "byte를 초과할 수 없습니다.")
        str2 = str.substr(0,rlen);                                  //문자열 자르기
        obj.value = str2;
        fnChkByte(obj, maxByte);
     }
     else
     {
        document.getElementById('byteInfo').innerText = rbyte;
     }
}
  
</script>
<!-- 객실 등록 폼 기능 끝 -->
<!--  ************************* Footer Start Here ************************** --> 
     
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-sm-12">
                    <h2>About Us</h2>
                    <p>
                        Smart Eye is a leading provider of information technology, consulting, and business process services. Our dedicated employees offer strategic insights, technological expertise and industry experience.
                    </p>
                    <p>We focus on technologies that promise to reduce costs, streamline processes and speed time-to-market, Backed by our strong quality processes and rich experience managing global... </p>
                </div>
                <div class="col-md-4 col-sm-12">
                    <h2>Useful Links</h2>
                    <ul class="list-unstyled link-list">
                        <li><a ui-sref="about" href="#/about">About us</a><i class="fa fa-angle-right"></i></li>
                        <li><a ui-sref="portfolio" href="#/portfolio">Portfolio</a><i class="fa fa-angle-right"></i></li>
                        <li><a ui-sref="products" href="#/products">Latest jobs</a><i class="fa fa-angle-right"></i></li>
                        <li><a ui-sref="gallery" href="#/gallery">Pricing</a><i class="fa fa-angle-right"></i></li>
                        <li><a ui-sref="contact" href="#/contact">Contact us</a><i class="fa fa-angle-right"></i></li>
                    </ul>
                </div>
                <div class="col-md-4 col-sm-12 map-img">
                    <h2>Contact Us</h2>
                    <address class="md-margin-bottom-40">
                        BlueDart Hosting <br>
                       765th Boulevard, <br>
                        Rochester, CA <br>
                        Phone: +1 831 143 556 <br>
                        Email: <a href="mailto:info@bluedart.com" class="">info@bluedart.in</a><br>
                        Web: <a href="https://smarteyeapps.com/" class="">www.bluedart.in</a>
                    </address>

                </div>
            </div>
        </div>
        

    </footer>
    <div class="copy">
            <div class="container">
                <a href="https://www.smarteyeapps.com/">2019 &copy; All Rights Reserved | Designed and Developed by Smarteyeapps</a>
                
                <span>
                <a><i class="fab fa-github"></i></a>
                <a><i class="fab fa-google-plus-g"></i></a>
                <a><i class="fab fa-pinterest-p"></i></a>
                <a><i class="fab fa-twitter"></i></a>
                <a><i class="fab fa-facebook-f"></i></a>
        </span>
            </div>

        </div> 

    </body>

    <script src="assets/js/jquery-3.2.1.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
    <script src="assets/plugins/slider/js/owl.carousel.min.js"></script>
    <script src="assets/js/script.js"></script>
</html>
