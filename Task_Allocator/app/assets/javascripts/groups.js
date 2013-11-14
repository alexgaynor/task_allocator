var addTaskForm, addTaskCont, addTaskButton, todoTasksCont;

$(function () {
	addTaskButton = $('#add-task');
	addTaskCont = $('#add-task-cont');
	addTaskForm = $('#add-task-form');
	todoTasksCont = $('#todo-tasks-placeholder');

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
		// console.log(data);
		data = raw_data.task;
		todoTasksCont.append(
			'<div id=task-placeholder><ul><li><a href="/tasks/' + data.id + '">LINK TO TASK</a></li><li>' + data.name + '</li><li>' + data.desc + '</li><li>' + data.priority + '</li><li>' + data.category +'</li><li>' + raw_data.creator.firstname +'</li></ul></div>'
		);
		addTaskForm[0].reset();
	});
});