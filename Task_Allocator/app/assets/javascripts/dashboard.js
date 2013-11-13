var addGroupButton, addGroupCont, addGroupForm;

$(function () {
	addGroupCont = $('#add-group-cont');
	addGroupButton = $('#add-group');
	addGroupForm = $('#add-group-form');
	addGroupButton.on('click', function () {
		addGroupCont.fadeIn(300);
	});

	addGroupForm.on('submit', function (event) {
		// $.ajax({
		// 	url


		// }).done({

		// });
		addGroupCont.fadeOut(300);
	});





});