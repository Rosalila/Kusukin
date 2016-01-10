# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create! name: 'John Doe', email: 'admin@admin.com', password: 'admin1234', password_confirmation:'admin1234'

categories = Category.create!([{ name: 'All'}, 
	{name: 'Design'},
	{name: 'Programming'}, 
	{name: 'Gameplay'}, 
	{name: 'Graphics'},
	{name: 'SFX'},
	{name: 'Music'},
	{name: 'Writer'},
	{name: 'Other'}])

courses = Course.create([{name: 'Rails for dummies', description: 'Testing', category_id: Category.where(name: 'Programming').first, user: user},
	{name: 'Unity 3D', description: 'Testing', category: Category.where(name: 'Programming').first, user: user},
	{name: 'Flat Design', description: 'Testing', category: Category.where(name: 'Design').first, user: user},
    {name: 'Intro to play guitar', description: 'Testing', category: Category.where(name:'Music').first, user: user},
	{name: 'HTML + CSS', description: 'Testing', category: Category.where(name: 'Programming').first, user: user}])

ryby_sections = Section.create([{number: 1, videourl: 'https://www.youtube.com/v/8I539U5lXWY', title: 'Install ruby on rails', course: Course.where(name: 'Rails for dummies').first},
	{number: 2, videourl: 'https://www.youtube.com/v/f9G-W8RLuJ4', title: 'Arithmetic Operators', course: Course.where(name: 'Rails for dummies').first},
	{number: 3, videourl: 'https://www.youtube.com/v/JdCyLqmoxOg', title: 'if - else - elsif', course: Course.where(name: 'Rails for dummies').first}])

enrollments = Enrollment.create([{user: user, course: Course.where(name: 'Rails for dummies').first, progress: 0},
	{user: user, course: Course.where(name: 'Unity 3D').first, progress: 0},
	{user: user, course: Course.where(name: 'Flat Design').first, progress: 0},
	{user: user, course: Course.where(name: 'Intro to play guitar').first, progress: 0},
	{user: user, course: Course.where(name: 'HTML + CSS').first, progress: 0}])