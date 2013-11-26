require 'faker'

User.delete_all
Group.delete_all
Task.delete_all

group_types = ['friends', 'family', 'roommates', 'work buddies', 'event planners']
roles = ['friend', 'daughter', 'mom', 'dad', 'sister', 'brother']
boolean = [true, false]
priorities = ['low', 'medium', 'high']
categories = ['chore', 'pick-up', 'grocery', 'todo']
groups_arr = []
users_arr = []
tasks_arr = []





