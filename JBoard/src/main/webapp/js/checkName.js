/**
	날짜 : 201/06/08
	이름 : 김철학
	내용 : 이름 조합여부 확인
 */

var regName = /^[가-힣]{2,10}$/;
    	
var isNameOk = false;

$(function(){
	
	$('input[name=name]').focusout(function(){
		
		var name = $(this).val();
		
		if(regName.test(name)){
			$('.resultName').text('');
			isNameOk = true;
		}else{
			$('.resultName').css('color', 'red').text('이름은 한글 2 ~ 10자 까지 입력 가능합니다.');
			isNameOk = false;
		}
	});
});