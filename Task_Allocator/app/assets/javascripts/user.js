var app,
		username;

$(function() {
	// activate sign up modal form
	$sign_up_form = $("form#sign_up_user");
	$sign_up_form.on("submit", function(event) {
		$.ajax({
			url: "/users",
			method: "post",
			format: "json",
			data: $sign_up_form.serialize()
		}).done(function(data) {
			if(data.success){
				app.signUp(data);
			}
		});
	});

	// activate sign in modal form
	$sign_in_form = $("form#sign_in_user");
	$sign_in_form.on("submit", function(event) {
		$.ajax({
			url: "/users/sign_in",
			method: "post",
			format: "json",
			data: $sign_in_form.serialize()
		}).done(function(data) {
			if(data.success){
				app.signIn(data);
			}
		});
	});

	// create ajax logout call
	$logout_link = $("#logout_link");
	$logout_link.on("click", function() {
		$.ajax({
			url: "/users/sign_out",
			method: "delete",
			data: {authenticity_token: window._token}
		}).done(function(data) {
			if(data.success){
				app.logOut();
			}
		});
	});

	app = {
		signIn: function(data) {
			$(close_sign_in_modal).trigger('click');
			app.loggedIn(data);
		},

		signUp: function(data) {
			$(close_sign_up_modal).trigger('click');
			app.loggedIn(data);
		},

		logOut: function(data) {
			app.loggedOut();
		},

		loggedIn: function(data) {
			$("div#logged_in_menu").removeClass("inactive");
			$("div#logged_out_menu").addClass("inactive");
			if(data) {
				window._current_user_username = data.current_user.username;
			}
		},

		loggedOut: function() {
			$("div#logged_in_menu").addClass("inactive");
			$("div#logged_out_menu").removeClass("inactive");
			window._current_user_username = '';
		}
	};

	// check login state
	if(window._current_user_username) {
		app.loggedIn();
	} else {
		app.loggedOut();
	}



});