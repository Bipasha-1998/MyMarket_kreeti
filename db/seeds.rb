# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# *** User creation ***
User.destroy_all
User.create!([{ username: 'Admin1',
                email: 'admin1@example.com',
                password: 'password',
                admin: true },
              { username: 'Admin2',
                email: 'admin2@example.com',
                password: 'password',
                admin: true },
              { username: 'ExampleUser1',
                email: 'user1@example.com',
                password: 'password' },
              { username: 'ExampleUser2',
                email: 'user2@example.com',
                password: 'password' },
              { username: 'ExampleUser3',
                email: 'user3@example.com',
                password: 'password' },
              { username: 'ExampleUser4',
                email: 'user4@example.com',
                password: 'password' },
              { username: 'ExampleUser5',
                email: 'user5@example.com',
                password: 'password' }])

# *** Category creation ***
Category.destroy_all
Category.create!([{ name: 'Furniture' },
                  { name: 'Books' },
                  { name: 'Vehicle' },
                  { name: 'Home decor' },
                  { name: 'Electronics' }])

# *** Product creation ***
Product.destroy_all
products = []
products[0] = Product.new(title: 'Brown Sofa',
                          description: 'Random Description of a Brown sofa',
                          price: 2000,
                          user_id: 2,
                          category_id: 1,
                          city: 'Kolkata',
                          phone_number: '1234567891',
                          is_approved: true,
                          approved_by: 'Admin1')
products[0].pictures.attach([{ io: File.open('./app/assets/images/products/brown-sofa/brown-sofa1.jpg'),
                               filename: 'brown-sofa1.jpg',
                               content_type: 'image/jpeg' },
                             { io: File.open('./app/assets/images/products/brown-sofa/brown-sofa2.jpg'),
                               filename: 'brown-sofa2.jpg',
                               content_type: 'image/jpeg' },
                             { io: File.open('./app/assets/images/products/brown-sofa/brown-sofa3.jpg'),
                               filename: 'brown-sofa3.jpg',
                               content_type: 'image/jpeg' }])
products[0].save

products[1] = Product.new(title: 'Harry Potter Book Series',
                          description: 'Random Description of Harry potter book series',
                          price: 1500,
                          user_id: 3,
                          category_id: 2,
                          city: 'Siliguri',
                          phone_number: '1234567892',
                          is_approved: true,
                          approved_by: 'Admin2')
products[1].pictures.attach([{ io: File.open('./app/assets/images/products/hp-books/hp-book1.jpg'),
                               filename: 'hp-book1.jpg',
                               content_type: 'image/jpeg' },
                             { io: File.open('./app/assets/images/products/hp-books/hp-book2.jpg'),
                               filename: 'hp-book2.jpg',
                               content_type: 'image/jpeg' },
                             { io: File.open('./app/assets/images/products/hp-books/hp-book3.jpg'),
                               filename: 'hp-book3.jpg',
                               content_type: 'image/jpeg' }])
products[1].save

products[2] = Product.new(title: 'Night Lamp',
                          description: 'Random Description of a night lamp',
                          price: 1000,
                          user_id: 5,
                          category_id: 4,
                          city: 'Delhi',
                          phone_number: '1234567893',
                          is_approved: true,
                          approved_by: 'Admin1')
products[2].pictures.attach([{ io: File.open('./app/assets/images/products/night-lamp/nightlamp1.jpg'),
                               filename: 'nightlamp1.jpg',
                               content_type: 'image/jpeg' },
                             { io: File.open('./app/assets/images/products/night-lamp/nightlamp2.jpg'),
                               filename: 'nightlamp2.jpg',
                               content_type: 'image/jpeg' },
                             { io: File.open('./app/assets/images/products/night-lamp/nightlamp3.jpg'),
                               filename: 'nightlamp3.jpg',
                               content_type: 'image/jpeg' },
                             { io: File.open('./app/assets/images/products/night-lamp/nightlamp4.jpg'),
                               filename: 'nightlamp4.jpg',
                               content_type: 'image/jpeg' }])
products[2].save

products[3] = Product.new(title: 'Smart phone',
                          description: 'Random Description of a smart phone',
                          price: 3000,
                          user_id: 4,
                          category_id: 5,
                          city: 'Kolkata',
                          phone_number: '1234567894',
                          is_approved: true,
                          approved_by: 'Admin2')
products[3].pictures.attach([{ io: File.open('./app/assets/images/products/mobile/samsung1.jpg'),
                               filename: 'samsung1.jpg',
                               content_type: 'image/jpeg' },
                             { io: File.open('./app/assets/images/products/mobile/samsung2.jpg'),
                               filename: 'samsung2.jpg',
                               content_type: 'image/jpeg' },
                             { io: File.open('./app/assets/images/products/mobile/samsung3.jpg'),
                               filename: 'samsung3.jpg',
                               content_type: 'image/jpeg' }])
products[3].save
