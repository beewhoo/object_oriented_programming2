class Book

  @@on_shelf = []
  @@on_loan = []
  @@current_due_date = Time.new



    #reader_method
    def due_date
      @due_date
    end

    #writer_method

    def due_date=(due_date)
      @due_date = due_date
    end


    #initialize
    def initialize (booktitle, author, isbn)
      @booktitle = booktitle
      @author = author
      @isbn = isbn
      @due_date = nil


    end

    #class_method
    def self.create(booktitle, author, isbn )
      newbook =  Book.new(booktitle, author, isbn)
      @@on_shelf << newbook
      return newbook
    end

    def self.available
      @@on_shelf
    end

    def self.borrowed
      @@on_loan
    end
    #
    def self.browse
      @@on_shelf.sample
    end

    def self.current_due_date
      @@current_due_date = Time.new
      return @@current_due_date
    end

    def return_to_library
      if self.lent_out? == true
        @@on_shelf << self
        @@on_loan.delete(self)
        @due_date = nil
        return true
      else
      return false
    end
  end


    def self.overdue
      overdues = []
      @@on_loan.each do |book|
      if Time.now == @due_date
        overdue << book
      end
    end
    return overdues
  end
    #instance_method

    def lent_out?
      if @@on_loan.include?(self)
      return true
    end
    end

    def borrow
      if lent_out?
        return false
      else
        @due_date = Time.now + 100000
        @@on_shelf.delete(self)
        @@on_loan << self
        return true

      end
    end



end

p abc = Book.create('abc','adam', 123)
p cde = Book.create('cde','bob', 456)
p fgh = Book.create('fgh','carl', 789)
p one = Book.create('Bob', 'Bob', 104018401284012)
p Book.available
p Book.borrowed
p Book.browse



p one.lent_out?

p Book.current_due_date
p cde.borrow
p cde.due_date
puts '----------------------------------'
p Book.borrowed

p cde.lent_out?

p abc.return_to_library
p Book.overdue
