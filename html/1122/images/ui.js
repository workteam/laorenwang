$(document).ready(function(){
	$('.nav li').each(function(i){
		$(this).hover(function(){
			$('.nav li').eq(i).find('dl').show();	
			}, function(){
			$('.nav li').eq(i).find('dl').hide();	
			})	
	});
	$('#imgTab li').each(function(i){
		$(this).find('img').hover(function(){
			$('#imgPlay .imgs img').hide().eq(i).fadeIn('fast');
			return false
		})
	})
	
})