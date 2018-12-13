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
    
    
      <style>
		ul{
		   list-style:none;
		   
		}
		.moving_item{
			color: black;
			font-size: 12px;
			border: 1px solid gray;
			padding : 10px;
			margin : 3px;
			background-color:white;
		}
		.moving_item:hover{
			color: black;
			font-size: 12px;
			background-color:#ECE0F8;
			border: 0px solid gray;
			padding : 10px;
			margin : 3px;
		}
		
		
		.item_input:focus{
			background-color: #333942;
			color: white;
		}
		
		
		.header_item{
			font-weight: bold;
			background-color: #fff;
			color:black; 
			border:0px solid white;
			text-align:center;
				font-size: 12px;
		}

  </style>
    
    
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
                            <h4 class="page-title pull-left">카테고리/메뉴 관리</h4>
                            <ul class="breadcrumbs pull-left">
                                <li><a href="/">카페 관리</a></li>
                                <li><span>카테고리/메뉴 관리</span></li>
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
                            <h4 class="header-title mb-0">카테고리/메뉴 관리</h4>
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
									<button type="button" class="btn btn-flat btn-info mb-3" data-toggle="modal" data-target="#modal_category_info_create">카테고리 추가</button>
									<button type="button" class="btn btn-flat btn-info mb-3" data-toggle="modal" data-target="#modal_category_info_modify">카테고리 수정</button>
									
									<c:forEach items="${cate_list}" var="cate_list" varStatus="status">	
									<div id="category" class="according accordion-s2">
	                                    <div class="card">
	                                        <div class="card-header">
	                                            <a class="card-link collapsed" data-toggle="collapse" href="#accordion${cate_list.code}">${cate_list.name}</a>
	                                        </div>
	                                        <div id="accordion${cate_list.code}" class="collapse" data-parent="#category">
	                                            <div class="card-body">
		                                            <button type="button" class="btn btn-flat btn-info btn-xs mb-3" onclick="select_create_menu_terget_cate('${cate_list.code}');" data-toggle="modal" data-target="#modal_menu_info_create">메뉴 추가</button>
	                                            	<!-- button type="button" class="btn btn-flat btn-info mb-3" data-toggle="modal" data-target="#modal_menu_info_modify" >메뉴 수정</button-->
	                                            	
	                                            	
	                                            	<button type="button" class="btn btn-flat btn-info btn-xs mb-3" data-toggle="modal" data-target="#modal_menu_info_modify${cate_list.code}">메뉴 수정</button>
											                                
													<div class="single-table">
					                                    <div class="table-responsive">

					                                        <table class="table text-center">
																<thead class="bg-light text-capitalize">
						                                            <tr>
						                                                <th scope="col">제품명(국문)</th>
						                                                <th scope="col">제품명(영문)</th>
						                                                <th scope="col">판매가격</th>
						                                                <th scope="col">디지캡 할인가</th>
						                                                <th scope="col">코비젼 할인가</th>
						                                                <th scope="col">사이즈</th>						                                                
						                                                <th scope="col">음료타입</th>
						                                                <th scope="col">편집</th>
						                                                
						                                            </tr>
						                                        </thead>
						                                        <tbody>
						                                        <c:forEach items="${menu_list}" var="menu_list" varStatus="status">
						                                          	<c:choose>
																	    <c:when test="${cate_list.code eq menu_list.category}">
								                                            <tr>
								                                                <th scope="row">${menu_list.name_kr}</th>
								                                                <td>${menu_list.name_en}</td>
								                                                <td>${menu_list.price}</td>
								                                                <td>${menu_list.dc_digicap}</td>
		   						                                                <td>${menu_list.dc_covision}</td>
		   						                                                <td>${menu_list.size}</td>
		  						                                                <td>${menu_list.type}</td>
								                                                <td>
								                                                	<button type="button" class="btn btn-flat btn-danger btn-xs mb-3" onclick="select_delete_menu_target('${cate_list.code}', '${menu_list.code}');" data-toggle="modal" data-target="#modal_menu_info_delete">삭제</button>
								                                                </td>
								                                            </tr>
																	    </c:when>
					
																	    <c:otherwise>
																	    </c:otherwise>
																	</c:choose>

						                                         </c:forEach>

						                                            
						                                            					
						                                        </tbody>
					                                        </table>
					                                    </div>
					                                </div>
	                                            	<!-- button type="button" class="btn btn-flat btn-danger mb-3"  data-toggle="modal" data-target="#modal_menu_info_modify" onclick="">이 카테고리 삭제</button-->
													<button type="button" class="btn btn-flat btn-danger btn-xs mb-3"  data-toggle="modal" onclick="select_delete_cate_target('${cate_list.code}');" data-target="#modal_category_info_delete">이 카테고리 삭제</button>

	                                            </div>
	                                        </div>
	                                    </div>
	                                    </div>
	                                    <br/>
	                                   
	                                    </c:forEach>
	                                    
	                                    
	                                    <!-- div class="card">
	                                        <div class="card-header">
	                                            <a class="collapsed card-link" data-toggle="collapse" href="#accordion22">Cookie</a>
	                                        </div>
	                                        <div id="accordion22" class="collapse" data-parent="#category">
	                                            <div class="card-body">
	                                                Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nemo eaque porro alias assumenda accusamus incidunt odio molestiae maxime quo atque in et quaerat, vel unde aliquam aperiam quidem consectetur omnis dicta officiis? Dolorum, error dolorem!
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <div class="card">
	                                        <div class="card-header">
	                                            <a class="collapsed card-link" data-toggle="collapse" href="#accordion23">Tea</a>
	                                        </div>
	                                        <div id="accordion23" class="collapse" data-parent="#category">
	                                            <div class="card-body">
	                                                Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nemo eaque porro alias assumenda accusamus incidunt odio molestiae maxime quo atque in et quaerat, vel unde aliquam aperiam quidem consectetur omnis dicta officiis? Dolorum, error dolorem!
	                                            </div>
	                                        </div>
	                                    </div-->
	                                </div>
									<br>
									<br>
									<br>
									<br>
									<br>
									<br>
									<br>
									<br>
									
									
	                            </div>
	                        </div>
	                    </div>
	                    <!-- data table end -->
                    </div>
                </div>
                <!-- visitor graph area end -->

            </div>
            
            
            
										<!-- 
										
											- 라우팅 작업 시 유의사항 : 
											- jsp단에서 이 페이지를 컨트롤 할 때, 이하 모달의 갯수를 카테고리 갯수만큼 만든다
											- 모달의 id를 통해 카테고리 버튼과 매핑시킨다
											- 수정완료를 누러서 수정요청 데이터를 보낼 때는 데이터수집 함수에 item_list_in_a_catefory1 item_list_in_a_catefory2 와 같은 식으로 고유 클래스명을 보내준다..
											- 그럼 데이터수집 함수는 item_list_in_a_catefory{num}의 항목을 모두 받아 반복문을 돌며 데이터를 수집하여 정형화 한다.
											- 변경이 완료돼면 새로고침.
										
										 -->
						                <!-- 메뉴 수정 모달 시작 -->
						                <c:forEach items="${cate_list}" var="cate_list" varStatus="status">
		                                <div class="modal fade bd-example-modal-lg" id="modal_menu_info_modify${cate_list.code}">
		                                    <div class="modal-dialog modal-lg" role="document">
		                                        <div class="modal-content">
		                                            <div id="modal-header" class="modal-header">
		                                                <h5 class="modal-title">메뉴 정보 수정</h5>
		                                            </div>
		                                            <div class="modal-body">

														<!-- 제품 수정필드 목록이 들어가야 합니다. -->
														
														<div id="modal_alert" class="alert alert-primary" role="alert">
                                      				    	<strong>Information</strong> 항목을 드래그하여 순서를 변경 할 수 있습니다.
                                       					</div>
														<ul id="menu_sortable${cate_list.code}" class="item_list_in_a_catefory">
															<c:forEach items="${menu_list}" var="menu_list" varStatus="status">
															<c:choose>
																<c:when test="${cate_list.code eq menu_list.category}">
																	<li class="ui-state-default moving_item">
																		<i class="ti-arrows-vertical"></i>　
																		<input type="hidden" id="menu_code" value="${menu_list.code}"/>
																		<input type="text" id="menu_name_kr" class="item_input" value="${menu_list.name_kr}" size="8" onmouseover="alert_editor('제품명(국문)');"/>　
																		<input type="text" id="menu_name_en" class="item_input" value="${menu_list.name_en}" size="8" onmouseover="alert_editor('제품명(영문)');"/>　
																		<input type="text" id="menu_price" class="item_input" value="${menu_list.price}" size="8" onmouseover="alert_editor('제품가격');"/>　
																		<input type="text" id="menu_dc_digicap" class="item_input" value="${menu_list.dc_digicap}" size="8" onmouseover="alert_editor('디지캡 할인가격');"/>　
																		<input type="text" id="menu_dc_covision" class="item_input" value="${menu_list.dc_covision}" size="8" onmouseover="alert_editor('코비젼 할인가격');"/>　
												                        <select id="menu_size" class="item_input" onmouseover="alert_editor('사이즈 선택');">
												                        	<c:choose>
												                        		<c:when test="${menu_list.size eq 'REGULAR'}">
												                        			<option selected="selected" value="REGULAR">REGULAR</option>
												                        			<option value="SMALL">SMALL</option>
												                        		</c:when>
												                        		<c:otherwise>
												                        			<option value="REGULAR">REGULAR</option>
												                        			<option selected="selected" value="SMALL">SMALL</option>
												                        		</c:otherwise>
												                        		
												                        	</c:choose>

												                        </select>　
											                            <select id="menu_type" class="item_input" onmouseover="alert_editor('음료옵션 선택');">
											                            	<c:choose>
											                            		<c:when test="${menu_list.type eq 'HOT'}">
														                        	<option value="BOTH">BOTH</option>
														                        	<option value="ICED">ICED</option>
														                            <option selected="selected" value="HOT">HOT</option>											                            		
											                            		</c:when>
											                            		<c:when test="${menu_list.type eq 'ICED'}">
														                        	<option value="BOTH">BOTH</option>
														                        	<option selected="selected" value="ICED">ICED</option>
														                            <option value="HOT">HOT</option>	
											                            		</c:when>
											                            		<c:otherwise>
														                        	<option selected="selected" value="BOTH">BOTH</option>
														                        	<option value="ICED">ICED</option>
														                            <option value="HOT">HOT</option>
											                            		</c:otherwise>
											                            	</c:choose>
												                        </select>　
																	</li>
																</c:when>
																<c:otherwise>
																</c:otherwise>
															</c:choose>

															</c:forEach>
														  
														  
														  
															<!-- li class="ui-state-default moving_item">
																<i class="ti-arrows-vertical"></i>　
																<input type="text" class="item_input" value="라떼" size="8" onmouseover="alert_editor('제품명(국문)');"/>　
																<input type="text" class="item_input" value="Americano" size="8" onmouseover="alert_editor('제품명(영문)');"/>　
																<input type="text" class="item_input" value="2500" size="8" onmouseover="alert_editor('제품가격');"/>　
																<input type="text" class="item_input" value="1000" size="8" onmouseover="alert_editor('디지캡 할인가격');"/>　
																<input type="text" class="item_input" value="500" size="8" onmouseover="alert_editor('코비젼 할인가격');"/>　
										                        <select class="item_input" onmouseover="alert_editor('사이즈 선택');">
										                  	    	<option selected="selected" value="0">Regular</option>
										                        	<option value="1">Small</option>
										                        </select>　
									                            <select class="item_input" onmouseover="alert_editor('음료옵션 선택');">
										                        	<option selected="selected" value="2">Both</option>
										                        	<option value="1">Ice</option>
										                            <option value="0">Hot</option>
										                        </select>　
															</li>
															
															
															
															
															<li class="ui-state-default moving_item">
																<i class="ti-arrows-vertical"></i>　
																<input type="text" class="item_input" value="타로티" size="8" onmouseover="alert_editor('제품명(국문)');"/>　
																<input type="text" class="item_input" value="Americano" size="8" onmouseover="alert_editor('제품명(영문)');"/>　
																<input type="text" class="item_input" value="2500" size="8" onmouseover="alert_editor('제품가격');"/>　
																<input type="text" class="item_input" value="1000" size="8" onmouseover="alert_editor('디지캡 할인가격');"/>　
																<input type="text" class="item_input" value="500" size="8" onmouseover="alert_editor('코비젼 할인가격');"/>　
										                        <select class="item_input" onmouseover="alert_editor('사이즈 선택');">
										                  	    	<option selected="selected" value="0">Regular</option>
										                        	<option value="1">Small</option>
										                        </select>　
									                            <select class="item_input" onmouseover="alert_editor('음료옵션 선택');">
										                        	<option selected="selected" value="2">Both</option>
										                        	<option value="1">Ice</option>
										                            <option value="0">Hot</option>
										                        </select>　
															</li>															
															<li class="ui-state-default moving_item">
																<i class="ti-arrows-vertical"></i>　
																<input type="text" class="item_input" value="히비스커스" size="8" onmouseover="alert_editor('제품명(국문)');"/>　
																<input type="text" class="item_input" value="Americano" size="8" onmouseover="alert_editor('제품명(영문)');"/>　
																<input type="text" class="item_input" value="2500" size="8" onmouseover="alert_editor('제품가격');"/>　
																<input type="text" class="item_input" value="1000" size="8" onmouseover="alert_editor('디지캡 할인가격');"/>　
																<input type="text" class="item_input" value="500" size="8" onmouseover="alert_editor('코비젼 할인가격');"/>　
										                        <select class="item_input" onmouseover="alert_editor('사이즈 선택');">
										                  	    	<option selected="selected" value="0">Regular</option>
										                        	<option value="1">Small</option>
										                        </select>　
									                            <select class="item_input" onmouseover="alert_editor('음료옵션 선택');">
										                        	<option selected="selected" value="2">Both</option>
										                        	<option value="1">Ice</option>
										                            <option value="0">Hot</option>
										                        </select>　
															</li>
															<li class="ui-state-default moving_item">
																<i class="ti-arrows-vertical"></i>　
																<input type="text" class="item_input" value="아메리카노" size="8" onmouseover="alert_editor('제품명(국문)');"/>　
																<input type="text" class="item_input" value="Americano" size="8" onmouseover="alert_editor('제품명(영문)');"/>　
																<input type="text" class="item_input" value="2500" size="8" onmouseover="alert_editor('제품가격');"/>　
																<input type="text" class="item_input" value="1000" size="8" onmouseover="alert_editor('디지캡 할인가격');"/>　
																<input type="text" class="item_input" value="500" size="8" onmouseover="alert_editor('코비젼 할인가격');"/>　
										                        <select class="item_input" onmouseover="alert_editor('사이즈 선택');">
										                  	    	<option selected="selected" value="0">Regular</option>
										                        	<option value="1">Small</option>
										                        </select>　
									                            <select class="item_input" onmouseover="alert_editor('음료옵션 선택');">
										                        	<option selected="selected" value="2">Both</option>
										                        	<option value="1">Ice</option>
										                            <option value="0">Hot</option>
										                        </select>　
															</li>															
															<li class="ui-state-default moving_item">
																<i class="ti-arrows-vertical"></i>　
																<input type="text" class="item_input" value="아메리카노" size="8" onmouseover="alert_editor('제품명(국문)');"/>　
																<input type="text" class="item_input" value="Americano" size="8" onmouseover="alert_editor('제품명(영문)');"/>　
																<input type="text" class="item_input" value="2500" size="8" onmouseover="alert_editor('제품가격');"/>　
																<input type="text" class="item_input" value="1000" size="8" onmouseover="alert_editor('디지캡 할인가격');"/>　
																<input type="text" class="item_input" value="500" size="8" onmouseover="alert_editor('코비젼 할인가격');"/>　
										                        <select class="item_input" onmouseover="alert_editor('사이즈 선택');">
										                  	    	<option selected="selected" value="0">Regular</option>
										                        	<option value="1">Small</option>
										                        </select>　
									                            <select class="item_input" onmouseover="alert_editor('음료옵션 선택');">
										                        	<option selected="selected" value="2">Both</option>
										                        	<option value="1">Ice</option>
										                            <option value="0">Hot</option>
										                        </select>　
															</li-->																														
															
														</ul>
														<!-- 제품 수정필드 목록 끝 -->														
		                                            </div>
		                                            <div class="modal-footer">
			                                            <button type="button" class="btn btn-primary" onclick="sort_menu_save('${cate_list.code}');">수정내용 저장</button>
		                                                <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="">취소</button>
		                                                
		                                            </div>
		                                        </div>
		                                    </div>
		                                </div>
		                                </c:forEach>
		                                <!-- 메뉴 수정 모달 끝 -->
		                                
		                                
		                                
		                                
						                <!-- 카테고리 수정 모달 시작  -->     
		                                <div class="modal fade" id="modal_category_info_modify">
		                                    <div class="modal-dialog modal-dialog-centered" role="document">
		                                        <div class="modal-content">
		                                            <div id="modal-header" class="modal-header">
		                                                <h5 class="modal-title">카테고리 수정</h5>
		                                                <!-- button type="button" class="close" data-dismiss="modal" onclick="rfcard_register_modal_close();"><span>&times;</span></button-->
		                                            </div>
		                                            <div class="modal-body">

														<div class="alert alert-primary" role="alert">
                                      				    	<strong>Information</strong> 항목을 드래그하여 순서를 변경 할 수 있습니다.
                                       					</div>

														<ul id="cate_sortable" class="item_list_in_a_catefory">
														<c:forEach items="${cate_list}" var="cate_list" varStatus="status">
															<li class="ui-state-default moving_item">
																<i class="ti-arrows-vertical"></i>　
																<input id="cate_name" type="text" class="item_input" value="${cate_list.name}" size="12"/>
																<input id="cate_order" type="hidden" class="item_input" value="${cate_list.order}"/>
																<input id="cate_code" type="hidden" class="item_input" value="${cate_list.code}"/>
															</li>																											
	
														</c:forEach>																	
															<!-- li class="ui-state-default moving_item">
																<i class="ti-arrows-vertical"></i>　
																<input type="text" class="item_input" value="Cookie" size="12"/>
															</li>																			
															<li class="ui-state-default moving_item">
																<i class="ti-arrows-vertical"></i>　
																<input type="text" class="item_input" value="Drink" size="12"/>
															</li-->																
															
															
														</ul>


		                                            </div>
		                                            <div class="modal-footer">
			                                            <button type="button" onclick="sort_cate_save();" class="btn btn-primary">수정내용 저장</button>
		                                                <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="">Cancel</button>
		                                                
		                                            </div>
		                                        </div>
		                                    </div>
		                                </div>

						                <!-- 카테고리 수정 모달 끝 -->
						                
						                
						                
						                                
						                <!-- 메뉴 삭제 모달 시작 -->
		                                <div class="modal fade" id="modal_menu_info_delete">
		                                    <div class="modal-dialog modal-dialog-centered" role="document">
		                                        <div class="modal-content">
		                                            <div id="modal-header" class="modal-header">
		                                                <h5 class="modal-title">메뉴 삭제</h5>
		                                                <!-- button type="button" class="close" data-dismiss="modal" onclick="rfcard_register_modal_close();"><span>&times;</span></button-->
		                                            </div>
		                                            <div class="modal-body">
		                                                
														<h5>정말 해당 메뉴를 삭제하시겠습니까?</h5>
														<input class="form-control" type="hidden" id="delete_user_index" value="" />
		                                            </div>
		                                            <div class="modal-footer">
			                                            <button type="button" class="btn btn-primary" onclick="delete_menu();">OK</button>
		                                                <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="">Cancel</button>
		                                                
		                                            </div>
		                                        </div>
		                                    </div>
		                                </div>
		                                <!-- 메뉴 삭제 모달 끝 -->						                                

						                <!-- 카테고리 삭제 모달 시작 -->
		                                <div class="modal fade" id="modal_category_info_delete">
		                                    <div class="modal-dialog modal-dialog-centered" role="document">
		                                        <div class="modal-content">
		                                            <div id="modal-header" class="modal-header">
		                                                <h5 class="modal-title">카테고리 삭제</h5>
		                                                <!-- button type="button" class="close" data-dismiss="modal" onclick="rfcard_register_modal_close();"><span>&times;</span></button-->
		                                            </div>
		                                            <div class="modal-body">
		                                                
														<h5>정말 해당 카테고리를 삭제하시겠습니까? 카테고리를 삭제하면 이 카테고리에 속해있는 모든 메뉴도 자동 삭제됩니다.</h5>
														<input class="form-control" type="hidden" id="delete_user_index" value="" />
		                                            </div>
		                                            <div class="modal-footer">
			                                            <button type="button" class="btn btn-primary" onclick="delete_cate();">OK</button>
		                                                <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="">Cancel</button>
		                                                
		                                            </div>
		                                        </div>
		                                    </div>
		                                </div>
		                                <!-- 카테고리 삭제 모달 끝 -->


						                <!-- 메뉴 추가 모달 시작 -->
		                                <div class="modal fade" id="modal_menu_info_create">
		                                    <div class="modal-dialog modal-dialog-centered" role="document">
		                                        <div class="modal-content">
		                                            <div id="modal-header" class="modal-header">
		                                                <h5 class="modal-title">메뉴 추가</h5>
		                                                <!-- button type="button" class="close" data-dismiss="modal" onclick="rfcard_register_modal_close();"><span>&times;</span></button-->
		                                            </div>
		                                            <div class="modal-body">
																			<input class="form-control" type="hidden" id="create_menu_category_code" value="">
																			
							                                                <div class="form-group">
														                         <label for="example-text-input">제품명(국문)</label>
														                         <input class="form-control" type="text" id="create_menu_name_kr">
														                    </div>														                    
														                    
														                    <div class="form-group">
														                         <label for="example-text-input">제품명(영문)</label>
														                         <input class="form-control" type="text" id="create_menu_name_en">
														                    </div>
														                    
														                    <div class="form-group">
														                         <label for="example-text-input">가격</label>
														                         <input class="form-control" type="text" id="create_menu_price">
														                    </div>														                    

														                    <div class="form-group">
														                         <label for="example-text-input">디지캡 할인가</label>
														                         <input class="form-control" type="text" id="create_menu_dc_digicap">
														                    </div>														                    

														                    <div class="form-group">
														                         <label for="example-text-input">코비젼 할인가</label>
														                         <input class="form-control" type="text" id="create_menu_dc_covision">
														                    </div>														                    

														                    
							                                                <div class="form-group">
									                                        	<label class="col-form-label">사이즈 옵션</label>
										                                        <select class="custom-select" id="create_menu_size">
										                                            <option selected="selected" value="REGULAR">REGULAR</option>
										                                            <option value="SMALL">SMALL</option>
										                                        </select>
										                                    </div>														                    
														                    
							                                                <div class="form-group">
									                                        	<label class="col-form-label">음료 타입(Hot/Ice)</label>
										                                        <select class="custom-select" id="create_menu_type">
										                                            <option selected="selected" value="BOTH">BOTH</option>
										                                            <option value="ICED">ICED</option>
										                                            <option value="HOT">HOT</option>
										                                            
										                                        </select>
										                                    </div>			
														
		                                            </div>
		                                            <div class="modal-footer">
			                                            <button type="button" class="btn btn-primary" onclick="create_menu();">추가</button>
		                                                <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="">취소</button>
		                                                
		                                            </div>
		                                        </div>
		                                    </div>
		                                </div>
		                                <!-- 메뉴 추가 모달 끝 -->


						                <!-- 카테고리 추가 모달 시작 -->
		                                <div class="modal fade" id="modal_category_info_create">
		                                    <div class="modal-dialog modal-dialog-centered" role="document">
		                                        <div class="modal-content">
		                                            <div id="modal-header" class="modal-header">
		                                                <h5 class="modal-title">카테고리 추가</h5>
		                                                <!-- button type="button" class="close" data-dismiss="modal" onclick="rfcard_register_modal_close();"><span>&times;</span></button-->
		                                            </div>
		                                            <div class="modal-body">
												
																			
							                                                <div class="form-group">
														                         <label for="example-text-input">카테고리명</label>
														                         <input class="form-control" type="text" id="new_cate_name">
														                    </div>														                    
														                    		
														
		                                            </div>
		                                            <div class="modal-footer">
			                                            <button type="button" class="btn btn-primary" onclick="create_cate();">추가</button>
		                                                <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="">취소</button>
		                                                
		                                            </div>
		                                        </div>
		                                    </div>
		                                </div>
		                                <!-- 카테고리 추가 모달 끝 -->
						                                
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
		                                <!-- 회원정보 삭제 모달 끝 -->				
		                                
		      
		                <!-- footer area start-->
     	<jsp:include page="inc/inc_footer.jsp" />
        <!-- footer area end-->                          						                                
        </div>
        <!-- main content area end -->
  


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
    var DELETE_CATE_TARGET_CODE = "";
    var DELETE_MENU_TARGET_CODE = "";
    var DELETE_MENU_TARGET_CATEGORY = "";
    
    var CREATE_MENU_TARGET_CATEGORY = "";
    
    function select_delete_menu_target(ca, me){
    	DELETE_MENU_TARGET_CATEGORY = ca;
    	DELETE_MENU_TARGET_CODE = me;
    }
    
    function select_create_menu_terget_cate(ca){
    	CREATE_MENU_TARGET_CATEGORY = ca;
    }
    
    function select_delete_cate_target(t){
    	DELETE_CATE_TARGET_CODE = t;
    }

    function confirm_modify(){
    	$('#modal_user_info_modify').modal('hide');
    	$('#ok_modal').modal('show');
    }
    
    function confirm_delete(){
    	$("#delete_user_index").val();
    	$('#modal_user_info_delete').modal('hide');
    }
    
    function alert_editor(msg){
    	
    	$("#modal_alert").html(msg);
    }
    
    function sort_cate_save(){
    	//JSON 생성
    	var order_counter = 0;
    	var json_str = "[";
    	$('#cate_sortable li').each( function() {
    		json_str += "{";
    		
    		json_str += "\"name\" : \"";
    		json_str += $(this).children('#cate_name').val() + "\", ";
    		
    		json_str += "\"code\" : ";
    		json_str += $(this).children('#cate_code').val() + ", ";
    		
    		json_str += "\"order\" : ";
    		json_str += order_counter + "},";
    		
    		order_counter++;	
        });
    	json_str = json_str.slice(0,-1);	//맨뒤 콤마 자름
    	json_str += "]";
    	
    	//요청 처리
        $.ajax({
            url: "/modify_categories",
            type: "post",
            data: {
            	"categories" : json_str
            },
            dataType: "json",
            error: function(xhr, ajaxOptions, thrownError){
            },
            success: function(data){
            	if(data.result == "success"){
            		alert("카테고리 수정이 완료되었습니다.");
            		location.href="/menu_manage";
            	}
            	else
            		alert("카테고리 변경에 실패하였습니다.");
            }
        });
    }
    
    function delete_cate(){
    	
        $.ajax({
            url: "/delete_categories",
            type: "post",
            data: {
            	"cate_code" : DELETE_CATE_TARGET_CODE
            },
            dataType: "json",
            error: function(xhr, ajaxOptions, thrownError){
            },
            success: function(data){
            	if(data.result == "success"){
            		alert("카테고리 삭제가 완료되었습니다.");
            		location.href="/menu_manage";
            	}
            	else
            		alert("카테고리 삭제에 실패하였습니다.");
            }
        });
    }
    
    function create_cate(){
        $.ajax({
            url: "/create_categories",
            type: "post",
            data: {
            	"cate_name" : "{ \"name\" : \"" + $("#new_cate_name").val() + "\"}"
            },
            dataType: "json",
            error: function(xhr, ajaxOptions, thrownError){
            },
            success: function(data){
            	if(data.result == "success"){
            		alert("카테고리 추가가 완료되었습니다.");
            		location.href="/menu_manage";
            	}
            	else
            		alert("카테고리 추가에 실패하였습니다.");
            }
        });
    }
    
    function sort_menu_save(code){//code는 이 메뉴들의 category코드
    	//JSON 생성
    	var order_counter = 0;
    	var json_str = "[";
    	$('#menu_sortable'+code+' li').each( function() {
    		json_str += "{";
    		
    		json_str += "\"name_kr\" : \"";
    		json_str += $(this).children('#menu_name_kr').val() + "\", ";

    		json_str += "\"name_en\" : \"";
    		json_str += $(this).children('#menu_name_en').val() + "\", ";

    		json_str += "\"price\" : ";
    		json_str += $(this).children('#menu_price').val() + ", ";

    		json_str += "\"dc_digicap\" : ";
    		json_str += $(this).children('#menu_dc_digicap').val() + ", ";

    		json_str += "\"dc_covision\" : ";
    		json_str += $(this).children('#menu_dc_covision').val() + ", ";

    		json_str += "\"type\" : \"";
    		json_str += $(this).children('#menu_type').val() + "\", ";

    		json_str += "\"size\" : \"";
    		json_str += $(this).children('#menu_size').val() + "\", ";
    		
    		json_str += "\"code\" : ";
    		json_str += $(this).children('#menu_code').val() + ", ";
    		
    		json_str += "\"order\" : ";
    		json_str += order_counter + "},";
    		
    		order_counter++;	
        });
    	json_str = json_str.slice(0,-1);	//맨뒤 콤마 자름
    	json_str += "]";
    	//alert(json_str);
    	
    	//요청 처리
        $.ajax({
            url: "/modify_menus",
            type: "post",
            data: {
            	"menus" : json_str,
            	"code" : code + ""
            },
            dataType: "json",
            error: function(xhr, ajaxOptions, thrownError){
            },
            success: function(data){
            	if(data.result == "success"){
            		alert("메뉴 수정이 완료되었습니다.");
            		location.href="/menu_manage";
            	}
            	else
            		alert("메뉴 변경에 실패하였습니다.");
            }
        });
    	
    	
    }
    
    function delete_menu(){
    	
        $.ajax({
            url: "/delete_menus",
            type: "post",
            data: {
            	"menu_code" : DELETE_MENU_TARGET_CODE,
            	"cate_code" : DELETE_MENU_TARGET_CATEGORY//DELETE_CATE_TARGET_CODE
            },
            dataType: "json",
            error: function(xhr, ajaxOptions, thrownError){
            },
            success: function(data){
            	if(data.result == "success"){
            		alert("메뉴 삭제가 완료되었습니다.");
            		location.href="/menu_manage";
            	}
            	else
            		alert("메뉴 삭제에 실패하였습니다.");
            }
        });
    }
    
    function create_menu(){
    	var json_data = "{ \"category\" : " + CREATE_MENU_TARGET_CATEGORY + ", ";
    	json_data += "\"name_kr\" : \"" + $("#create_menu_name_kr").val() + "\",";
    	json_data += "\"name_en\" : \"" + $("#create_menu_name_en").val() + "\",";
    	json_data += "\"price\" : " + $("#create_menu_price").val() + ",";
    	json_data += "\"dc_digicap\" : " + $("#create_menu_dc_digicap").val() + ",";
    	json_data += "\"dc_covision\" : " + $("#create_menu_dc_covision").val() + ",";
    	json_data += "\"type\" : \"" + $("#create_menu_type").val() + "\",";
    	json_data += "\"size\" : \"" + $("#create_menu_size").val() + "\"}";
    	
    	
        $.ajax({
            url: "/create_menus",
            type: "post",
            data: {
            	"menu_data" : json_data
            },
            dataType: "json",
            error: function(xhr, ajaxOptions, thrownError){
            },
            success: function(data){
            	if(data.result == "success"){
            		alert("메뉴 추가가 완료되었습니다.");
            		location.href="/menu_manage";
            	}
            	else
            		alert("메뉴 추가에 실패하였습니다.");
            }
        });
    }
    
    
    //$('#modal_rfcard_regist').modal('hide');

    
    </script>
    
	  <script>
	  $( function() {
	    //$( "#sortable" ).sortable();
	    //$( "#sortable" ).disableSelection();
	    
	    $(".item_list_in_a_catefory").sortable();
	    $(".item_list_in_a_catefory").disableSelection();
	    
	  } );
	  </script>    
      <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  

        
        
</body>

</html>
