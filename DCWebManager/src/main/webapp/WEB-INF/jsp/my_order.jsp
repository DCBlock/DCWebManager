<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>DCCaffe Web Manager</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/png" href="assets/images/icon/favicon.ico">
    <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="/assets/css/themify-icons.css">
    <link rel="stylesheet" href="/assets/css/metisMenu.css">
    <link rel="stylesheet" href="/assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/assets/css/slicknav.min.css">
    <!-- amcharts css -->
    <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
    <!-- Start datatable css -->
    <!-- link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.18/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.jqueryui.min.css"-->
    <!-- style css -->
    <link rel="stylesheet" href="/assets/css/typography.css">
    <link rel="stylesheet" href="/assets/css/default-css.css">
    <link rel="stylesheet" href="/assets/css/styles.css">
    <link rel="stylesheet" href="/assets/css/responsive.css">
    <!-- modernizr css -->
    <script src="/assets/js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>
  	<div id="order_table">
  		데이터를 가공 중 입니다.
  	</div>
  
  
      <!-- offset area end -->
    <!-- jquery latest version -->
    <script src="/assets/js/vendor/jquery-2.2.4.min.js"></script>
    <!-- bootstrap 4 js -->
    <script src="/assets/js/popper.min.js"></script>
    <script src="/assets/js/bootstrap.min.js"></script>
    <script src="/assets/js/owl.carousel.min.js"></script>
    <script src="/assets/js/metisMenu.min.js"></script>
    <script src="/assets/js/jquery.slimscroll.min.js"></script>
    <script src="/assets/js/jquery.slicknav.min.js"></script>
    <!-- Start datatable js -->
    <!--  script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
    <script src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.18/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script-->    
    <!-- others plugins -->
    <script src="/assets/js/plugins.js"></script>
    <script src="/assets/js/scripts.js"></script>
    <script>
    function thousands_separators(num)
    {
      var num_parts = num.toString().split(".");
      num_parts[0] = num_parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
      return num_parts.join(".");
    }
    
    
    function detail_user_info(){
    	//start_date
    	//end_date
    	//user_index
    	//$("#detail_data_area").html("데이터를 불러오는 중 입니다.");
    	var result = '${token_info}':
		var data;
		if(result == "페이지가 유효하지 않습니다."){
			document.getElementById("order_table").innerHTML = result;
			return;
		}
		data = JSON.parse(result);
    	/*
    	      "code": 1,
		      "price": 3300,
		      "dc_price": 0,
		      "type": "HOT",
		      "size": "REGULAR",
		      "count": 5,
		      "menu_name_kr": "카라멜 마끼아또",
		      "purchase_type": 0
    	
    	*/
				//alert(data.name + ", " + data.total);
            	var table_html = "<h4 class='header-title'> "+data.name+"</h4>";
        		table_html += "<p> 총 구매금액 : "+thousands_separators(data.total)+"</p>";
            	table_html += "<p> 총 할인금액 : "+thousands_separators(data.dc_total)+"</p>";    
            	
            	table_html += "<p>청구액 : "+thousands_separators(data.total.toString().replace(",","") - data.dc_total.toString().replace(",",""))+"</p>";    	
            	
            	
            	table_html += "<div class='single-table'>";
            	table_html += 	"<div class='table-responsive'>";
            	table_html +=		"<table class='table table-striped text-center'>";
            	table_html +=			"<thead class='text-uppercase'>";
           		table_html +=				"<th>코드</th><th>가격</th><th>할인금액</th><th>청구액</th><th>음료타입</th><th>사이즈</th><th>갯수</th><th>메뉴명</th><th>구매타입</th>";
        		table_html +=			"</thead>";
        		table_html +=		    "<tbody>";		

            	for (var i = 0; i < data.purchases.length; i++){
            		//convert_date(data.purchases[i].cancel_date)
            		var can_d = "";
            		var sta = "";
            		var pur_type = "";
            		/*
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
            		*/
					if(data.purchases[i].purchase_type == 0){
						pur_type = "<span class='badge badge-pill badge-success'>급여공제</span>";
					}            		
					else if(data.purchases[i].purchase_type == 1){
						pur_type = "<span class='badge badge-pill badge-warning'>손님구매</span>";
					}            		
					
            		
            	    //alert(data.purchases[i].menu_name_kr);
            	    table_html += "<tr>";
            	    table_html += 	"<th scope='row'>" + data.purchases[i].code + "</th>";
            	    table_html += 	"<td>"+thousands_separators(data.purchases[i].price)+"</td><td>"+thousands_separators(data.purchases[i].dc_price)+"</td><td>"+thousands_separators(data.purchases[i].price - data.purchases[i].dc_price)+"</td><td>"+data.purchases[i].type+ "</td><td>"+data.purchases[i].size+"</td><td>"+data.purchases[i].count+"</td><td>"+data.purchases[i].menu_name_kr+"</td><td>"+pur_type+"</td>";
            	    table_html += "</tr>";
            	    
            	}

            	
            	table_html +=		  	"</tbody>";		
        		table_html +=		"</table>";		
        		table_html +=	"</div></div>";
        		
        		document.getElementById("order_table").innerHTML = table_html;
            	
        		//$("#order_table").html(table_html);
        		
            	
            
        
    }
    window.onload=detail_user_info;
    </script>
</body>

</html>
