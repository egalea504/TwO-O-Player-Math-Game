class Player
  attr_reader :name, :lives
  def initialize(name)
    @name = name
    @lives = 3
  end

  def life_lost
    @lives = @lives - 1
  end

  def dead
    @lives == 0
  end

end
