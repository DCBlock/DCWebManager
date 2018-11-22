<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>D Cafe Web Manager</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/png" href="assets/images/icon/favicon.ico">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/themify-icons.css">
    <link rel="stylesheet" href="assets/css/metisMenu.css">
    <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="assets/css/slicknav.min.css">
    <!-- amcharts css -->
    <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
    <!-- Start datatable css -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.18/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.jqueryui.min.css">
    <!-- style css -->
    <link rel="stylesheet" href="assets/css/typography.css">
    <link rel="stylesheet" href="assets/css/default-css.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="assets/css/responsive.css">
    <!-- modernizr css -->
    <script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>
    <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
    <!-- preloader area start -->
    <div id="preloader">
        <div class="loader"></div>
    </div>
    <!-- preloader area end -->
    <!-- page container area start -->
    <div class="page-container">
        <!-- sidebar menu area start -->
		<jsp:include page="inc/inc_side.jsp" />
        <!-- sidebar menu area end -->
        <!-- main content area start -->
        <div class="main-content">
            <!-- header area start -->
            <jsp:include page="inc/inc_header.jsp" />
            
            <!-- header area end -->
            <!-- page title area start -->
            <div class="page-title-area">
                <div class="row align-items-center">
                    <div class="col-sm-6">
                        <div class="breadcrumbs-area clearfix">
                            <h4 class="page-title pull-left">사용자 수정/삭제</h4>
                            <ul class="breadcrumbs pull-left">
                                <li><a href="index.html">사용자 관리</a></li>
                                <li><span>사용자 수정/삭제</span></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-6 clearfix">
                        <div class="user-profile pull-right">
                            <img class="avatar user-thumb" src="assets/images/author/avatar.png" alt="avatar">
                            <h4 class="user-name dropdown-toggle" data-toggle="dropdown">${user_name}<i class="fa fa-angle-down"></i></h4>
                            <!-- div class="dropdown-menu">
                                <a class="dropdown-item" href="#">Message</a>
                                <a class="dropdown-item" href="#">Settings</a>
                                <a class="dropdown-item" href="#">Log Out</a>
                            </div-->
                        </div>
                    </div>
                </div>
            </div>
            <!-- page title area end -->
            <div class="main-content-inner">
               
                <!-- visitor graph area start -->
                <div class="card mt-5">
                    <div class="card-body">
                        <div class="d-flex justify-content-between mb-5">
                            <h4 class="header-title mb-0">사용자 수정/삭제</h4>
                            <!-- select class="custome-select border-0 pr-3">
                                <option selected="">Last 7 Days</option>
                                <option value="0">Last 7 Days</option>
                            </select-->
                        </div>
                        <!--  div id="visitor_graph"></div-->
	                    <!-- data table start -->
	                    <div class="col-12 mt-5">
	                        <div class="card">
	                            <div class="card-body">
	                                <h4 class="header-title">사용자 리스트</h4>
	                                <div class="data-tables">
	                                    <table id="dataTable" class="text-center">
	                                        <thead class="bg-light text-capitalize">
	                                            <tr>
	                                                <th>RFID</th>
	                                                <th>회사명</th>
	                                                <th>이름</th>
	                                                <th>이메일</th>
	                                                <th>변경</th>
	                                            </tr>
	                                        </thead>
	                                        <tbody>
	                                            <tr>
	                                                <td>1231445</td>
	                                                <td>디지캡</td>
	                                                <td>이태호</td>
	                                                <td>thlee@digicaps.com</td>
	                                                <td>
	                                                	<button type="button" class="btn btn-flat btn-warning btn-xs mb-3">수정</button>
	                                                	<button type="button" class="btn btn-flat btn-danger btn-xs mb-3">삭제</button>	                                                	
	                                                	
	                                                </td>
	                                            </tr>

	                                            <tr>
	                                                <td>1231445</td>
	                                                <td>디지캡</td>
	                                                <td>이태호</td>
	                                                <td>thlee@digicaps.com</td>
	                                                <td>
	                                                	<button type="button" class="btn btn-flat btn-warning btn-xs mb-3">수정</button>
	                                                	<button type="button" class="btn btn-flat btn-danger btn-xs mb-3">삭제</button>	                                                	
	                                                	
	                                                </td>
	                                            </tr>
	                                            <tr>
	                                                <td>1231445</td>
	                                                <td>디지캡</td>
	                                                <td>이태호</td>
	                                                <td>thlee@digicaps.com</td>
	                                                <td>
	                                                	<button type="button" class="btn btn-flat btn-warning btn-xs mb-3">수정</button>
	                                                	<button type="button" class="btn btn-flat btn-danger btn-xs mb-3">삭제</button>	                                                	
	                                                	
	                                                </td>
	                                            </tr>
	                                            <tr>
	                                                <td>1231445</td>
	                                                <td>디지캡</td>
	                                                <td>이태호</td>
	                                                <td>thlee@digicaps.com</td>
	                                                <td>
	                                                	<button type="button" class="btn btn-flat btn-warning btn-xs mb-3">수정</button>
	                                                	<button type="button" class="btn btn-flat btn-danger btn-xs mb-3">삭제</button>	                                                	
	                                                	
	                                                </td>
	                                            </tr>
	                                            <tr>
	                                                <td>1231445</td>
	                                                <td>디지캡</td>
	                                                <td>이태호</td>
	                                                <td>thlee@digicaps.com</td>
	                                                <td>
	                                                	<button type="button" class="btn btn-flat btn-warning btn-xs mb-3">수정</button>
	                                                	<button type="button" class="btn btn-flat btn-danger btn-xs mb-3">삭제</button>	                                                	
	                                                	
	                                                </td>
	                                            </tr>
	                                            <tr>
	                                                <td>1231445</td>
	                                                <td>디지캡</td>
	                                                <td>이태호</td>
	                                                <td>thlee@digicaps.com</td>
	                                                <td>
	                                                	<button type="button" class="btn btn-flat btn-warning btn-xs mb-3">수정</button>
	                                                	<button type="button" class="btn btn-flat btn-danger btn-xs mb-3">삭제</button>	                                                	
	                                                	
	                                                </td>
	                                            </tr>
	                                            <tr>
	                                                <td>1231445</td>
	                                                <td>디지캡</td>
	                                                <td>이태호</td>
	                                                <td>thlee@digicaps.com</td>
	                                                <td>
	                                                	<button type="button" class="btn btn-flat btn-warning btn-xs mb-3">수정</button>
	                                                	<button type="button" class="btn btn-flat btn-danger btn-xs mb-3">삭제</button>	                                                	
	                                                	
	                                                </td>
	                                            </tr>
	                                            <tr>
	                                                <td>1231445</td>
	                                                <td>디지캡</td>
	                                                <td>이태호</td>
	                                                <td>thlee@digicaps.com</td>
	                                                <td>
	                                                	<button type="button" class="btn btn-flat btn-warning btn-xs mb-3">수정</button>
	                                                	<button type="button" class="btn btn-flat btn-danger btn-xs mb-3">삭제</button>	                                                	
	                                                	
	                                                </td>
	                                            </tr>
	                                            <tr>
	                                                <td>1231445</td>
	                                                <td>디지캡</td>
	                                                <td>이태호</td>
	                                                <td>thlee@digicaps.com</td>
	                                                <td>
	                                                	<button type="button" class="btn btn-flat btn-warning btn-xs mb-3">수정</button>
	                                                	<button type="button" class="btn btn-flat btn-danger btn-xs mb-3">삭제</button>	                                                	
	                                                	
	                                                </td>
	                                            </tr>
	                                            <tr>
	                                                <td>1231445</td>
	                                                <td>디지캡</td>
	                                                <td>이태호</td>
	                                                <td>thlee@digicaps.com</td>
	                                                <td>
	                                                	<button type="button" class="btn btn-flat btn-warning btn-xs mb-3">수정</button>
	                                                	<button type="button" class="btn btn-flat btn-danger btn-xs mb-3">삭제</button>	                                                	
	                                                	
	                                                </td>
	                                            </tr>	                                            <tr>
	                                                <td>1231445</td>
	                                                <td>디지캡</td>
	                                                <td>이태호</td>
	                                                <td>thlee@digicaps.com</td>
	                                                <td>
	                                                	<button type="button" class="btn btn-flat btn-warning btn-xs mb-3">수정</button>
	                                                	<button type="button" class="btn btn-flat btn-danger btn-xs mb-3">삭제</button>	                                                	
	                                                	
	                                                </td>
	                                            </tr>	                                            <tr>
	                                                <td>1231445</td>
	                                                <td>디지캡</td>
	                                                <td>이태호</td>
	                                                <td>thlee@digicaps.com</td>
	                                                <td>
	                                                	<button type="button" class="btn btn-flat btn-warning btn-xs mb-3">수정</button>
	                                                	<button type="button" class="btn btn-flat btn-danger btn-xs mb-3">삭제</button>	                                                	
	                                                	
	                                                </td>
	                                            </tr>	                                            <tr>
	                                                <td>1231445</td>
	                                                <td>디지캡</td>
	                                                <td>이태호</td>
	                                                <td>thlee@digicaps.com</td>
	                                                <td>
	                                                	<button type="button" class="btn btn-flat btn-warning btn-xs mb-3">수정</button>
	                                                	<button type="button" class="btn btn-flat btn-danger btn-xs mb-3">삭제</button>	                                                	
	                                                	
	                                                </td>
	                                            </tr>	                                            <tr>
	                                                <td>1231445</td>
	                                                <td>디지캡</td>
	                                                <td>이태호</td>
	                                                <td>thlee@digicaps.com</td>
	                                                <td>
	                                                	<button type="button" class="btn btn-flat btn-warning btn-xs mb-3">수정</button>
	                                                	<button type="button" class="btn btn-flat btn-danger btn-xs mb-3">삭제</button>	                                                	
	                                                	
	                                                </td>
	                                            </tr>	                                            <tr>
	                                                <td>1231445</td>
	                                                <td>디지캡</td>
	                                                <td>이태호</td>
	                                                <td>thlee@digicaps.com</td>
	                                                <td>
	                                                	<button type="button" class="btn btn-flat btn-warning btn-xs mb-3">수정</button>
	                                                	<button type="button" class="btn btn-flat btn-danger btn-xs mb-3">삭제</button>	                                                	
	                                                	
	                                                </td>
	                                            </tr>	                                            <tr>
	                                                <td>1231445</td>
	                                                <td>디지캡</td>
	                                                <td>이태호</td>
	                                                <td>thlee@digicaps.com</td>
	                                                <td>
	                                                	<button type="button" class="btn btn-flat btn-warning btn-xs mb-3">수정</button>
	                                                	<button type="button" class="btn btn-flat btn-danger btn-xs mb-3">삭제</button>	                                                	
	                                                	
	                                                </td>
	                                            </tr>	                                            <tr>
	                                                <td>1231445</td>
	                                                <td>디지캡</td>
	                                                <td>이태호</td>
	                                                <td>thlee@digicaps.com</td>
	                                                <td>
	                                                	<button type="button" class="btn btn-flat btn-warning btn-xs mb-3">수정</button>
	                                                	<button type="button" class="btn btn-flat btn-danger btn-xs mb-3">삭제</button>	                                                	
	                                                	
	                                                </td>
	                                            </tr>	                                            <tr>
	                                                <td>1231445</td>
	                                                <td>디지캡</td>
	                                                <td>이태호</td>
	                                                <td>thlee@digicaps.com</td>
	                                                <td>
	                                                	<button type="button" class="btn btn-flat btn-warning btn-xs mb-3">수정</button>
	                                                	<button type="button" class="btn btn-flat btn-danger btn-xs mb-3">삭제</button>	                                                	
	                                                	
	                                                </td>
	                                            </tr>	                                            <tr>
	                                                <td>1231445</td>
	                                                <td>디지캡</td>
	                                                <td>이태호</td>
	                                                <td>thlee@digicaps.com</td>
	                                                <td>
	                                                	<button type="button" class="btn btn-flat btn-warning btn-xs mb-3">수정</button>
	                                                	<button type="button" class="btn btn-flat btn-danger btn-xs mb-3">삭제</button>	                                                	
	                                                	
	                                                </td>
	                                            </tr>	                                            <tr>
	                                                <td>1231445</td>
	                                                <td>디지캡</td>
	                                                <td>이태호</td>
	                                                <td>thlee@digicaps.com</td>
	                                                <td>
	                                                	<button type="button" class="btn btn-flat btn-warning btn-xs mb-3">수정</button>
	                                                	<button type="button" class="btn btn-flat btn-danger btn-xs mb-3">삭제</button>	                                                	
	                                                	
	                                                </td>
	                                            </tr>	                                            <tr>
	                                                <td>1231445</td>
	                                                <td>디지캡</td>
	                                                <td>이태호</td>
	                                                <td>thlee@digicaps.com</td>
	                                                <td>
	                                                	<button type="button" class="btn btn-flat btn-warning btn-xs mb-3">수정</button>
	                                                	<button type="button" class="btn btn-flat btn-danger btn-xs mb-3">삭제</button>	                                                	
	                                                	
	                                                </td>
	                                            </tr>	                                            <tr>
	                                                <td>1231445</td>
	                                                <td>디지캡</td>
	                                                <td>이태호</td>
	                                                <td>thlee@digicaps.com</td>
	                                                <td>
	                                                	<button type="button" class="btn btn-flat btn-warning btn-xs mb-3">수정</button>
	                                                	<button type="button" class="btn btn-flat btn-danger btn-xs mb-3">삭제</button>	                                                	
	                                                	
	                                                </td>
	                                            </tr>

























	                                        </tbody>
	                                    </table>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <!-- data table end -->
                    </div>
                </div>
                <!-- visitor graph area end -->

            </div>
        </div>
        <!-- main content area end -->
        <!-- footer area start-->
     	<jsp:include page="inc/inc_footer.jsp" />
        
        <!-- footer area end-->
    </div>
    <!-- page container area end -->
    
    <!-- offset area end -->
    <!-- jquery latest version -->
    <script src="assets/js/vendor/jquery-2.2.4.min.js"></script>
    <!-- bootstrap 4 js -->
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/owl.carousel.min.js"></script>
    <script src="assets/js/metisMenu.min.js"></script>
    <script src="assets/js/jquery.slimscroll.min.js"></script>
    <script src="assets/js/jquery.slicknav.min.js"></script>
    <!-- Start datatable js -->
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
    <script src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.18/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>    
    <!-- others plugins -->
    <script src="assets/js/plugins.js"></script>
    <script src="assets/js/scripts.js"></script>
</body>

</html>
