var signInLink, signUpLink, signInForm, signUpForm;
var $profile_info, $profile_pic, $user_container, $inputs, $user_wrap;
var values = {};


function profileSlideUp() {
	$user_container.animate({ marginTop: -500 });
}

function profileSlideDown() {
	$user_container.animate({ marginTop: 20, marginBottom: 100 });
}

// when profile photo clicked
function photoClick() {
	$profile_pic.on("click", function() {
		if ($user_container.css('marginTop') == '-500px') {
			profileSlideDown();
		} else {
			profileSlideUp();
		}
	});
}

// edit profile info
function editProfileInfo() {
	$user_wrap.on("click", function(e) {
		console.log(e.target);
		all = $(".profile_info div");
		all.each(function() {
			var dataset = $(this);
			var theid = dataset.attr("id");
			var newid = theid+"-form";
			var currval = dataset.text();
			dataset.empty();
			// $(this).unbind('click');
			$('<input type="text" id="'+newid+'" value="'+currval+'" class="edit_field">').appendTo(dataset);
		});
		keypress();
	});
}

// keypress edit
function keypress() {
	$(".edit_field").on("keypress", function(e) {
		submitChanges(e);
	});
}

// submit profile edits
function submitChanges(e) {
	$inputs = $('.profile_info :input');
	$inputs.each(function() {
		var key = $(this).parent().attr('id');
		var value = $(this).val();
		values[key] = value;
	});
	if(e.keyCode == 13 || e.keyCode == undefined) {
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
	$inputs = $(".profile_info div :input");
	$user_wrap = $("#user-wrap");

	photoClick();
	editProfileInfo();

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
	$(':input').mouseup(function(e) {
		e.stopPropagation();
		console.log(e.target);
		if (!$user_wrap.is(e.target) && !$(":input").is(e.target) && $user_container.css('marginTop') == '20px') {
			var didConfirm = confirm("Save changes?");
			if (didConfirm == true) {
				submitChanges(e);
				profileSlideUp();
			} else {
				profileSlideUp();
			}
		}
	});
	
}); // end of on load

