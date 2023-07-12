<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<style>
section#memberList-container {text-align:center;}
section#memberList-container table#tbl-member {width:100%; border:1px solid gray; border-collapse:collapse;}
table#tbl-member th, table#tbl-member td {border:1px solid gray; padding:10px; }

section#memberList-container div#neck-container{padding:0px; height: 50px; background-color:rgba(0, 188, 212, 0.3);}
section#memberList-container div#search-container {margin:0 0 10px 0; padding:3px; float:left;}

div#search-container 	{width: 100%; margin:0 0 10px 0; padding:3px; background-color: rgba(0, 188, 212, 0.3);}
div#search-memberId 	{display: inline-block;}
div#search-nickName		{display: none}
div#search-memberRole	{display: none}

</style>

<script src="<%= request.getContextPath() %>/js/jquery-3.7.0.js"></script>

<script>
	const bannerContainerLower = document.querySelector(".bannerContainerLower");
	bannerContainerLower.style.display = "none";
	window.onload = () => {
		
		let cnt=0;
		document.querySelectorAll(".search-type").forEach((elem) => {
			if(elem.style.display==="none")
				cnt++;
		});
		if(cnt===3){
		document.querySelector("div #search-memberId").style.display="inline-block";
		
		}
		
		findAllMember();
		
	}
	
</script>

<section id="memberList-container">
	<h2>회원관리</h2>
	
	<div id="search-container">
        <label for="searchType">검색타입 :</label> 
        <select id="searchType">
            <option value="memberId" >아이디</option>		
            <option value="nickName" >닉네임</option>
            <option value="memberRole" >회원권한</option>
        </select>
        <select id="banckeck">
            <option value="is_banned" >정상회원</option>		
            <option value="nickName" >닉네임</option>
            <option value="memberEnrole" >회원권한</option>
        </select>
        
        
        
        <div id="search-memberId" class="search-type">
            <form action="<%=request.getContextPath()%>/admin/memberFinder">
               <input type="hidden" name="searchType" value="member_id"/>
                <input 
                	type="text" name="searchKeyword"  size="25" placeholder="검색할 아이디를 입력하세요." 
                	value="사용자 입력값"/>
                <button type="submit">검색</button>			
            </form>	
        </div>
        <div id="search-nickName" class="search-type">
            <form action="">
                <input type="hidden" name="searchType" value="nickName"/>
                <input 
                	type="text" name="searchKeyword" size="25" placeholder="검색할 이름을 입력하세요."
                	value="notalready"/>
                <button type="submit">검색</button>			
            </form>	
        </div>
        <div id="search-memberRole" class="search-type">
            <form action="<%=request.getContextPath()%>/admin/memberFinder">
                <input type="hidden" name="searchType" value="enrole"/>
                <input type="radio" name="searchKeyword" value="A" > 관리자
                <input type="radio" name="searchKeyword" value="R"> 기자
                <input type="radio" name="searchKeyword" value="M"> 회원
                <button type="submit">검색</button>
            </form>
        </div>
    </div>
	
	<table id="tbl-member">
		<thead>
			<tr>
				<th>아이디(이메일)</th>
				<th>닉네임</th>
				<th>회원권한</th>
				<th>전화번호</th>
				<th>성별</th>	
				<th>가입일</th>
				<th>벤</th>
			</tr>
		</thead>
		<tbody></tbody>
	</table>
</section>

<script>

document.querySelector("select#searchType").onchange = (e) => {
	console.log(e.target.value);
	document.querySelectorAll(".search-type").forEach((elem) => {
		elem.style.display = "none";
	});
	
	document.querySelector(`#search-\${e.target.value}`).style.display = "inline-block";
		
	
	 document.querySelector(`#search-\${e.target.value}`).onsubmit=(e)=>{
		e.preventDefault();

		const frmData = new FormData(e.target);
		
		const findSelectedMember= ()=>{
			$.ajax({
				url:"",
				data :frmData,
				processData : false,
				contentType : false,
				method :"POST",
				dataType :"json",
				success(responseData) {
				console.log(responseData);
				

				},
				
			});
			
		}

	};
	
	};
	

	const findAllMember= ()=>{
		$.ajax({
			url : "<%= request.getContextPath() %>/admin/member/findAll",
			method :"GET",
			dataType :"json",
			success(members){
				console.log(members);

				const tbody= document.querySelector("#tbl-member tbody");
				tbody.innerHTML= members.reduce((html,member)=>{
					const{memberId,nickname,memberRole,phone,gender,enrollDate,isBanned}=member;
					return html +`
						<tr>
							<td>\${memberId}</td>
							<td>\${nickname}</td>
							<td>\${memberRole}</td>
							<td>\${phone}</td>
							<td>\${gender}</td>
							<td>\${enrollDate}</td>
							<td>\${isBanned}</td>
						</tr>
					`;
				},"");
			}
		});
	}
		
	
	

</script>



<%@ include file="/WEB-INF/views/common/footer.jsp" %>