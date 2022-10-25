# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# *** User creation ***
User.destroy_all
User.create!([{
    username: "Admin",
    email: "admin@example.com",
    password: "password",
    admin: true
},
{
    username: "ExampleUser1",
    email: "user1@example.com",
    password: "password"
},
{
    username: "ExampleUser2",
    email: "user2@example.com",
    password: "password"
},
{
    username: "ExampleUser3",
    email: "user3@example.com",
    password: "password"
},
{
    username: "ExampleUser24",
    email: "user4@example.com",
    password: "password"
},
{
    username: "ExampleUser5",
    email: "user5@example.com",
    password: "password"
}])

# *** Category creation ***
Category.destroy_all
Category.create!([{
    name: "Furniture"
},
{
    name: "Books"
},
{
    name: "Vehicle"
},
{
    name: "Home decor"
},
{
    name: "Electronics"
}])

