<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		'use strict';
		
		function fCheck() {
	    	let su1 = document.getElementById("su1").value.trim();
	    	let su2 = document.getElementById("su2").value.trim();
	    	let su3 = document.getElementById("su3").value.trim();
	    	let su4 = document.getElementById("su4").value.trim();
	    	let su5 = document.getElementById("su5").value.trim();
	    	
	    	if(!=isNaN(su1) || isNaN(su2) || isNaN(su3) || isNaN(su4) || isNaN(su5)) {
				alert("숫자를 입력하세요!!!");
	    	}
	    }
	</script>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>값 정렬</h2>
	<form name="myform" method="post" action="<%=request.getContextPath()%>/t0420/Test5Ok">
		<div>
			숫자 입력1 : <input type="number" name="su" id="su1" class="form-control" />
		</div>
		<div>
			숫자 입력2 : <input type="number" name="su" id="su2" class="form-control" />
		</div>
		<div>
			숫자 입력3 : <input type="number" name="su" id="su3" class="form-control" />
		</div>
		<div>
			숫자 입력4 : <input type="number" name="su" id="su4" class="form-control" />
		</div>
		<div>
			숫자 입력5 : <input type="number" name="su" id="su5" class="form-control" />
		</div>
		
		<div class="text-center">
	    	<input type="button" value="전송" onclick="fCheck()" class="btn btn-success mr-3"/>
	        <input type="reset" value="다시입력" class="btn btn-warning"/>
    	</div>
	</form>
</div>
<p><br/></p>
</body>
</html>