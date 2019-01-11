<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
        <div class="sidebar-menu">
            <div class="sidebar-header"><!--  style="background-color:#D0AB5C;" -->
                <div class="logo" >
	                <!-- p class="page-title pull-left" style="color:white; text-align:left;">D Cafe web Manager</p><a href="/"></a -->
	                <!-- img src="img/digicap_logo.png" style=""/--><!-- img src="assets/images/icon/logo.png" alt="logo"-->
	                <a href="#" style="color:white;font-size:17px;">DCCaffe<br/>Web Manager</a>
                </div>
            </div>
            <div class="main-menu">
                <div class="menu-inner">
                    <nav>
                        <ul class="metismenu" id="menu">
                       
                            <li class=" <c:if test="${page_name eq 'index'}">active</c:if>">
                                <a href="/" aria-expanded="true"><i class="ti-dashboard"></i><span>홈</span></a>
                                <!-- ul class="collapse">
                                    <li><a href="index.html">SEO dashboard</a></li>
                                    <li class="active"><a href="index2.html">Ecommerce dashboard</a></li>
                                    <li><a href="index3.html">ICO dashboard</a></li>
                                </ul-->
                            </li>
							<li class="<c:if test="${page_name == 'user_regist' || page_name == 'user_list'}">active</c:if>">
                                <a href="javascript:void(0)" aria-expanded="true"><i class="ti-user"></i><span>사용자 관리</span></a>
                                <ul class="collapse">
                                    <li class="<c:if test="${page_name eq 'user_regist'}">active</c:if>"><a href="user_regist">사용자 등록</a></li>
                                    <li class="<c:if test="${page_name eq 'user_list'}">active</c:if>"><a href="user_manage">사용자 수정/삭제</a></li>
                                </ul>
                            </li>                            
                            
							<li class="<c:if test="${page_name == 'menu_manage' || page_name == 'cancel_order_manage'}">active</c:if>">
                                <a href="javascript:void(0)" aria-expanded="true"><i class="ti-pencil-alt"></i><span>카페 관리</span></a>
                                <ul class="collapse">
                                    <li class="<c:if test="${page_name eq 'menu_manage'}">active</c:if>"><a href="menu_manage">카테고리/메뉴 관리</a></li>
                                    <li class="<c:if test="${page_name eq 'cancel_order_manage'}">active</c:if>"><a href="cancel_order_manage">주문취소 관리</a></li>                                    

                                </ul>
                            </li>


							<li class="<c:if test="${page_name == 'bill'}">active</c:if>">
                                <a href="javascript:void(0)" aria-expanded="true"><i class="ti-pie-chart"></i><span>카페 통계</span></a>
                                <ul class="collapse">
                                    <li class="<c:if test="${page_name eq 'bill'}">active</c:if>"><a href="bill">월말공제정산</a></li>
                                    <li class="<c:if test="${page_name eq 'customer_bill'}">active</c:if>"><a href="customer_bill">손님결제정산</a></li>
                                    <!--추후 개발 예정 li><a href="#">매출 통계</a></li-->
                                </ul>
                            </li>

							<!--추후 개발 예정 li>
                                <a href="#" aria-expanded="true"><i class="ti-key"></i><span>관리자 관리</span></a>
                                <ul class="collapse">
                                    <li><a href="#">사용자 등록</a></li>
                                    <li><a href="#">사용자 수정/삭제</a></li>
                                </ul>
                            </li-->
                            
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
