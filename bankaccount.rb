
class BankAccount
@@interestrate = 0.4
@@accounts = []


  def initialize
    @balance = 0
  end

  def balance
    @balance
  end

  def balance=(balance)
    @balance = balance
  end

  #
  def deposit(depo)
    @balance += depo
    return @balance
  end

  #
  def withdraw(draw)
    @balance -= draw
    return @balance
  end
  #
   def self.create
     account = BankAccount.new
     @@accounts << account
     return account
  end



    def self.total_funds
      total_funds = 0
      @@accounts.each do |account|
      total_funds += account.balance
      end
      return total_funds
    end


    def self.interest_time
      interest = 0
        @@accounts.each do |account|
          account.balance *= (1+ @@interestrate)
        end
      end
  end




p bibek = BankAccount.create
p john = BankAccount.create
p bibek.balance
p john.balance
p bibek.deposit(200)
p john.deposit(1000)
p bibek.balance
p john.balance
p BankAccount.total_funds
p BankAccount.interest_time
