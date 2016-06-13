# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = FactoryGirl.create(:user)
user2 = FactoryGirl.create(:user)

50.times do
  user = [user1, user2]
  index = rand(0..1)
  FactoryGirl.create(:message, sender: user[index], receiver: user[index == 0 ? 1 : 0])
end
