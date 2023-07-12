<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<section id=enroll-container>

	<form name="memberRegisterFrm" action="" method="POST">
		<table>
			<tr>
				<th>아이디<sup>*</sup></th>
				<td>
					<input type="email" placeholder="이메일" name="memberId" id="memberId" required>
				</td>
			</tr>
			<tr>
				<th>비밀번호<sup>*</sup></th>
				<td>
					<input type="password" name="password" id="password" placeholder="비밀번호" required><br>
				</td>
			</tr>
			<tr>
				<th>비밀번호확인<sup>*</sup></th>
				<td>	
					<input type="password" id="passwordConfirmation" required><br>
				</td>
			</tr>  
			<tr>
				<th>닉네임<sup>*</sup></th>
				<td>	
				<input type="text"  name="nickname" id="nickname" required><br>
				</td>
			</tr>
			<tr>
				<th>전화번호<sup>*</sup></th>
				<td>	
					<input type="tel" placeholder="(-없이)01012345678" name="phone" id="phone" maxlength="11" required><br>
				</td>
			</tr>
			<tr>
				<th>성별<sup>*</sup></th>
				<td>
					<input type="radio" name="gender" id="gender0" value="M">
					<label for="gender0">남</label>
					<input type="radio" name="gender" id="gender1" value="F">
					<label for="gender1">여</label>
					<input type="radio" name="gender" id="gender2" value="N">
					<label for="gender2">비공개</label>
				</td>
			</tr>
		</table>
		<input type="submit" value="회원가입" >
		<input type="reset" value="취소">
	</form>
</section>
<script>

// 비밀번호 일치여부
document.querySelector("#passwordConfirmation").onblur = (e) => {
	const pw1 = document.querySelector("#password");
	const pw2 = e.target;
	
	if(pw1.value !== pw2.value) {
		alert("비밀번호가 일치하지 않습니다.");
		pw1.select();
	}
};

// 폼 유효성검사
document.memberRegisterFrm.onsubmit = (e) => {
	const frm = e.target;
	const memberId = e.target.memberId;
	const password = e.target.password;
	const passwordConfirmation = e.target.querySelector("#passwordConfirmation");
	const nickname = e.target.nickname;
	const phone = e.target.phone;
	
	// 아이디 검사 - 영문자/숫자 4글자 이상
	if(!/^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/.test(memberId.value)){
		alert("유효한 이메일 형식이 아닙니다.");
		return false;
	}

	// 비밀번호 검사 - 영문자/숫자/특수문자!@#$% 4글자 이상
	if (!/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@!%*#?&])[A-Za-z\d@!%*#?&]{8,}$/.test(password.value)) {
		alert("비밀번호는 영문자/숫자/특수문자(!@#$%)를 최소 하나를 포함해 8글자 이상이어야 합니다.");
		return false;
	}
	
	if (password.value !== passwordConfirmation.value) {
		alert("두 비밀번호가 일치하지 않습니다.");
		return false;
	}

	// 닉네임 검사 - 영문자/한글/숫자 2글자 이상
	if (!/^010\d{8}$/.test(phone.value)) {
		alert("닉네임은 010으로 시작하고 숫자8자리여야 합니다.");
		return false;
	}
	
	// 전화번호 검사 - 01012345678 010으로 시작하고 숫자8자리 여부 확인
	if (!/^010\d{8}$/.test(phone.value)) {
		alert("전화번호는 010으로 시작하고 숫자8자리여야 합니다.");
		return false;
	}
	
};


</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>