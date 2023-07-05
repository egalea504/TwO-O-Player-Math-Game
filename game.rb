require './player'
require './question'

class Game
  def initialize(name)
    @name = name
    @player_1 = Player.new('Player 1')
    @player_2 = Player.new('Player 2')
  end
  
  #first output in the game - called in main.rb
  def start_game
    puts "----- GAME START -----"
    taking_turn
  end

  def stats
    puts "P1: #{@player_1.lives}/3 vs P2: #{@player_2.lives}/3"
  end

  #end game if one of the players doesn't have a life anymore
  def score
    if @player_1.dead
      winner(@player_2)
    elsif @player_2.dead
      winner(@player_1)
    end
  end

  def winner(player)
    puts "#{player.name} wins with a score of #{player.lives}/3"
    puts "----- GAME OVER -----"
    puts "Good bye!"
    exit(0)
  end

  def taking_turn
    #getting random question for both players in each turn
    question_1 = Question.new
    question_2 = Question.new

    puts question_1.ask_question(@player_1.name)
    print " >"
    user_choice = $stdin.gets.chomp.to_i
    if question_1.answer_check(user_choice)
      puts "Yes! You are correct."
    else
      puts "Seriously? No."
      @player_1.life_lost
    end

    score


    puts question_2.ask_question(@player_2.name)
    print " >"
    user_choice = $stdin.gets.chomp.to_i
    if question_2.answer_check(user_choice)
      puts "Yes! You are correct."
    else
      puts "Seriously? No."
      @player_2.life_lost
    end


    score
    stats
    puts "----- NEW TURN -----"
    taking_turn unless score
  end
end
    