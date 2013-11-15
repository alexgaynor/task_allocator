var addTaskForm, addTaskCont, addTaskButton, todoTasksCont;
var members_placeholder, add_member_form;

$(function () {
	// add new task
	addTaskButton = $('#add-task');
	addTaskCont = $('#add-task-container');
	addTaskForm = $('#add-task-form');
	todoTasksCont = $('#todo-tasks-placeholder');

	// add new member
	members_placeholder = $("#member-wrap-placeholder:last-child");
	add_member_form = $('#add_member_form');
	var group_members_template = Handlebars.compile($('#group_members_template').html());

	add_member_form.bind('ajax:success', function(evt, data, status, xhr){
			members_placeholder.append(group_members_template(data));
	});


	addTaskButton.on('click', function () {
		if (addTaskCont.css('display') === 'none' ) {
			addTaskCont.fadeIn(300);
		} else {
			addTaskCont.fadeOut(300);
		}
	});

	addTaskForm.on('submit', function () {
		addTaskCont.fadeOut(300);
	});

	addTaskForm.bind('ajax:success', function(evt, raw_data, status, xhr){
		// message here
		console.log(raw_data);
		data = raw_data.task;
		console.log('trying to reset form');
		todoTasksCont.append(
			'<div id=task-placeholder><ul><li><a href="/tasks/' + data.id + '"><b>' + data.name + '</b></a></li><li>' + data.desc + '</li><li>Priority: ' + data.priority + '</li><li>Category: ' + data.category +'</li><li>Karma Value: ' + data.karma_value +'</li></ul></div>'
		);
		addTaskForm[0].reset();
	});
});