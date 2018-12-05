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
    <!-- link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.18/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.jqueryui.min.css"-->
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
                            <h4 class="page-title pull-left">취소주문 관리</h4>
                            <ul class="breadcrumbs pull-left">
                                <li><a href="/">카페 관리</a></li>
                                <li><span>취소주문 관리</span></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-6 clearfix">
                        <div class="user-profile pull-right">
                            <img class="avatar user-thumb" src="assets/images/author/avatar.png" alt="avatar">
                            <h4 class="user-name dropdown-toggle" data-toggle="dropdown">${user_name}<i class="fa fa-angle-down"></i></h4>
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
                            <h4 class="header-title mb-0">취소주문 관리</h4>
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

	                                
	                                <!-- 테이블 샘플 -->
                                <div class="single-table">
                                    <div class="table-responsive">
                                        <table class="table text-center">
<thead class="bg-light text-capitalize">
	                                            <tr>
	                                                <th scope="col">구매시간</th>
	                                                <th scope="col">주문메뉴</th>
	                                                <th scope="col">갯수</th>
	                                                <th scope="col">가격</th>
	                                                <th scope="col">할인가격</th>
	                                                <th scope="col">사이즈</th>
	                                                <th scope="col">종류</th>
	                                                <th scope="col">상태</th>
	                                                <th scope="col">취소요청시간</th>
	                                                <th scope="col">취소완료시간</th>	 
	                                                <th scope="col">업데이트시간</th>
	                                            </tr>
	                                        </thead>
	                                        <tbody>
	                                            <tr>
	                                                <th scope="row">2018-12-25 14:12:30</th>
	                                                <td>아메리카노</td>
	                                                <td>3</td>
  	                                                <td>4500</td>
	                                                <td>1500</td>
  	                                                <td>Regular</td>
	                                                <td>Ice</td>
  	                                                <td><span class="badge badge-pill badge-warning">취소대기중</span></td>	
	                                                <td><button type="button" class="btn btn-flat btn-info btn-xs mb-3"  data-toggle="modal" data-target="#open_order_cancel_modal" onclick="set_cancel_target('1');">취소승인</button></td>
  	                                                <td>-</td>
	                                            </tr>
	                                            <tr>
	                                                <th scope="row">2018-12-25 14:12:30</th>
	                                                <td>아메리카노</td>
	                                                <td>3</td>
  	                                                <td>4500</td>
	                                                <td>1500</td>
  	                                                <td>Regular</td>
	                                                <td>Ice</td>
  	                                                <td><span class="badge badge-pill badge-danger">취소됨</span></td>	
	                                                <td>2018-12-25 23:10:44</td>
  	                                                <td>2018-12-25 23:12:33</td>
	                                            </tr>
	                                            <tr>
	                                                <th scope="row">2018-12-25 14:12:30</th>
	                                                <td>아메리카노</td>
	                                                <td>3</td>
  	                                                <td>4500</td>
	                                                <td>1500</td>
  	                                                <td>Regular</td>
	                                                <td>Ice</td>
  	                                                <td><span class="badge badge-pill badge-danger">취소됨</span></td>	
	                                                <td>2018-12-25 23:10:44</td>
  	                                                <td>-</td>
	                                         	</tr>
	                                         	<tr>
	                                                <th scope="row">2018-12-25 14:12:30</th>
	                                                <td>아메리카노</td>
	                                                <td>3</td>
  	                                                <td>4500</td>
	                                                <td>1500</td>
  	                                                <td>Regular</td>
	                                                <td>Ice</td>
  	                                                <td><span class="badge badge-pill badge-warning">취소대기중</span></td>	
	                                                <td><button type="button" class="btn btn-flat btn-info btn-xs mb-3"  data-toggle="modal" data-target="#open_order_cancel_modal" onclick="set_cancel_target('1');">취소승인</button></td>
  	                                                <td>-</td>	                                         	
	                                         	</tr>



	                                        </tbody>
                                        </table>
                                    </div>
                                </div>
	                                
	                                <!-- 테이블 샘플 끝 -->
	                            </div>
	                        </div>
	                    </div>
	                    <!-- data table end -->
                    </div>
                </div>
                <!-- visitor graph area end -->

            </div>
            
            
            

						                                
						                                
						                <!-- 회원정보 삭제 모달 시작 -->
		                                <div class="modal fade" id="open_order_cancel_modal">
		                                    <div class="modal-dialog modal-dialog-centered" role="document">
		                                        <div class="modal-content">
		                                            <div id="modal-header" class="modal-header">
		                                                <h5 class="modal-title">주문취소</h5>
		                                                <!-- button type="button" class="close" data-dismiss="modal" onclick="rfcard_register_modal_close();"><span>&times;</span></button-->
		                                            </div>
		                                            <div class="modal-body">
		                                                
														<h5 id="delete_user_name">주문을 취소 처리하시겠습니까?</h5>
		                                            </div>
		                                            <div class="modal-footer">
			                                            <button type="button" class="btn btn-primary" onclick="confirm_delete();">확인</button>
		                                                <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="">취소</button>
		                                                
		                                            </div>
		                                        </div>
		                                    </div>
		                                </div>
		                                <!-- 회원정보 삭제 모달 끝 -->						                                
						                                
						                <!-- 완료 모달 -->
		                                <div class="modal fade" id="ok_modal">
		                                    <div class="modal-dialog modal-dialog-centered" role="document">
		                                        <div class="modal-content">
		                                            <div id="modal-header" class="modal-header">
		                                                <h5 class="modal-title">알림</h5>
		                                                <!-- button type="button" class="close" data-dismiss="modal" onclick="rfcard_register_modal_close();"><span>&times;</span></button-->
		                                            </div>
		                                            <div class="modal-body">
		                                                <br/>
														<h5 id="">완료되었습니다.</h5>
														<br/>
		                                            </div>
		                                            <div class="modal-footer">
		                                                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="">확인</button>
		                                                
		                                            </div>
		                                        </div>
		                                    </div>
		                                </div>
		                                <!-- 완료 모달 끝 -->				
		                                
		                                						                                
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
    <!--  script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
    <script src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.18/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script-->    
    <!-- others plugins -->
    <script src="assets/js/plugins.js"></script>
    <script src="assets/js/scripts.js"></script>
    <script>
	var CANCEL_TARGET = "";
    function open_user_delete_modal(u_index, u_name){
    }
    
    function confirm_modify(){
    }
    
    function set_cancel_target(tar){
    	CANCEL_TARGET = tar;
    	alert(CANCEL_TARGET);
    }
    
    //$('#modal_rfcard_regist').modal('hide');

    
    </script>
</body>

</html>
