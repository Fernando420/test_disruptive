# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(email: 'fernando@disruptive.com',name: 'Fernando Morales',phone: '1234567890', password: 'Fercho1$')


Currency.create!(name: "Bitcoin",short_name: "BTC", monthly_interest: 5)
Currency.create!(name: "Ethereum",short_name: "ETH", monthly_interest: 3)