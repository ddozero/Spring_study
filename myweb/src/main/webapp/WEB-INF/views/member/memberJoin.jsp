<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section>
		<fieldset>
			<legend>회원가입</legend>
			<form name="memberJoin" id="memberJoinAdd" method="post" onsubmit="memberJoinAdd()">
				<div>
					<ul>
						<li><label>아이디</label> 
							<input type="text" name="id" readonly>
							<input type="button" value="중복검사" onclick="idCheckOpen()">
						</li>

						<li>
							<label>비밀번호</label> 
							<input type="password" name="password">
						</li>

						<li>
							<label>이름</label> 
							<input type="text" name="name">
						</li>

						<li>
							<label>이메일</label>
							<input type="text" name="email">
						</li>

						<li>
							<label>전화번호</label>
							<input type="text" name="tel">
						</li>

						<li>
							<label>주소</label>
							<input type="text" name="address">
						</li>

					</ul>
					<div>
						<input type="submit" value="가입하기">
						<input type="reset" value="다시작성">
					</div>
				</div>
			</form>
		</fieldset>
	</section>
</body>

<script>
async function memberJoinAdd() {
	
	const form = document.getElementById("memberJoinAdd");
	const formData = new FormData(form);
	const dto = Object.fromEntries(formData.entries());
	
	console.log("데이터 확인 : ",dto);
	
	try {
		const res = await fetch("/myweb/api/memberJoin", {
			method : "POST",
			headers : {"Content-Type" : "application/json"},
			body : JSON.stringify(dto)
		});
		const result = await res.json();
		
		if(res.status==201){
			alert(result.message);
			window.location.href="/myweb/memberJoin";
		}else{
			alert(result.errorMsg);
		}
	} catch (error) {
		console.error(error);
	}
	
}
	
</script>

</html>