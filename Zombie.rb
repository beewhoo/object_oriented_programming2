class Zombie
  #class varriables
  @@horde = []
  @@plague_level = 10
  @@max_speed = 5
  @@max_strength = 8
  @@default_speed = 1
  @@default_strength = 3

  #instance methods
    def initialize (speed, strength)
      if speed > @@max_speed
        @speed = @@default_speed
      else
        @speed = speed
      end

      if strength >= @@max_strength
        @strength = @@default_strength
      else
        @strength = strength
      end

    end

    def encounter
      # 3 outcomes
      # 1= escape
      # 2= killed
      # 3 = catch plague
    end

      def outrun_zombie?
        random = rand(@@max_speed)
        if @speed > random
        return false
        else
        return true
      end
    end


    def surive_attack?
      random = rand(@@max_strength)
      if @strength > random
      return false
      else
      return true
    end
    end



  #class methods

  def self.all
    @@horde
  end


  def self.new_day
    self.some_die_off
    self.spawn
    self.increase_plague_level
  end
  #
  def self.some_die_off
  random = rand(0..10)
  random.times {@@horde.delete_at(0)}

  end

  def self.spawn
    a = 0
    new_zombies = rand(@@plague_level)
    while a < new_zombies do
    speed = rand(@@max_speed)
    strength = rand(@@max_strength)
      temp = Zombie.new(speed, strength)
      a += 1
    @@horde << temp
    end
  end


  def self.increase_plague_level
    @@plague_level += rand(2)
  end





end

# p Zombie.new(4, 6)
# p Zombie.spawn
# p Zombie.all


zom1 = Zombie.new(5, 5)
puts "--------------------------"
p zom1.outrun_zombie?
p zom1.surive_attack?

# p Zombie.some_die_off
# p Zombie.all
#
# puts '----------------------------'
# p Zombie.new_day
# p Zombie.all
# p Zombie.all
#
# # puts '----------------------------'
# #
# p Zombie.some_die_off
# p Zombie.all


# p Zombie.all
