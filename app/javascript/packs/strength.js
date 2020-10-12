$(function(){
	//alert("Strength");
	
	$('.users_submit').attr('disabled','disabled');
	$('.users_submit').addClass('disabled');
	$('#users_password').keyup(function(){
		var password = $('#users_password').val();
		if(password == ''){
			$('#progress').removeClass().addClass('progress-bar');
			$('#strength').html('');
			$('.users_submit').attr('disabled','disabled');
			$('.users_submit').addClass('disabled');
		}
		else{
			var meter = checkStrength(password);
			$('#strength').html(meter);
		}
	});
});

function checkStrength(password){
	var strength = 0
	if (password.length < 6) {
		$('#progress').removeClass().addClass('progress-bar').addClass('w-25').addClass('bg-danger');
		$('#strength').removeClass().addClass('short');
		$('#user_submit').attr('disabled','disabled');
		return 'Too short';
	}
	if (password.length > 7) strength += 1
	// If password contains both lower and uppercase characters, increase strength value.
	if (password.match(/([a-z].*[A-Z])|([A-Z].*[a-z])/)) strength += 1
	// If it has numbers and characters, increase strength value.
	if (password.match(/([a-zA-Z])/) && password.match(/([0-9])/)) strength += 1
	// If it has one special character, increase strength value.
	if (password.match(/([!,%,&,@,#,$,^,*,?,_,~])/)) strength += 1
	// If it has two special characters, increase strength value.
	if (password.match(/(.*[!,%,&,@,#,$,^,*,?,_,~].*[!,%,&,@,#,$,^,*,?,_,~])/)) strength += 1
	
	//Enable button if strength is greater or equal 2
	if (strength < 2){
		$('.users_submit').attr('disabled','disabled');
		$('.users_submit').addClass('disabled');
	}
	else{
		$('.users_submit').removeAttr('disabled');
		$('.users_submit').removeClass('disabled');
	}
		

	// Calculated strength value, we can return messages
	// If value is less than 2
	if (strength < 2){
		$('#progress').removeClass().addClass('progress-bar').addClass('w-50').addClass('bg-info');
		$('#strength').removeClass().addClass('weak');
		return 'Weak';
	}
	else if (strength == 2){
		$('#progress').removeClass().addClass('progress-bar').addClass('w-75').addClass('bg-primary');
		$('#strength').removeClass().addClass('good');
		return 'Good';
	}
	else{
		$('#progress').removeClass().addClass('progress-bar').addClass('w-100').addClass('bg-success');
		$('#strength').removeClass().addClass('strong');
		return 'Strong';
	}
	
}
