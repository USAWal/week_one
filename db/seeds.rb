# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create email: 'my@email.com', password: '12345678'
FactoryGirl.create_list :user, 30
owners = User.order('random()').first 7
FactoryGirl.build_list(:shop, 15).each do |shop|
  shop.update! owner: owners.shuffle.first
end
FactoryGirl.create_list :category, 15

FactoryGirl.build_list(:product, 1000, seller: nil).each_with_index do |product, index|
  product.update! seller: User.order('random()').first
  product.categories << Category.order('random()').first(rand 7)
end
product = Product.first
product.remote_pictures_urls = [Faker::Avatar.image('first', "200x200"), Faker::Avatar.image('second', "200x200")]
product.save!
pictures = product.reload.pictures
Product.find_each do |product|
  product.pictures = pictures
  product.save!
end
User.find_each do |user|
  max = user.products.count
  user.shops.find_each do |shop|
    shop.products << user.products.order('random()').first(rand max)
  end
end
