<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>

    <jsp:include page="a_head.jsp"/>

    <title>부산온나 : 관리자페이지</title>
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <jsp:include page="a_sidebar.jsp"/>
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
		
		    <!-- Main Content -->
		    <div id="content">
		        <jsp:include page="a_nav.jsp"/>
		    
				<sec:authorize access="hasAnyRole('ROLE_MANAGER')">
<!--                 Begin Page Content -->
                <div class="container-fluid">
                
<!--                     Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800 font-weight-bold">관리자 통계</h1>
                    </div>
					
<!--                     Content Row -->
                    <div class="row">
<!--                         Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                회원 수(일반회원 / 업체 / 관리자)</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${Map.USER}명 / ${Map.BUSINESS}명 / ${Map.ADMIN}명</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

<!--                         Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                전체 매출액</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">&#8361; <fmt:formatNumber type="number" maxFractionDigits="3" value="${Map.PAYMENT == null ? '0' : Map.PAYMENT}" /></div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

<!--                         Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
	                                        <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
	                                                등록 팬션 수</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${Map.PCOUNT} 건</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

<!--                         Pending Requests Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                미답변 1:1문의 수</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${Map.NQNA} 개</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-comments fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
<!--                     Content Row -->

                    <div class="row mt-4">

<!--                         Area Chart -->
                        <div class="col-xl-8 col-lg-7">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">월별 매출 현황 (최근 6개월)</h6>
                                </div>
                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="myAreaChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>

<!--                         Pie Chart -->
                        <div class="col-xl-4 col-lg-5">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">펜션별 매출 TOP 5</h6>
                                </div>
                                <div class="card-body">
                                    <div class="chart-pie pt-4 pb-2">
                                        <canvas id="myPieChart"></canvas>
                                    </div>
                                    <div class="mt-4 text-center small" id="pieChartLegend"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </sec:authorize>
            </div>
<!--             End of Main Content -->

            <jsp:include page="a_footer.jsp"/>

<!--         </div> -->
<!--         End of Content Wrapper -->

<!--     </div> -->
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

    <script>
    // 월별 매출 데이터
    var monthLabels = [];
    var monthAmounts = [];
    <c:forEach var="row" items="${monthlyRevenue}">
        monthLabels.push("${row.MON}");
        monthAmounts.push(${row.AMOUNT});
    </c:forEach>

    // 펜션별 매출 TOP5 데이터
    var pieLabels = [];
    var pieAmounts = [];
    var pieColors = ['#4e73df','#1cc88a','#36b9cc','#f6c23e','#e74a3b'];
    <c:forEach var="row" items="${topPensionRevenue}">
        pieLabels.push("${row.PEN_NAME}");
        pieAmounts.push(${row.AMOUNT});
    </c:forEach>

    // 꺾은선 그래프 (월별 매출)
    var ctxArea = document.getElementById("myAreaChart").getContext('2d');
    new Chart(ctxArea, {
        type: 'line',
        data: {
            labels: monthLabels,
            datasets: [{
                label: "매출액 (원)",
                lineTension: 0.3,
                backgroundColor: "rgba(78, 115, 223, 0.05)",
                borderColor: "rgba(78, 115, 223, 1)",
                pointRadius: 3,
                pointBackgroundColor: "rgba(78, 115, 223, 1)",
                pointBorderColor: "rgba(78, 115, 223, 1)",
                pointHoverRadius: 3,
                pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
                pointHoverBorderColor: "rgba(78, 115, 223, 1)",
                pointHitRadius: 10,
                pointBorderWidth: 2,
                data: monthAmounts
            }]
        },
        options: {
            maintainAspectRatio: false,
            layout: { padding: { left: 10, right: 25, top: 25, bottom: 0 } },
            scales: {
                xAxes: [{ gridLines: { display: false, drawBorder: false }, ticks: { maxTicksLimit: 7 } }],
                yAxes: [{ ticks: {
                    maxTicksLimit: 5,
                    padding: 10,
                    callback: function(value) { return value.toLocaleString() + '원'; }
                }, gridLines: { color: "rgb(234, 236, 244)", zeroLineColor: "rgb(234, 236, 244)", drawBorder: false, borderDash: [2], borderDashOffset: [2] } }]
            },
            legend: { display: false },
            tooltips: {
                backgroundColor: "rgb(255,255,255)",
                bodyFontColor: "#858796",
                titleMarginBottom: 10,
                titleFontColor: '#6e707e',
                titleFontSize: 14,
                borderColor: '#dddfeb',
                borderWidth: 1,
                xPadding: 15,
                yPadding: 15,
                displayColors: false,
                intersect: false,
                mode: 'index',
                caretPadding: 10,
                callbacks: {
                    label: function(tooltipItem, chart) {
                        return '매출액: ' + tooltipItem.yLabel.toLocaleString() + '원';
                    }
                }
            }
        }
    });

    // 도넛 차트 (펜션별 매출 TOP5)
    var ctxPie = document.getElementById("myPieChart").getContext('2d');
    new Chart(ctxPie, {
        type: 'doughnut',
        data: {
            labels: pieLabels,
            datasets: [{
                data: pieAmounts,
                backgroundColor: pieColors.slice(0, pieLabels.length),
                hoverBackgroundColor: pieColors.slice(0, pieLabels.length),
                hoverBorderColor: "rgba(234, 236, 244, 1)"
            }]
        },
        options: {
            maintainAspectRatio: false,
            tooltips: {
                backgroundColor: "rgb(255,255,255)",
                bodyFontColor: "#858796",
                borderColor: '#dddfeb',
                borderWidth: 1,
                xPadding: 15,
                yPadding: 15,
                displayColors: false,
                caretPadding: 10,
                callbacks: {
                    label: function(tooltipItem, chart) {
                        var label = chart.labels[tooltipItem.index];
                        var value = chart.datasets[0].data[tooltipItem.index];
                        return label + ': ' + value.toLocaleString() + '원';
                    }
                }
            },
            legend: { display: false },
            cutoutPercentage: 80
        }
    });

    // 범례 동적 생성
    var legendHtml = '';
    var colorClasses = ['text-primary','text-success','text-info','text-warning','text-danger'];
    for (var i = 0; i < pieLabels.length; i++) {
        legendHtml += '<span class="mr-2"><i class="fas fa-circle ' + colorClasses[i] + '"></i> ' + pieLabels[i] + '</span>';
    }
    document.getElementById('pieChartLegend').innerHTML = legendHtml;
    </script>
</body>

</html>