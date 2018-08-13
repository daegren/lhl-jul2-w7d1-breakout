class TurnManager
  def initialize(players)
    @players = players.dup
  end

  def next_turn
    attacker = get_attacker
    defender = get_defender(attacker)

    @players.rotate!

    Turn.new(attacker, defender)
  end

  private

  def get_attacker
    @players.first
  end

  def get_defender(attacker)
    @players.select {|p| p != attacker }.sample
  end
end

class Turn
  attr_reader :attacker, :defender

  def initialize(attacker, defender)
    @attacker = attacker
    @defender = defender
  end
end
