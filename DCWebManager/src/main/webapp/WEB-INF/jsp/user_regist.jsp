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
    <!-- amchart css -->
    <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
    <!-- others css -->
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
                            <h4 class="page-title pull-left">사용자 등록</h4>
                            <ul class="breadcrumbs pull-left">
                                <li><a href="/">사용자 관리</a></li>
                                <li><span>사용자 등록</span></li>
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
           				<!-- 사용자 등록정보 입력 -->
            			<div class="row">
                            <!-- Textual inputs start -->
                            <div class="col-3 mt-5">
                            </div>
                            <div class="col-6 mt-5">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="header-title">사용자 등록</h4>
                                         <button type="button" id="rfcard_regist_modal_open_button" class="btn btn-info btn-lg btn-block" data-toggle="modal" data-target="#modal_rfcard_regist" onclick="rfcard_register_modal_open();">RF Card 등록하기</button>
										<!-- Button trigger modal -->
                            		    <!-- button type="button" class="btn btn-primary btn-flat btn-lg mt-3" data-toggle="modal" data-target="#exampleModalCenter">Launch demo modal</button-->
		                                <!-- Modal -->
		                                <div class="modal fade" id="modal_rfcard_regist">
		                                    <div class="modal-dialog modal-dialog-centered" role="document">
		                                        <div class="modal-content">
		                                            <div id="modal-header" class="modal-header">
		                                                <h5 class="modal-title">RF Card 등록</h5>
		                                                <!-- button type="button" class="close" data-dismiss="modal" onclick="rfcard_register_modal_close();"><span>&times;</span></button-->
		                                            </div>
		                                            <div class="modal-body">
		                                                <center>
			                                          	
			                                                <h3 style="color:gray;">지금 단말기에 카드를 대주세요 자동으로 입력 됩니다.</h3>
			                                                <br/>
			                                                <br/>
			                                                <b><p id="rfcard_regist_field_tmp" style="color:red;"></p></b>
			                                            </center>
														
		                                            </div>
		                                            <div class="modal-footer">
			                                            <button type="button" class="btn btn-primary" onclick="rfcard_register_modal_save();">Save changes</button>
		                                                <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="rfcard_register_modal_close();">Close</button>
		                                                
		                                            </div>
		                                        </div>
		                                    </div>
		                                </div>

                                         <br/>
					                     <div class="form-group">
					                         <label for="example-text-input">RFCard ID</label>
					                         <input class="form-control" type="text" id="rfcard_id" disabled>
					                     </div>
					                     <!-- div class="form-group">
					                         <label for="example-text-input">회사명</label>
					                         <input class="form-control" type="text" id="company_name">
					                     </div-->
					                     
                                        <div class="form-group">
                                            <label class="col-form-label">회사명</label>
                                            <select class="custom-select" id="company_name">
                                                <option selected="selected" value="DigiCAP">DigiCAP</option>
                                                <option value="Covision">Covision</option>
                                            </select>
                                        </div>
                                        					                     
					                     <div class="form-group">
					                         <label for="example-text-input">이름</label>
					                         <input class="form-control" type="text" id="user_name">
					                     </div>
					                     <div class="form-group">
					                         <label for="example-text-input">이메일</label>
					                         <input class="form-control" type="text" id="user_email">
					                     </div>                                           
										<button type="button" id="package_regist_button" class="btn btn-primary btn-lg btn-block" onclick="">사용자 등록</button>

                                    </div>
                                </div>
                            </div>
                            <!-- Textual inputs end -->    
                            <div class="col-3 mt-5">
                            </div>  
                       </div>
                       <!-- 패키지 정보 입력 row 끝 -->
                       
                       <br/>
                       <br/>            
                       <br/>
                       <br/>            
                       <br/>
                       <br/>            






            
        </div>
        <!-- main content area end -->
        <!-- footer area start-->
     	<jsp:include page="inc/inc_footer.jsp" />
        
        <!-- footer area end-->
    </div>
    <!-- page container area end -->
    <!-- offset area start -->
    <div class="offset-area">
        <div class="offset-close"><i class="ti-close"></i></div>
        <ul class="nav offset-menu-tab">
            <li><a class="active" data-toggle="tab" href="#activity">Activity</a></li>
            <li><a data-toggle="tab" href="#settings">Settings</a></li>
        </ul>
        <div class="offset-content tab-content">
            <div id="activity" class="tab-pane fade in show active">
                <div class="recent-activity">
                    <div class="timeline-task">
                        <div class="icon bg1">
                            <i class="fa fa-envelope"></i>
                        </div>
                        <div class="tm-title">
                            <h4>Rashed sent you an email</h4>
                            <span class="time"><i class="ti-time"></i>09:35</span>
                        </div>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Esse distinctio itaque at.
                        </p>
                    </div>
                    <div class="timeline-task">
                        <div class="icon bg2">
                            <i class="fa fa-check"></i>
                        </div>
                        <div class="tm-title">
                            <h4>Added</h4>
                            <span class="time"><i class="ti-time"></i>7 Minutes Ago</span>
                        </div>
                        <p>Lorem ipsum dolor sit amet consectetur.
                        </p>
                    </div>
                    <div class="timeline-task">
                        <div class="icon bg2">
                            <i class="fa fa-exclamation-triangle"></i>
                        </div>
                        <div class="tm-title">
                            <h4>You missed you Password!</h4>
                            <span class="time"><i class="ti-time"></i>09:20 Am</span>
                        </div>
                    </div>
                    <div class="timeline-task">
                        <div class="icon bg3">
                            <i class="fa fa-bomb"></i>
                        </div>
                        <div class="tm-title">
                            <h4>Member waiting for you Attention</h4>
                            <span class="time"><i class="ti-time"></i>09:35</span>
                        </div>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Esse distinctio itaque at.
                        </p>
                    </div>
                    <div class="timeline-task">
                        <div class="icon bg3">
                            <i class="ti-signal"></i>
                        </div>
                        <div class="tm-title">
                            <h4>You Added Kaji Patha few minutes ago</h4>
                            <span class="time"><i class="ti-time"></i>01 minutes ago</span>
                        </div>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Esse distinctio itaque at.
                        </p>
                    </div>
                    <div class="timeline-task">
                        <div class="icon bg1">
                            <i class="fa fa-envelope"></i>
                        </div>
                        <div class="tm-title">
                            <h4>Ratul Hamba sent you an email</h4>
                            <span class="time"><i class="ti-time"></i>09:35</span>
                        </div>
                        <p>Hello sir , where are you, i am egerly waiting for you.
                        </p>
                    </div>
                    <div class="timeline-task">
                        <div class="icon bg2">
                            <i class="fa fa-exclamation-triangle"></i>
                        </div>
                        <div class="tm-title">
                            <h4>Rashed sent you an email</h4>
                            <span class="time"><i class="ti-time"></i>09:35</span>
                        </div>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Esse distinctio itaque at.
                        </p>
                    </div>
                    <div class="timeline-task">
                        <div class="icon bg2">
                            <i class="fa fa-exclamation-triangle"></i>
                        </div>
                        <div class="tm-title">
                            <h4>Rashed sent you an email</h4>
                            <span class="time"><i class="ti-time"></i>09:35</span>
                        </div>
                    </div>
                    <div class="timeline-task">
                        <div class="icon bg3">
                            <i class="fa fa-bomb"></i>
                        </div>
                        <div class="tm-title">
                            <h4>Rashed sent you an email</h4>
                            <span class="time"><i class="ti-time"></i>09:35</span>
                        </div>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Esse distinctio itaque at.
                        </p>
                    </div>
                    <div class="timeline-task">
                        <div class="icon bg3">
                            <i class="ti-signal"></i>
                        </div>
                        <div class="tm-title">
                            <h4>Rashed sent you an email</h4>
                            <span class="time"><i class="ti-time"></i>09:35</span>
                        </div>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Esse distinctio itaque at.
                        </p>
                    </div>
                </div>
            </div>
            <div id="settings" class="tab-pane fade">
                <div class="offset-settings">
                    <h4>General Settings</h4>
                    <div class="settings-list">
                        <div class="s-settings">
                            <div class="s-sw-title">
                                <h5>Notifications</h5>
                                <div class="s-swtich">
                                    <input type="checkbox" id="switch1" />
                                    <label for="switch1">Toggle</label>
                                </div>
                            </div>
                            <p>Keep it 'On' When you want to get all the notification.</p>
                        </div>
                        <div class="s-settings">
                            <div class="s-sw-title">
                                <h5>Show recent activity</h5>
                                <div class="s-swtich">
                                    <input type="checkbox" id="switch2" />
                                    <label for="switch2">Toggle</label>
                                </div>
                            </div>
                            <p>The for attribute is necessary to bind our custom checkbox with the input.</p>
                        </div>
                        <div class="s-settings">
                            <div class="s-sw-title">
                                <h5>Show your emails</h5>
                                <div class="s-swtich">
                                    <input type="checkbox" id="switch3" />
                                    <label for="switch3">Toggle</label>
                                </div>
                            </div>
                            <p>Show email so that easily find you.</p>
                        </div>
                        <div class="s-settings">
                            <div class="s-sw-title">
                                <h5>Show Task statistics</h5>
                                <div class="s-swtich">
                                    <input type="checkbox" id="switch4" />
                                    <label for="switch4">Toggle</label>
                                </div>
                            </div>
                            <p>The for attribute is necessary to bind our custom checkbox with the input.</p>
                        </div>
                        <div class="s-settings">
                            <div class="s-sw-title">
                                <h5>Notifications</h5>
                                <div class="s-swtich">
                                    <input type="checkbox" id="switch5" />
                                    <label for="switch5">Toggle</label>
                                </div>
                            </div>
                            <p>Use checkboxes when looking for yes or no answers.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
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

    <!-- start chart js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
    <!-- start highcharts js -->
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <!-- start zingchart js -->
    <script src="https://cdn.zingchart.com/zingchart.min.js"></script>
    <script>
    zingchart.MODULESDIR = "https://cdn.zingchart.com/modules/";
    ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9", "ee6b7db5b51705a13dc2339db3edaf6d"];
    </script>
    <!-- all line chart activation -->
    <script src="assets/js/line-chart.js"></script>
    <!-- all bar chart activation -->
    <script src="assets/js/bar-chart.js"></script>
    <!-- all pie chart -->
    <script src="assets/js/pie-chart.js"></script>
    <!-- others plugins -->
    <script src="assets/js/plugins.js"></script>
    <script src="assets/js/scripts.js"></script>
    
    <script>
    var RFCARD_ID_TMP = "";
    var IS_RFCARD_REGISTER_MODAL_OPEN = false;
    //$('#modal_rfcard_regist').modal({backdrop: 'static'});

    $(document).keydown(function(objEvent) { 
    	if(IS_RFCARD_REGISTER_MODAL_OPEN){
    		RFCARD_ID_TMP = RFCARD_ID_TMP + "";
            if (objEvent.keyCode == 13) {
            	//alert("입력됐습니다.");
            	//IS_RFCARD_REGISTER_MODAL_OPEN = false;
            	$("#rfcard_regist_field_tmp").html(RFCARD_ID_TMP);
            	RFCARD_ID_TMP = "";
            	return;
            } 
            RFCARD_ID_TMP = RFCARD_ID_TMP + String.fromCharCode(objEvent.keyCode);
            
    	}
    	

    })
    
       
    
    function rfcard_register_modal_open(){
    	IS_RFCARD_REGISTER_MODAL_OPEN = true;
    	$('#rfcard_regist_modal_open_button').blur();
    	RFCARD_ID_TMP = "";
    	$("#rfcard_regist_field_tmp").html("");


    }
    function rfcard_register_modal_close(){
    	IS_RFCARD_REGISTER_MODAL_OPEN = false;

    }
    function rfcard_register_modal_save(){
    	//alert("모달 세이브");
    	IS_RFCARD_REGISTER_MODAL_OPEN = false;
    	$('#modal_rfcard_regist').modal('hide');
    	rfcard_register_modal_close();
    	$("#rfcard_id").val($("#rfcard_regist_field_tmp").html());
    	//document.getElementById("rfcard_id").value();

    }
    

    function package_regist_request(){
        $.ajax({
            url: "/package_regist",
            type: "post",
            data: {
                "name": document.getElementById("package_name").value,
                "description": document.getElementById("package_description").value,
                "envType": document.getElementById("package_envType").value,
                "pkgType": document.getElementById("package_pkgType").value
                
                //"user_pw" : document.getElementById("exampleInputPassword1").value
            },
            dataType: "json",
            error: function(xhr, ajaxOptions, thrownError){

            },
            success: function(data){
                if(data.result == 'success') {
  					//alert("로그인 성공 : " + data.result_code);
  					//location.href="/";
  					IS_PACKAGE_REGIST_COMPLETE = true;
                	alert("패키지 등록에 성공하였습니다. 컴포넌트를 입력해주세요. ");	
                	create_component();
                	lock_packaging_form();
                
                }else{
                	alert("패키지 등록 실패");	                	
                }
            }
        });
  	}
    
    function create_component(){
    	if(IS_PACKAGE_REGIST_COMPLETE == false){
    		alert("패키지 등록을 먼저해주세요.");
    		return;
    	}
    	 $("#dynamic_component_area").append("<div id='component_id"+COMPONENT_FORM_ID_FOR_DELETE+"'><form name='component_frm'><div class='form-group'> <label for='example-text-input'>pkgIdRef</label><input class='form-control' type='text' id='pkgIdRef' name='com_pkgIdRef'></div><div class='form-group'><label for='example-text-input'>name</label><input class='form-control' type='text' id='com_name' name='com_name'></div><div class='form-group'><label for='example-text-input'>description</label><input class='form-control' type='text' id='com_description' name='com_description'></div><div class='form-group'><label for='example-text-input'>version</label><input class='form-control' type='text' id='com_version' name='com_version'></div>  					                            <div class='form-group'><label for='example-text-input'>availableVersion</label><input class='form-control' type='text' id='com_availableVersion' name='com_availableVersion'></div>					                        <div class='form-group'><label for='example-text-input'>state</label><input class='form-control' type='text' id='com_state' name='com_state'></div><div class='form-group'><label for='example-text-input'>size</label><input class='form-control' type='text' id='com_size' name='com_size'></div>						                        <div class='form-group'><label for='example-text-input'>installedLocation</label><input class='form-control' type='text' id='com_installedLocation' name='com_installedLocation'></div>									                        <div class='form-group'><label for='example-text-input'>componentType</label><input class='form-control' type='text' id='com_componentType' name='com_componentType'></div>    <button type='button' class='btn btn-danger btn-lg btn-block' onclick='delete_component("+COMPONENT_FORM_ID_FOR_DELETE+");'>이 컴포넌트 삭제</button><hr></form></div>    ");

    	 
    	 //$(document).on("click","#component_id" + c_id, function(){ 
    	//	 delete_component(c_id);
    	// });
    	 
    	 COMPONENT_FORM_ID_FOR_DELETE++;
    }
    
    function delete_component(c_id){
    	$('#component_id' + c_id).remove();
    }
    
    function regist_component(){
    	var form_total_num = $("form[name=component_frm]").length;
    	for(var i = 0; i < form_total_num; i++){
    		alert($("input[name=com_pkgIdRef]")[i].value + " 그리고 " + 
    				$("input[name=com_name]")[i].value + " 그리고 " + 
    				$("input[name=com_description]")[i].value + " 그리고 " + 
    				$("input[name=com_version]")[i].value + " 그리고 " + 
    				$("input[name=com_availableVersion]")[i].value + " 그리고 " + 
    				$("input[name=com_state]")[i].value + " 그리고 " + 
    				$("input[name=com_size]")[i].value + " 그리고 " + 
    				$("input[name=com_installedLocation]")[i].value + " 그리고 " +
    				$("input[name=com_componentType]")[i].value + " 끝 ");
    	}
    	//이부분에서 재귀적으로 콤포넌트 갯수만큼 ajax 호출하자
    	
    }
    
    function lock_packaging_form(){
    	document.getElementById('package_name').disabled = true;
    	document.getElementById('package_description').disabled = true;
    	document.getElementById('package_envType').disabled = true;
    	document.getElementById('package_pkgType').disabled = true;
    	document.getElementById('package_regist_button').disabled = true;    
    }
    
    function unlock_packaging_form(){
    	document.getElementById('package_name').disabled = false;
    	document.getElementById('package_description').disabled = false;
    	document.getElementById('package_envType').disabled = false;
    	document.getElementById('package_pkgType').disabled = false;
    	document.getElementById('package_regist_button').disabled = false;    	
    }
    </script>
</body>

</html>
