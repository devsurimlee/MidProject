<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function deleteForm(){
		var form = document.deletefrm;
		if(!form.check1.checked || !form.check2.checked || !form.check3.checked || !form.check4.checked){
			alert("안내 사항을 읽고 모두 동의해 주세요.");
			return false;
		}
		var result = confirm("확인을 누르시면 회원 탈퇴가 완료됩니다.");
        if(result == true) {
        	form.submit();
        } else {
        	false;
        }
	}
</script>
</head>
<body>
	<%
		String id = (String) session.getAttribute("id");
		String name = (String) session.getAttribute("name");
	%>
	<div align="center">
		<!-- 헤드 -->
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default"><br />
					<div class="panel-heading text-center">
						<h4><b> 회원 탈퇴 </b></h4>
					</div>
				</div><br /><br />
			</div>
		</div>
		
		<!-- 내용 -->
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<h6> 지금까지 예담 쇼핑몰을 이용해 주셔서 감사합니다.<br>회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요. </h6><br />
				<form role="form" id="deletefrm" name="deletefrm" action="basic_deleteMember.do" method="post">
					<table>
						<tr>
							<td><input class="form-check-input" type="checkbox" value="" id="check1"></td>
							<td><b>사용하고 계신 아이디(<font color="green"><b>${id }</b></font>)는 탈퇴할 경우 재사용 및 복구가 불가능합니다.</b></td>
						</tr>
						<tr>
							<td></td>
							<td><font size="2"><font color="orange">탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가</font>하오니 신중하게 선택하시기 바랍니다.</font></td>
						</tr>
						<tr><td height="30"></td></tr>
						<tr>
							<td><input class="form-check-input" type="checkbox" value="" id="check2"></td>
							<td><b>탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</b></td>
						</tr>
						<tr>
							<td></td>
							<td><font size="2">회원정보 및 주소록 등 개인형 서비스 이용기록은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.<br>
								삭제되는 내용을 확인하시고 필요한 데이터는 미리 백업을 해주세요.</font></td>
						</tr>
						<tr><td height="30"></td></tr>
						<tr>
							<td><input class="form-check-input" type="checkbox" value="" id="check3"></td>
							<td><b>탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.</b></td>
						</tr>
						<tr>
							<td></td>
							<td><font size="2">1:1 문의게시판에 올린 게시글 및 이에 달린 답글은 탈퇴 시 자동 삭제되지 않고 그대로 남아 있습니다.<br>
								삭제를 원하는 게시글이 있다면 <font color="orange">반드시 탈퇴 전 비공개 처리하거나 삭제</font>하시기 바랍니다.<br>
								탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 게시글을 임의로 삭제해드릴 수 없습니다.</font></td>
						</tr>
						<tr><td height="30"></td></tr>
						<tr>
							<td><input class="form-check-input" type="checkbox" value="" id="check4"></td>
							<td><b>탈퇴 후에는 아이디 (<font color="green"><b>${id }</b></font>)로 다시 가입할 수 없으며 
								아이디와 데이터는 복구할 수 없습니다.</b></td>
						</tr>
						<tr>
							<td></td>
							<td><font size="2">게시판형 서비스에 남아 있는 게시글은 탈퇴 후 삭제할 수 없습니다.</font></td>
						</tr>
						<tr><td height="30"></td></tr>
						<tr>
					</table>
					<table>
						<tr>
							<td width="360"><button type="button" onclick="deleteForm()" class="btn btn-md btn-warning btn-block"> 탈퇴하기 </button></td>
							<td width="360"><button type="button" onclick="location.href='basic_mypageForm.do'"	class="btn btn-primary btn-block"> GO BACK </button></td>
						</tr>
					</table>
				</form>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
</body>
</html>