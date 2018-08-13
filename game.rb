require './robot.rb'
require './turn_manager.rb'

class Game
  def initialize
    @robot1 = Robot.new('Bender')
    @robot2 = Robot.new('Lt Cmd Data')
    @robot3 = Robot.new('Calculon')
    @turn_manager = TurnManager.new(self.robots)
  end

  def robots
    [@robot1, @robot2, @robot3]
  end

  def summary
    summary = robots.map { |r| r.summary }.join("\n")
    """
----- SUMMARY -----
#{summary}
-------------------
    """
  end

  def game_over?
    robots.any? {|r| r.dead? }
  end

  def find_winner
    robots.select { |r| !r.dead? }.first
  end

  def run
    while !game_over?
      turn = @turn_manager.next_turn

      puts
      puts "#{turn.attacker.name}'s Turn!"
      puts
      puts "👊  #{turn.attacker.name} is attacking #{turn.defender.name}!"

      turn.attacker.attack(turn.defender)

      puts summary

      sleep 0.5
    end

    winner = find_winner
    puts "#{winner.name} has HAS WON THE ROBOT FIGHT!!"
  end
end
