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
                            <h4 class="page-title pull-left">월말공제정산</h4>
                            <ul class="breadcrumbs pull-left">
                                <li><a href="/">카페 통계</a></li>
                                <li><span>월말공제정산</span></li>
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
                            <h4 class="header-title mb-0">월말공제정산</h4>
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
									
										                                
	                                <!-- 테이블 샘플 -->
                                <div class="single-table">
                                    <div class="table-responsive">
                                        <table class="table text-center">
											<thead class="bg-light text-capitalize">
	                                            <tr>
	                                                <th scope="col">성명</th>
	                                                <th scope="col">회사명</th>
	                                                <th scope="col">이메일</th>
	                                                <th scope="col">총 구매가격</th>
	                                                <th scope="col">총 할인가격</th>
	                                                <th scope="col">정산 청구액</th>
	                                                <th scope="col">상세보기</th>
	                                            </tr>
	                                        </thead>
	                                        <tbody>
		                                        <c:forEach items="${bill_list}" var="bill_list" varStatus="status">
		                                            <tr>
		                                                <th scope="row">${bill_list.name}</th>
		                                                <td>${bill_list.company}</td>
		                                                <td>${bill_list.email}</td>
	  	                                                <td>${bill_list.total_price}</td>
		                                                <td>${bill_list.total_dc_price}</td>
	  	                                                <td>${bill_list.billing_amount}</td>
		                                                <td><button type="button" class="btn btn-flat btn-info btn-xs mb-3"  data-toggle="modal" data-target="#open_detail_modal" onclick="detail_user_info('${start_date}', '${end_date}', '${bill_list.user_record_index}','${bill_list.name}','${bill_list.total_price}','${bill_list.total_dc_price}');">상세보기</button></td>
		                                            </tr>
	                                            </c:forEach>




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
            
            
            
                                <div id="open_detail_modal" class="modal fade bd-example-modal-lg modal-xl">
                                    <div class="modal-dialog modal-lg modal-xl">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">상세내역 조회</h5>
                                                <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                                            </div>
                                            <div class="modal-body">
                                            	<div id="detail_data_area">
                                            		데이터를 불러오는 중입니다.
                                            	</div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            </div>
                                        </div>
                                    </div>
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
    
    function request_detail_bill(tar){
    	CANCEL_TARGET = tar;
    	alert(CANCEL_TARGET);
    }
    
    function reload_page(){
    	if($("#start_day").val().replace("-","") > $("#end_day").val().replace("-","")){
    		alert("검색 시작일이 종료일보다 이전이어야 합니다.");
    		return;
    	}
    	
    	location.href="/bill?start_date="+$("#start_day").val()+"&end_date="+$("#end_day").val();
    }
    
    
    function thousands_separators(num)
    {
      var num_parts = num.toString().split(".");
      num_parts[0] = num_parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
      return num_parts.join(".");
    }
    
    function convert_date(timestamp){
    	//var timestamp = 1293683278;
    	var date = new Date(timestamp*1000);

    	var year = date.getFullYear();
    	var month = date.getMonth() + 1;
    	var day = date.getDate();
    	var hours = date.getHours();
    	var minutes = date.getMinutes();
    	var seconds = date.getSeconds();
		//(year + "-" + month + "-" + day + " " + hours + ":" + minutes + ":" + seconds);

    	return year + "-" + month + "-" + day;
    }
    
    
    function detail_user_info(s_d, e_d, u_i, u_name, total_price, total_dc){
    	//start_date
    	//end_date
    	//user_index
    	$("#detail_data_area").html("데이터를 불러오는 중 입니다.");
    	


    	
        $.ajax({
            url: "/user_bill?start_date="+s_d+"&end_date="+e_d+"&user_index="+u_i,
            type: "get",
            data: {
                //"receipt_id": r_id,
                //"purchaseDate": p_date
                
                //"user_pw" : document.getElementById("exampleInputPassword1").value
            },
            dataType: "json",
            error: function(xhr, ajaxOptions, thrownError){

            },
            success: function(data){


            	var table_html = "<h4 class='header-title'>"+u_name+"</h4>";
        		table_html += "<p>총 구매금액 : "+thousands_separators(total_price)+"</p>";
            	table_html += "<p>총 할인금액 : "+thousands_separators(total_dc)+"</p>";    
            	
            	table_html += "<p>청구액 : "+thousands_separators(total_price.replace(",","") - total_dc.replace(",",""))+"</p>";    	
            	
            	
            	table_html += "<div class='single-table'>";
            	table_html += 	"<div class='table-responsive'>";
            	table_html +=		"<table class='table table-striped text-center'>";
            	table_html +=			"<thead class='text-uppercase'>";
           		table_html +=				"<th>날짜</th><th>구매일</th><th>취소일</th><th>영수ID</th><th>품목</th><th>가격</th><th>할인가</th><th>TYPE</th><th>SIZE</th><th>갯수</th><th>상태</th><th>타입</th>";
        		table_html +=			"</thead>";
        		table_html +=		    "<tbody>";		

            	for (var i = 0; i < data.purchases.length; i++){
            		//convert_date(data.purchases[i].cancel_date)
            		var can_d = "";
            		var sta = "";
            		var pur_type = "";
            		
            		if(data.purchases[i].cancel_date == 0)
            			can_d = "-";
            		else{
            			can_d = convert_date(data.purchases[i].cancel_date);
            		}
            		
            		if(data.purchases[i].receipt_status == 1){
            			sta = "<span class='badge badge-pill badge-warning'>취소승인 대기중</span>";
            		}
            		else if(data.purchases[i].receipt_status == 1){
            			sta = "<span class='badge badge-pill badge-success'>취소승인 완료</span>";
            		}
            		else{
            			sta = "-";
            		}
            		
					if(data.purchases[i].purchase_type == 0){
						pur_type = "<span class='badge badge-pill badge-success'>급여공제</span>";
					}            		
					else if(data.purchases[i].purchase_type == 1){
						pur_type = "<span class='badge badge-pill badge-warning'>손님구매</span>";
					}            		
					
            		
            	    //alert(data.purchases[i].menu_name_kr);
            	    table_html += "<tr>";
            	    table_html += 	"<th scope='row'>" + convert_date(data.purchases[i].date) + "</th><td>"+ convert_date(data.purchases[i].purchase_date) + "</td><td>" + can_d +"</td>";
            	    table_html += 	"<td>"+data.purchases[i].receipt_id+ "</td><td>"+data.purchases[i].menu_name_kr+"</td><td>"+thousands_separators(data.purchases[i].price)+"</td><td>"+thousands_separators(data.purchases[i].dc_price)+"</td><td>"+data.purchases[i].type+"</td><td>"+data.purchases[i].size+"</td><td>"+data.purchases[i].count+"</td><td>"+sta+"</td><td>"+pur_type+"</td>";
            	    table_html += "</tr>";
            	    
            	}

            	
            	table_html +=		  	"</tbody>";		
        		table_html +=		"</table>";		
        		table_html +=	"</div></div>";
        		
        		
            	
        		$("#detail_data_area").html(table_html);
        		
            	
            	
            }
        });
        
    }
    
    
    //$('#modal_rfcard_regist').modal('hide');

    
    </script>
</body>

</html>
