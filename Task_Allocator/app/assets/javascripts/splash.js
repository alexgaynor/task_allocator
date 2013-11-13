var signInLink, signUpLink, signInForm, signUpForm;
var $profile_info, $profile_pic, $user_container, $inputs, $user_wrap, $user_data_container;
var values = {};


function profileSlideUp() {
	$user_container.animate({ marginTop: -1000 });
}

function profileSlideDown() {
	$user_container.animate({ marginTop: 60, height: 210 });
	$user_data_placeholder.animate({ marginTop: 40});
}

// when profile photo clicked
function photoClick() {
	$profile_pic.on("click", function() {
		if ($user_container.css('marginTop') == '-1000px') {
			profileSlideDown();
		} else {
			profileSlideUp();
		}
	});
}

// enter pressed after edit
function keypress() {
	$(":input").on("keypress", function(e) {
		if (e.keyCode == 13) {
			submitChanges(e);
		} else {
			// confirmChanges(e);
		}
	});
}

// function confirmChanges(e) {
// 	console.log('confirm changes hit');
// 	console.log(e.target);
// 	if (!$inputs.is(e.target)) {
// 		console.log(e);
// 	}
// }

// submit profile edits
function submitChanges(e) {
	$inputs.each(function() {
		var key = $(this).attr('id');
		var value = $(this).val();
		values[key] = value;
	});
	if(e.keyCode == 13 || e.keyCode == undefined) {
		console.log(values);
		editProfile(values);
	}
}

// ajax update user attributes
function editProfile(values) {
	$.ajax({
		dataType: "json",
		method: "post",
		url: "/users/update",
		data: {user: values}
	}).success(function() {
		console.log('ajaxed');
		profileSlideUp();
	});
}

// on load
$(function() {

	// form variables
	signUpLink = $('#sign-up-link');
	signInLink = $('#sign-in-link');
	signUpForm = $('#sign-up-cont');
	signInForm = $('#sign-in-cont');

	// profile variables
	$profile_info = $(".profile_info");
	$profile_pic = $("#profile_pic");
	$user_container = $("#user-cont");
	$inputs = $(".profile_info :input");
	$user_wrap = $("#user-wrap");
	$user_data_placeholder = $('#user-data-placeholder');


	photoClick();
	keypress();


	// form transitions
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

	// confirmation box for profile changes
	// $("body, :input").bind("change keyup", function(e) {
	// 	if (!$inputs.is(e.target) && $user_container.css('marginTop') == '60px') {
	// 		var didConfirm = confirm("Save changes?");
	// 		if (didConfirm == true) {
	// 			submitChanges(e);
	// 			profileSlideUp();
	// 		} else {
	// 			profileSlideUp();
	// 		}
	// 	}
	// });
	
}); // end of on load

