require 'random_data'

5.times do
    User.create!(
        username: RandomData.random_word,
        password: RandomData.random_word,
        total_income: RandomData.random_number
    )
end

users = User.all

50.times do
    Expense.create!(
        user: users.sample,
        name: RandomData.random_expense,
        planned_amount: RandomData.random_number
    )
end

user = User.first
user.update_attributes!(
    username: "mxoliver",
    password: "K3rmitc0de"
)

puts "Seeds finished"
puts "#{User.count} users created"
puts "#{Expense.count} expenses created"