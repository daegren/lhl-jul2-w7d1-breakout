require './robot.rb'

class Game
  def initialize
    @robot1 = Robot.new('Bender')
    @robot2 = Robot.new('Lt Cmd Data')
    @current_robot = @robot1
  end

  def robots
    [@robot1, @robot2]
  end

  def get_target(current_robot)
    if current_robot == @robot1
      @robot2
    else
      @robot1
    end
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
      puts
      puts "#{@current_robot.name}'s Turn!"
      puts

      target = get_target(@current_robot)

      puts "👊  #{@current_robot.name} is attacking #{target.name}!"

      @current_robot.attack(target)

      puts summary
      if @current_robot == @robot1
        @current_robot = @robot2
      else
        @current_robot = @robot1
      end

      sleep 0.5
    end

    winner = find_winner
    puts "#{winner.name} has HAS WON THE ROBOT FIGHT!!"
  end
end
