# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Task.delete_all
Subtask.delete_all
Session.delete_all
User.delete_all


user = User.create(:username => "nani", :password => "nani")
user2 = User.create(:username => "noni", :password => "noni")


task = Task.create(:title => "Test 1", :user_id => user.id, :proficiency => 2, :created => Time.now)

subtask1 = Subtask.create(:title => "Subtest 1", :proficiency => 0, :task_id => task.id, :created => Time.now)
subtask2 = Subtask.create(:title => "Subtest 2", :proficiency => 3, :task_id => task.id, :created => Time.now)

session1 = Session.create(:description => "A very good session.", :duration => 1.5, :subtask_id => subtask1.id, :created => Time.now)
session2 = Session.create(:description => "Another good session.", :duration => 4.5, :subtask_id => subtask1.id, :created => Time.now)

session3 = Session.create(:description => "More good sessions!", :duration => 1.0, :subtask_id => subtask2.id, :created => Time.now)
session4 = Session.create(:description => "Multiple good sessions!", :duration => 0.33, :subtask_id => subtask2.id, :created => Time.now)
