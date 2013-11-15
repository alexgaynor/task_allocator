var signInLink, signUpLink, signInForm, signUpForm;
var $profile_info, $profile_pic, $user_container, $inputs, $user_wrap, $user_data_container, $group_fields;
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
function keypressProfile() {
	$profile_info.on("keypress", function(e) {
		if (e.keyCode == 13) {
			submitChanges(e);
		} else {
			// confirmChanges(e);
		}
	});
}

function confirmChanges(e) {
	console.log('confirm changes hit');
	console.log(e.target);
	if (!$inputs.is(e.target)) {
		console.log(e);
	}
}

// submit profile edits
function submitChanges(e) {
	$(".profile_info :input").each(function() {
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

function groupEditable() {
	$group_fields.hover(
		function(){ $(this).addClass("editable_view") },
		function(){ $(this).removeClass("editable_view") }
	)
}

// enter pressed after group edit
function keypressGroup() {
	$group_info.on("keypress", function(e) {
		if (e.keyCode == 13) {
			submitChangesGroup(e);
		}
	});
}

// submit group changes
function submitChangesGroup(e) {
	$("#group_information :input").each(function() {
		// console.log('shit');
		// console.log($(this));
		var key = $(this).attr('id');
		var value = $(this).val();
		values[key] = value;
	});
	if(e.keyCode == 13 || e.keyCode == undefined) {
		editProfileGroup(values);
	}
}

// ajax update group attributes
function editProfileGroup(values) {
	// console.log(values);
	var id = values.id;
	var url = "/groups/" + id;
	var group = values
	// delete group.id;
	console.log(group);

	$.ajax({
		dataType: "json",
		method: "post",
		url: url,
		data: {group: group}
	}).success(function() {
		console.log('ajaxed group');
	});
}

// enter pressed after task edit
function keypressTask() {
	$task_info.on("keypress", function(e) {
		if (e.keyCode == 13) {
			submitChangesTask(e);
		}
	});
}

// submit task changes
function submitChangesTask(e) {
	$("#task_information :input").each(function() {
		var key = $(this).attr('id');
		var value = $(this).val();
		values[key] = value;
	});
	if(e.keyCode == 13 || e.keyCode == undefined) {
		editTask(values);
	}
}

// ajax update task attributes
function editTask(values) {
	var id = values.id;
	delete values.creator_firstname && delete values.owner_firstname
	// var url = "/tasks/" + id;
	console.log(values);
	$.ajax({
		dataType: "json",
		method: "post",
		url: "/tasks/" + id,
		data: {task: values}
	}).success(function() {
		console.log('ajaxed task');
	});
}

function deleteTask() {
	$delete_task_button.on("click", function(e) {
		id = $(this).attr("class");
		values.task_id = id;
		data = {task: values};
		console.log(data);

		$.ajax({
			dataType: "json",
			method: "delete",
			url: "/tasks/" + id,
			data: data
		}).success(function() {
			console.log('deleted');
		});
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
	$inputs = $(":input");
	$profile_info = $(".profile_info");
	$profile_pic = $("#profile_pic");
	$user_container = $("#user-cont");
	$user_wrap = $("#user-wrap");
	$user_data_placeholder = $('#user-data-placeholder');

	// group variables
	$group_info = $("#group_information");
	$group_fields = $("#group_information :input");

	// task variables
	$task_info = $("#task_information");
	$delete_task_button = $("#delete_task_button");

	// user profile
	photoClick();
	keypressProfile();

	// group profile
	keypressGroup();

	//task profile
	keypressTask();
	deleteTask();

	// dashed group info box
	groupEditable()

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

