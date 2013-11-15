var addGroupButton, addGroupCont, addGroupForm;

$(function () {
	addGroupCont = $('#add-group-cont');
	addGroupButton = $('#add-icon');
	addGroupForm = $('#add-group-form');
	groupsCont = $('#groups-cont');
	addGroupButton.on('click', function () {
		if (addGroupCont.css('display') === 'none'){
			addGroupCont.fadeIn(300);		
		} else {
			addGroupCont.fadeOut(300);
		}

	});

	addGroupForm.on('submit', function () {
		addGroupCont.fadeOut(300);
	});

	addGroupForm.bind('ajax:success', function(evt, data, status, xhr){
		console.log(data)
		groupsCont.append(
			'<div id=' + data.id + ' class="group-box-placeholder"><a href="/groups/' + data.id + '"><ul><li></li><b><li>' + data.group_name + '</li></b><li>' + data.group_desc + '</li><li>' + data.homebase_location + '</li><li>' + data.group_type +'</li></ul></a></div>'
		);
		addGroupForm[0].reset();
	});



});