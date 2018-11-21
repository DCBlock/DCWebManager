<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
        <div class="sidebar-menu">
            <div class="sidebar-header">
                <div class="logo">
                    <a href="/"><img src="img/digicap_logo.png" style=""/><!-- img src="assets/images/icon/logo.png" alt="logo"--></a>
                </div>
            </div>
            <div class="main-menu">
                <div class="menu-inner">
                    <nav>
                        <ul class="metismenu" id="menu">
                            <li class="active">
                                <a href="/" aria-expanded="true"><i class="ti-dashboard"></i><span>홈</span></a>
                                <!-- ul class="collapse">
                                    <li><a href="index.html">SEO dashboard</a></li>
                                    <li class="active"><a href="index2.html">Ecommerce dashboard</a></li>
                                    <li><a href="index3.html">ICO dashboard</a></li>
                                </ul-->
                            </li>
                            

							<li>
                                <a href="javascript:void(0)" aria-expanded="true"><i class="ti-user"></i><span>사용자 관리</span></a>
                                <ul class="collapse">
                                    <li><a href="#">사용자 등록</a></li>
                                    <li><a href="#">사용자 수정/삭제</a></li>
                                </ul>
                            </li>                            
                            
							<li>
                                <a href="javascript:void(0)" aria-expanded="true"><i class="ti-pencil-alt"></i><span>카페 관리</span></a>
                                <ul class="collapse">
                                    <li><a href="#">카테고리/메뉴 관리</a></li>
                                    <li><a href="#">사용자 수정/삭제</a></li>
                                    <li><a href="#">취소주문 관리</a></li>                                    

                                </ul>
                            </li>


							<li>
                                <a href="javascript:void(0)" aria-expanded="true"><i class="ti-pie-chart"></i><span>카페 통계</span></a>
                                <ul class="collapse">
                                    <li><a href="#">월말 공제 정산</a></li>
                                    <li><a href="#">매출 통계</a></li>
                                </ul>
                            </li>

							<li>
                                <a href="#" aria-expanded="true"><i class="ti-key"></i><span>관리자 관리</span></a>
                                <!-- ul class="collapse">
                                    <li><a href="#">사용자 등록</a></li>
                                    <li><a href="#">사용자 수정/삭제</a></li>
                                </ul-->
                            </li>
                            
                        </ul>
                    </nav>
                </div>
            </div>
        </div>