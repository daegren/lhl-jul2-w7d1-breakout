class Actor
  def choose_target(targets)
    targets.sample
  end
end

class PlayerActor
  def choose_target(targets)
    puts print_targets(targets)

    selection = gets.chomp.to_i - 1

    targets[selection]
  end

  private

  def print_targets(targets)
    target_strs = targets.map.with_index {|t, i| "#{i + 1}: #{t.name}"}.join("\n")

    """
===== Pick a target: =====
#{target_strs}
=====                =====
    """
  end
end

class StrongAIActor
  def choose_target(targets)
    targets.sort {|a, b| a.health <=> b.health }.first
  end
end
