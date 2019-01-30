<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>DCCaffe Web Manager</title>
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
                            <h4 class="page-title pull-left">주문취소 관리</h4>
                            <ul class="breadcrumbs pull-left">
                                <li><a href="/">카페 관리</a></li>
                                <li><span>주문취소 관리</span></li>
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
                            <h4 class="header-title mb-0">주문취소 관리</h4>
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
								  <div class="row">
                            		<table style="border:1px solid black;">
										<thead style="border:1px solid white; border-color:white;">
										<tr>
											<th style="border:1px solid white;border-top:1px solid white; border-color:white;">
												검색시작날짜
											</th>
											<th style="border:1px solid white;">
												 
											</th>
											<th style="border:1px solid white; border-color:white;">
												검색종료날짜
											</th>
											<th style="border:1px solid white; border-color:white;">
											</th>
										</tr>
										</thead>
									
										<tbody style="border:1px solid white;">

										<tr style="border-bottom:1px solid gray;">
											<td style="border:1px solid white;">
												<input class="form-control" type="date" value="${start_date}" id="start_day">
											</td>
											<td style="border:1px solid white;">
											 ~ 	 
											</td>
											<td style="border:1px solid white;">
												<input class="form-control" type="date" value="${end_date}" id="end_day">
											</td>
											<td style="border:1px solid white;"><br>
												　<button type="button" style="margin-top:-4px;" onclick="reload_page();" class="btn btn-flat btn-info mb-3"><i class="ti-search"></i></button><br>
											</td>
										</tr>
										</tbody>
									</table>
									</div>	


									<!-- div class="col-sm-12">
										<div class="form-group">
                                            <input class="form-control" type="date" value="2018-03-05" id="example-date-input" style="width:200px"> ~ 
                                            <input class="form-control" type="date" value="2018-03-05" id="example-date-input" style="width:200px">
                                            <button type="button" class="btn btn-flat btn-info mb-3" disabled><i class="ti-search"></i></button>
										</div>
									</div>
									<div class="col-sm-1" >
										<div class="form-group">
                                            <center>~</center>
										</div>
									</div>
									<div class="col-sm-2">
										<div class="form-group">
                                            
										</div>
									</div>
									
									<div class="col-sm-1" >
										
									</div>
									
									<div class="col-sm-6">
									</div>																											
								</div-->
	                                
	                                <!-- 테이블 샘플 -->
                                <div class="single-table">
                                    <div class="table-responsive">
                                        <table class="table text-center">
											<thead class="bg-light text-capitalize">
	                                            <tr>
	                                                <th scope="col">구매날짜</th>
	                                                <th scope="col">영수증ID</th>
	                                                <th scope="col">성명</th>
	                                                
	                                                <th scope="col">메뉴명(국문)</th>
	                                                <th scope="col">가격</th>
	                                                <th scope="col">할인가격</th>
	                                                <th scope="col">타입</th>
	                                                <th scope="col">사이즈</th>
	                                                <th scope="col">개수</th>
	                                                <th scope="col">처리상태</th>
	                                                <th scope="col">구매날짜</th>	 
	                                                <th scope="col">취소요청날짜</th>
  	                                                <th scope="col">취소승인날짜</th>
	                                            </tr>
	                                        </thead>
	                                        <tbody>
	                                        	<c:forEach items="${cancel_list}" var="cancel_list" varStatus="status">
		                                            <tr>
		                                            	<c:choose>
			                                            	<c:when test="${cancel_list.rowspan eq '1'}">
			                                            		<td scope="row" rowspan="${cancel_list.data_cnt}">${cancel_list.tdate}</td>
			                                            	</c:when>
			                                            	<c:otherwise>
														    </c:otherwise>
		                                            	</c:choose>
		                                                <c:choose>
			                                            	<c:when test="${cancel_list.rowspanreceipt eq '1'}">
			                                            		<td scope="row" rowspan="${cancel_list.receipt_id_cnt}">${cancel_list.receipt_id}</td>
			                                            	</c:when>
			                                            	<c:otherwise>
														    </c:otherwise>
		                                            	</c:choose>
		                                            	<td>${cancel_list.name}</td>
		                                                <td>${cancel_list.menu_name_kr}</td>
	  	                                                <td>${cancel_list.price}</td>
		                                                <td>${cancel_list.dc_price}</td>
	  	                                                <td>${cancel_list.type}</td>
		                                                <td>${cancel_list.size}</td>
		                                                <td>${cancel_list.count}</td>
		                                                <td>
		                                                <c:choose>
			                                            	<c:when test="${cancel_list.receipt_status eq '1'}">
			                                            		<span class="badge badge-pill badge-warning">취소승인 대기중</span>
			                                            		<!-- button type="button" class="btn btn-flat btn-info btn-xs mb-3"  data-toggle="modal" data-target="#open_order_cancel_modal" onclick="set_cancel_target('1');">취소승인</button-->
			                                            	</c:when>
			                                            	<c:when test="${cancel_list.receipt_status eq '2'}">
			                                            		<span class="badge badge-pill badge-success">취소승인 완료</span>
			                                            	</c:when>			                                            	
			                                            	
			                                            	<c:otherwise>
														    </c:otherwise>
		                                            	</c:choose>
		                                                </td>
		                                                <td>${cancel_list.tpurchase_date}</td>
		                                                <td>${cancel_list.cancel_date}</td>
   		                                                <td>
   		                                                <c:choose>
			                                            	<c:when test="${cancel_list.canceled_date eq '-'}">
			                                            		<button type="button" class="btn btn-flat btn-info btn-xs mb-3"  onclick="set_cancel_target('${cancel_list.receipt_id}', '${cancel_list.purchase_date}');">취소승인</button>
			                                            	
			                                            		<!-- span class="badge badge-pill badge-warning">취소승인 대기중</span-->
			                                            		<!-- button type="button" class="btn btn-flat btn-info btn-xs mb-3"  data-toggle="modal" data-target="#open_order_cancel_modal" onclick="set_cancel_target('1');">취소승인</button-->
			                                            	</c:when>	                                            	
			                                            	
			                                            	<c:otherwise>
				                                            	${cancel_list.canceled_date}
														    </c:otherwise>
														    </c:choose>
   		                                                </td>
	  	                                                <!-- td><span class="badge badge-pill badge-warning">취소대기중</span></td>	
		                                                <td><button type="button" class="btn btn-flat btn-info btn-xs mb-3"  data-toggle="modal" data-target="#open_order_cancel_modal" onclick="set_cancel_target('1');">취소승인</button></td>
	  	                                                <td>-</td-->
		                                            </tr>
												</c:forEach>



	                                        </tbody>
                                        </table>
                                    </div>
                                </div>
                                
                                <br/>
                                
                                	<!-- 페이징 처리 -->
                                	<c:set var="is_last_page_navi" value="0" />

                                	<div style="float:right; margin-right:120px;">
		                                <nav aria-label="Page navigation example">
		                                    <ul class="pagination">
		                                      	<c:choose>
												    <c:when test="${page < 11}">
			                                	    </c:when>
	
												    <c:otherwise>
				                                        <li class="page-item">
				                                            <a class="page-link" href="/cancel_order_manage?start_date=${start_date}&end_date=${end_date}&page=${pageStartPointCalcul - 1}" aria-label="Previous">
				                                                <span aria-hidden="true">&laquo;</span>
				                                                <span class="sr-only">Previous</span>
				                                            </a>
				                                        </li>
		                                            </c:otherwise>
												</c:choose>				

		                                        <c:forEach var="page_counter" begin="${pageStartPointCalcul + 0}" end="${pageEndPointCalcul + 0}" step="1">
  	                                                <c:choose>



													    <c:when test="${page_counter eq page}">
				                                	        <li class="page-item active"><a class="page-link" href="/cancel_order_manage?start_date=${start_date}&end_date=${end_date}&page=${page_counter}">${page_counter}</a></li>
													    </c:when>
													    
													    <c:when test="${page_counter gt total_count}">
				                                	    	<c:set var="is_last_page_navi" value="1" />
													    </c:when>
	
													    <c:otherwise>
				                                	        <li class="page-item"><a class="page-link" href="/cancel_order_manage?start_date=${start_date}&end_date=${end_date}&page=${page_counter}">${page_counter}</a></li>
													    </c:otherwise>
													</c:choose>					
												</c:forEach>
												
												<c:choose>
													    <c:when test="${is_last_page_navi eq '1'}">
				                                	        
													    </c:when>
	
													    <c:otherwise>
					                                        <li class="page-item">
					                                            <a class="page-link" href="/cancel_order_manage?start_date=${start_date}&end_date=${end_date}&page=${pageEndPointCalcul + 1}" aria-label="Next">
					                                                <span aria-hidden="true">&raquo;</span>
					                                                <span class="sr-only">Next</span>
					                                            </a>
					                                        </li>													    
					                                    </c:otherwise>
												</c:choose>
		                                                                                

		                                    </ul>
		                                </nav>
	                                </div>
	                                <!-- 페이징 처리 끝-->
	                                
	                                
	                                
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
    
    function set_cancel_target(r_id, p_date){
    	//CANCEL_TARGET = tar;
    	//alert(CANCEL_TARGET);
        $.ajax({
            url: "/cancel_order_accept",
            type: "post",
            data: {
                "receipt_id": r_id,
                "purchaseDate": p_date
                
                //"user_pw" : document.getElementById("exampleInputPassword1").value
            },
            dataType: "json",
            error: function(xhr, ajaxOptions, thrownError){

            },
            success: function(data){
                if(data.result == 'success') {
                	alert("주문취소요청이 승인되었습니다.");
                	location.href="/cancel_order_manage";
                
                }else{
                	alert("서버 응답이 올바르지 않습니다. 다시 로그인 해주세요.");	  
                	location.href="/";
                }
            }
        });
        
        
    }
    
    function reload_page(){
    	if($("#start_day").val().replace("-","") > $("#end_day").val().replace("-","")){
    		alert("검색 시작일이 종료일보다 이전이어야 합니다.");
    		return;
    	}
    	location.href="/cancel_order_manage?start_date="+$("#start_day").val()+"&end_date="+$("#end_day").val();
    }
    //$('#modal_rfcard_regist').modal('hide');

    
    </script>
</body>

</html>
