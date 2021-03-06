/**
	날짜 : 201/06/08
	이름 : 김철학
	내용 : 유효성 검증(아이디, 비밀번호, 이름, 별명, 이메일, 휴대폰번호)

 */

$(function(){
			// 유효성 검증
			$('#regForm').submit(function(){
				if(!isUidOk){
					alert('아이디가 유효하지 않습니다. 다시 확인하십시요.');
					return false;
				}
				
				if(!isPassOk){
					alert('비밀번호가 유효하지 않습니다. 다시 확인하십시요.');
					return false;
				}
				
				if(!isNameOk){
					alert('이름이 유효하지 않습니다. 다시 확인하십시요.');
					return false;
				}
				
				if(!isNickOk){
					alert('별명이 유효하지 않습니다. 다시 확인하십시요.');
					return false;
				}
				
				if(!isEmailOk){
					alert('이메일이 유효하지 않습니다. 다시 확인하십시요.');
					return false;
				}
				
				if(!isHpOk){
					alert('휴대폰이 유효하지 않습니다. 다시 확인하십시요.');
					return false;
				}
				return true;
			});
			
		});