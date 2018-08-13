class Robot
  attr_reader :name, :health
  MAX_HEALTH = 50

  def initialize(name, power = 10)
    @name = name
    @health = MAX_HEALTH
    @power = power
  end

  def dead?
    @health <= 0
  end

  def berserk?
    @health <= MAX_HEALTH * 0.2
  end

  def attack(other_robot)
    damage = rand(@power) + 1
    if berserk?
      puts "😡 #{name} is GOING BERSERK!"
      damage *= 2
    end

    puts "#{name} does #{damage} damage to #{other_robot.name}"
    other_robot.take_damage(damage)
  end

  def take_damage(amount)
    @health -= amount
  end

  def summary
    "#{name}: #{@health} HP (#{@power} AP)#{berserk? ? " Going Berserk!" : ""}"
  end
end
