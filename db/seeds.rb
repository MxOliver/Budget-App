require 'random_data'

5.times do
    User.create!(
        name: RandomData.random_name,
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

puts "Seeds finished"
puts "#{User.count} users created"
puts "#{Expense.count} expenses created"