module RandomData

    def self.random_name
        names = ['Oliver', 'Marcus', 'Sid', 'Aubrey', 'Blue']
        name = names.sample
    end

    def self.random_number
        numbers = rand(35..6000)
    end

    def self.random_expense
        expenses = ['Food', 'Savings', 'Transportation', 'Rent', 'Personal', 'Insurance']
        expense = expenses.sample
    end

end

