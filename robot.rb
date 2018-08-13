class Robot
  attr_reader :name, :health

  def initialize(name, power = 10)
    @name = name
    @health = 50
    @power = power
  end

  def dead?
    @health <= 0
  end

  def attack(other_robot)
    damage = rand(@power) + 1

    puts "#{name} does #{damage} damage to #{other_robot.name}"
    other_robot.take_damage(damage)
  end

  def take_damage(amount)
    @health -= amount
  end

  def summary
    "#{name}: #{@health} HP (#{@power} AP)"
  end
end
