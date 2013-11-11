var signInLink, signUpLink, signInForm, signUpForm;

$(function() {
	

	signUpLink = $('#sign-up-link');
	signInLink = $('#sign-in-link');
	signUpForm = $('#sign-up-cont');
	signInForm = $('#sign-in-cont');
	var transition = false;
	signUpLink.click(function () {
		if (transition === false){
			transition = true;
			signInForm.fadeOut(1000);
			signUpForm.delay(1200).fadeIn(1000);
		}
		transition = false;
	});
	signInLink.click(function () {
		if (transition === false) {
			transition = true;
			signUpForm.fadeOut(1000);
			signInForm.delay(1200).fadeIn(1000);

		}
		transition = false;
	});


});