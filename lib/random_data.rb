module RandomData

    def self.random_name
        names = ['oliver', 'marcus', 'sid', 'aubrey', 'blue']
        name = names.sample
    end

    def self.random_word
        letters = ('a'..'z').to_a
        letters.shuffle!
        letters[0,rand(6..12)].join
    end


    def self.random_number
        numbers = rand(6000)
    end

    def self.random_expense
        expenses = ['Food', 'Savings', 'Transportation', 'Rent', 'Personal', 'Insurance']
        expense = expenses.sample
    end

end

