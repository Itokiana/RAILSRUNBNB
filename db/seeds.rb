# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
user = User.create(name:'Run',first_name:'bnb',sexe:'homme',date_of_birth:'12/09/92',adresse:'Tana',mobile:"+261390987634",urgence:'119',email: "r@gmail.com", password: "r@gmail.com")