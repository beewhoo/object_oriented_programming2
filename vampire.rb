class Vampire
  @@coven = []


#initialize
  def initialize(name, age)
    @name = name
    @age = age
    @in_coffin = false
    @drank_blood_today = false

  end

  def in_coffin
    @in_coffin
  end

  def in_coffin=(value)
    @in_coffin = (value)
  end


  def self.all
    @@coven
  end


  def self.create(name, age)
    temp = Vampire.new(name, age)
    @@coven << temp
    return temp
  end

  def drank_blood
    @drank_blood_today = true
  end

  def in_coffin
    @in_coffin
  end

  def self.sunrise
      removed = []
      @@coven.each do |cove|
        if cove.in_coffin == false || cove.drank_blood == false
          removed << cove
        end
      end
    removed.each do |dead|
     @@coven.delete(dead)
    end
    return @@coven
end


    def self.sunset
      @@coven.each do |cove|
      @drank_blood_today = false
      @in_coffin = false
      end
    end

    def go_home
      @in_coffin = true
    end


end







Vampire.create('jason', 50)
Vampire.create('drake', 30)
Vampire.create('carl', 10)

vamp1 = Vampire.create('michael', 50)
p vamp1.drank_blood
p vamp1.go_home


#
p Vampire.all
#
puts '-------------------------------'
p Vampire.sunrise
puts '--------------------------------'
p Vampire.all
