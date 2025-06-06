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
	<form name="bbsWrite"  id="bbsWrite">
		<table>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="writer"></td>
				<th>비밀번호</th>
				<td><input type="password" name="password"></td>
			</tr>

			<tr>
				<th>제목</th>
				<td colspan="3"><input type="text" name="title"></td>
			</tr>

			<tr>
				<td colspan="4"><textarea rows="8" cols="60" name="content"></textarea>
			</tr>

			<tr>
				<td colspan="4" align="center"><input type="submit" value="글작성">
					<input type="reset" value="다시작성"></td>
			</tr>
		</table>
	</form>
</body>

<script>

document.getElementById("bbsWrite").addEventListener("submit", function(event) {
	event.preventDefault();
	bbsWrite();
});


async function bbsWrite() {
	
	const form = document.getElementById("bbsWrite");
	const formData = new FormData(form);
	const dto = Object.fromEntries(formData.entries());

	console.log("데이터 확인:",dto);

	try {
		const res = await fetch("/myweb/api/bbsWrite", {
			method : "POST",
			headers : {"Content-Type" : "application/json"},
			body : JSON.stringify(dto)
		});
		const result = await res.json();

		if(res.status===201){
			alert(result.message);
			window.location.href="/myweb/bbsList";
		}else{
			alert(result.errorMsg);
		}
	} catch (error) {
		console.error(error);
		alert("문제발생:"+error.message)
	}
	
}


</script>


</html>