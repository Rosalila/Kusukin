# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create(name: 'All', description: '')
design = Category.create(name: 'Design', description: '')
progra = Category.create(name: 'Programming', description: '')
bussines = Category.create(name: 'Bussiness', description: '')
gameplay = Category.create(name: 'Gameplay', description: '')
Category.create(name: 'Graphics', description: '')
Category.create(name: 'SFX', description: '')
music = Category.create(name: 'Music', description: '')
Category.create(name: 'Writer', description: '')
other = Category.create(name: 'Other', description: '')

#user = User.find_by_email('serpel.js@gmail.com')
Course.create(name: 'Rails for dummies', description: 'Esta es una prueba de la descripcion del curso', category: progra )
Course.create(name: 'Unity 3D', description: 'Esta es una prueba de la descripcion del curso', category: progra )
Course.create(name: 'Flat Design', description: 'Esta es una prueba de la descripcion del curso', category: design )
Course.create(name: 'Intro to play guitar', description: 'Esta es una prueba de la descripcion del curso', category_id: music )
Course.create(name: 'HTML + CSS', description: 'Esta es una prueba de la descripcion del curso', category: progra )
Course.create(name: 'JQuery for beginners', description: 'Esta es una prueba de la descripcion del curso', category: progra )
Course.create(name: 'Photoshop for win hackathons', description: 'Esta es una prueba de la descripcion del curso', category_id: design )
Course.create(name: 'A bussines man', description: 'Esta es una prueba de la descripcion del curso', category_id: bussines )

Section.create(number: 1, videourl: 'https://www.youtube.com/v/h7aSEuxaRjo', content: 'esto es el texto del curso', course: Course.first)
Section.create(number: 2, videourl: 'https://www.youtube.com/v/Hr2Bc5qMhE4', content: 'esto es el texto del curso', course: Course.first)
Section.create(number: 3, videourl: 'https://www.youtube.com/v/w5LZ8YErl2M', content: 'esto es el texto del curso', course: Course.first)

