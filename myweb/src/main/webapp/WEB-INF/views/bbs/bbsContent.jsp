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

th {
    background-color: #eee;
    font-weight: bold;
}

h1{
	text-align: center;
}

.title1{
	margin-top: 50px;
}

</style>
<body>
	<h1>자유게시판 글쓰기</h1>
	<form name="bbsContent"  id="bbsContent">
		<table id = "bbsContent-table">
			<tr>
				<th>번호</th>
				<td></td>
				<th>작성일</th>
				<td></td>
			</tr>

			<tr>
				<th>작성자</th>
				<td></td>
				<th>조회수</th>
				<td></td>
			</tr>

			<tr>
				<th>제목</th>
				<td colspan ="3"></td>
			</tr>

			<tr>
				<th height="250">
				<td colspan="4" align="left" valign="top"></td>
			</tr>
			<tr>
				<td colspan="4" align ="center"><a href = "bbsList">목록</a></td>
			</tr>
		</table>
	</form>
</body>





<script>
	async function bbsContent() {
		try {
			const getUrl = new URLSearchParams(window.location.search);
			const idx = getUrl.get("idx");

			if(!idx){
				alert("삭제된 게시물 입니다.")
				window.location.href="/myweb/bbsList";
				return
			}

			const res = await fetch("/myweb/api/bbsContent?idx="+idx);
			const result = await res.json();

			if(res.status==200){
				
				const bbs = result.data;
				const table = document.getElementById("bbsContent-table");
				
				table.rows[0].cells[1].innerText = bbs.idx;
				table.rows[0].cells[3].innerText = bbs.writedate; 
				table.rows[1].cells[1].innerText = bbs.writer;
				table.rows[1].cells[3].innerText = bbs.readnum;
				table.rows[2].cells[1].innerText = bbs.title;
				table.rows[3].cells[1].innerText = bbs.content;
				
			}else{
				alert(result.errorMsg);
				window.location.href = "/myweb/bbsList";
			}
		} catch (error) {
			console.error(error);
			alert("에러 :" + error.message);
		}
	}

	window.addEventListener("DOMContentLoaded", bbsContent);



</script>
</html>