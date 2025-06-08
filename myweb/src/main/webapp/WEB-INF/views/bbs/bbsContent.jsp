<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	function contentUp(){
		
	    const title = document.getElementById("title");
	    const content = document.getElementById("content");
	    const editSaveBtn = document.getElementById("editSaveBtn");

	    
	    if(title.readOnly) {
	        title.readOnly = false;
	        content.readOnly = false;
	        editSaveBtn.value = "저장";
	    } else {
	        contentUp_Ok();
	    }
	}
</script>
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
		<input type = "hidden" id = "idx">
		<table id = "bbsContent-table">
			<tr>
				<th>번호</th>
				<td id = "bbs-idx"></td>
				<th>작성일</th>
				<td id = "bbs-writedate"></td>
			</tr>

			<tr>
				<th>작성자</th>
				<td id = "bbs-writer"></td>
				<th>조회수</th>
				<td id = "bbs-readnum"></td>
			</tr>

			<tr>
				<th>제목</th>
				<td colspan ="3"><input type="text" id="title" readonly></td>
			</tr>

			<tr>
				<td colspan="4" align="left" valign="top">
				<textarea id ="content" readonly style="width:100%; height:200px;"></textarea></td>
			</tr>
			<tr>
				<td colspan="4" align ="center">
				<input type="button" value = "수정하기" id = "editSaveBtn" onclick = "contentUp()">
				
				<input type="button" value= "목록으로" onclick = "location.href='/myweb/bbsList'">
				</td>
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
				
				document.getElementById("bbs-idx").innerText = bbs.idx;
				document.getElementById("bbs-writedate").innerText = bbs.writedate;
				document.getElementById("bbs-writer").innerText = bbs.writer;
				document.getElementById("bbs-readnum").innerText = bbs.readnum;
				document.getElementById("title").value = bbs.title;
				document.getElementById("content").value = bbs.content;
				document.getElementById("idx").value = bbs.idx;

				
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
	
	
	
	async function contentUp_Ok() {
		const idx = document.getElementById("idx").value;
		const title = document.getElementById("title").value;
		const content = document.getElementById("content").value;

		const data = {idx,title,content};

		try {
			const res = await fetch("/myweb/api/bbsContentUp",{
				method: "PUT",
				headers: {"Content-Type":"application/json"},
				body: JSON.stringify(data)
			});

			const result = await res.json();
			if(res.status==200){
				alert("게시글이 수정되었습니다");
				 document.getElementById("title").readOnly = true;
		         document.getElementById("content").readOnly = true;
		         document.getElementById("editSaveBtn").value = "수정하기";
		         
		         window.location.reload();
			}else{
				alert(result.errorMsg);
			}
		} catch (error) {
			console.error(error);
			alert("수정 중 오류 발생:"+error.message);
		}
		
	}



</script>
</html>