# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([
  { name: "bob",
    email: "bob@email.com",
    password: "password" },
  { name: "sam",
    email: "sam@email.com",
    password: "password" },
  { name: "kevin",
     email: "kevin@email.com",
     password: "password" }
  ])

posts = Post.create([
  { title: "post",
    body: "post number 1",
    author_id: 1 },
  { title: "post post",
    body: "post number 2",
    author_id: 2 },
  { title: "post post post",
     body: "post number 3",
    author_id: 3 }
  ])
