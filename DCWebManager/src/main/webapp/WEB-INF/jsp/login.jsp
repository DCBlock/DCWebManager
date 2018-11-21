<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Login - srtdash</title>
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
    <!-- login area start -->
    <div class="login-area login-s2">
        <div class="container">
        <br/>
            <div class="login-box ptb--100">
                <form>
                    <div class="login-form-head">
                        <img src="img/digicap_logo.png" style=""/>
                        <br/>
                        <br/>
                        <br/>
                        <p><b>D Cafe Web Manager</b>에 방문해주셔서 감사합니다.</p>
                        <p>관리자 계정을 입력해 주세요.</p>
                    </div>
                    <div class="login-form-body">
                        <div class="form-gp">
                            <label for="exampleInputEmail1">ID</label>
                            <input type="text" id="id">
                            <i class="ti-user"></i>
                        </div>
                        <div class="form-gp">
                            <label for="exampleInputPassword1">Password</label>
                            <input type="password" id="pw">
                            <i class="ti-lock"></i>
                        </div>
                        <div class="row mb-4 rmber-area">
                            <!-- div class="col-6">
                                <div class="custom-control custom-checkbox mr-sm-2">
                                    <input type="checkbox" class="custom-control-input" id="customControlAutosizing">
                                    <label class="custom-control-label" for="customControlAutosizing">Remember Me</label>
                                </div>
                            </div-->
                            <!-- div class="col-6 text-right">
                                <a href="#">Forgot Password?</a>
                            </div-->
                        </div>
                        <div class="submit-btn-area">
                            <button id="form_submit" type="button" onclick="login_req();">로그인 <i class="ti-arrow-right"></i></button>
                        </div>
                        <div class="form-footer text-center mt-5">
                            <!-- p class="text-muted">Don't have an account? <a href="register.html">Sign up</a></p-->
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- login area end -->

    <!-- jquery latest version -->
    <script src="assets/js/vendor/jquery-2.2.4.min.js"></script>
    <!-- bootstrap 4 js -->
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/owl.carousel.min.js"></script>
    <script src="assets/js/metisMenu.min.js"></script>
    <script src="assets/js/jquery.slimscroll.min.js"></script>
    <script src="assets/js/jquery.slicknav.min.js"></script>
    
    <!-- others plugins -->
    <script src="assets/js/plugins.js"></script>
    <script src="assets/js/scripts.js"></script>
    <script>
    function login_req(){
		$.ajax({
            url: "/login_request",
            type: "post",
            data: {
                "user_id": document.getElementById("id").value,
                "user_pw" : document.getElementById("pw").value
            },
            dataType: "json",
            error: function(xhr, ajaxOptions, thrownError){
            	/*
                $('.modal-login .form-global-error.cloaked > .message').text("오류가 발생했습니다. 다시 요청해 주세요.");
                $('.modal-login .form-global-error.cloaked').show();
                $('.modal-login .form-global-error.cloaked').css("opacity", 0);
                $('.modal-login .form-global-error.cloaked').animate({"opacity":1});
                */
            },
            success: function(data){
                if(data.result == 'success') {
					//alert("로그인 성공 : " + data.result_code);
					location.href="/";
                
                }else{
					alert("로그인에 실패하였습니다.");	                	
                }
            }
        });
	

	}    
    
    </script>
</body>

</html>