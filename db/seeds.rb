# In a perfect world initial data could be created using factories OR by importing some dump which is close to prod
Grocery.create!(name: 'Beer, Wine & Spirits')
puts 'Groceries'

Supplier.create!(name: 'Lidl', grocery: Grocery.first)
puts 'Suppliers'

Category.create!(name: 'Beer', grocery: Grocery.first)
Category.create!(name: 'Wine', grocery: Grocery.first)
puts 'Categories'

Product.create!(name: 'Bud', sku: SecureRandom.hex(8), supplier: Supplier.first, category: Category.find_by(name: 'Beer'), price: 4.99)
Product.create!(name: '1715', sku: SecureRandom.hex(8), supplier: Supplier.first, category: Category.find_by(name: 'Beer'), price: 7)
puts 'Products'

User.create!(first_name: 'Orest', last_name: 'Palyj', email: 'orest@gmail.com', password: 'password123', password_confirmation: 'password123',
            address: '313 Raoul Wallenberg Place, Orange, CT 06477')
puts 'Users'

Order.create!(product: Product.first, user: User.first, issue_time: 12.hours.ago, delivery_time: 5.minutes.ago,
             deliver_until: 2.days.from_now, qty: 2, sku: SecureRandom.hex(8))
puts 'Orders'
