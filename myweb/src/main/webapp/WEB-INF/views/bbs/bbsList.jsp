<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
.box1{
	width:1000px;
	margin:auto;

}

table{
	margin:auto;
	margin-top:30px;
	text-align: center;
	width : 1000px;
	border-collapse: collapse;
}

th, td {
    border: 1px solid black; 
    padding: 10px; 
}

thead {
    background-color: #eee;
    font-weight: bold;
}

h1{
	text-align: center;
}

.title1{
	margin-top: 50px;
}

.bt-write{
	text-align:right; 
	margin-top:10px;
}
</style>

<body>
<section class="box1">
	<div class = "title1"><h1>자유 게시판</h1></div>
		<table id = "bbsTable">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성날짜</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>	

		<div class= "bt-write">
			<input type="button" value="글쓰기" onclick="location.href='bbsWrite'">
		</div>
</section>
</body>

<script>
	async function loadBbsList(){
		try {
			const table = document.getElementById("bbsTable").getElementsByTagName("tbody")[0];
			table.innerHTML = "";

			const res = await fetch("/myweb/api/bbsList");
			const result = await res.json();

			if(res.status === 200){
				for(const bbs of result.data){
					const row = table.insertRow();
					row.innerHTML =
					'<td>' + bbs.idx + '</td>'+
					'<td onclick="loadContent('+bbs.idx+')"><a href="#">' + bbs.title + '</td>' +
					'<td>' + bbs.writer + '</td>' +
					'<td>' + bbs.writedate + '</td>' +
					'<td>' + bbs.readnum + '</td>';
				}
			}else{
				alert(result.errorMsg);
			}
		} catch (error) {
			console.error(error);
			alert("에러:" + error.message)
		}
	}
	window.addEventListener("DOMContentLoaded",loadBbsList);


	async function loadContent(idx) {
		
		try {
			const url = "/myweb/api/bbsContent?idx=" + idx;
			const res = await fetch(url);
			const result = await res.json();

			if(res.status==200){
				location.href = '/myweb/bbsContent?idx=' + idx;
			}else{
				alert(result.errorMsg);
			}
		} catch (error) {
			console.error(error);
			alert("에러:"+error.message)
		}


	}



</script>

</html>