var addGroupButton, addGroupCont, addGroupForm;

$(function () {
	addGroupCont = $('#add-group-cont');
	addGroupButton = $('#add-group');
	addGroupForm = $('#add-group-form');
	groupsCont = $('#groups-cont');
	addGroupButton.on('click', function () {
		addGroupCont.fadeIn(300);
	});

	addGroupForm.on('submit', function () {
		addGroupCont.fadeOut(300);
	});

	addGroupForm.bind('ajax:success', function(evt, data, status, xhr){
		groupsCont.append(
			'<div id=' + data.id + ' class="group-box-placeholder"><ul><li>' + data.group_name + '</li><li>' + data.group_desc + '</li><li>' + data.homebase_location + '</li><li>' + data.group_type +'</li></ul></div>'
		);
		addGroupForm[0].reset();
	});



});