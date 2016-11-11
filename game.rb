class Game

  attr_reader :player1, :player2, :current_player

  def initialize
    puts "Enter first player name: "
    # player1name = gets.chomp
    @player1 = Player.new(gets.chomp)
    puts "Enter second player name: "
    # player2name = gets.chomp
    @player2 = Player.new(gets.chomp)
    @current_player = @player1
    # puts "Initialized name current  #{@current_player.name}"
  end

  def start
    while @player1.lives > 0 && @player2.lives > 0
      ask_question
    end
      puts "#{@current_player.name} loses!"
  end

  def switch_player
    if @current_player == @player1
      @current_player = @player2
      puts "Switched to ... #{@current_player.name}"
    else
      @current_player = @player1
      puts "Switched to ... #{@current_player.name}"
    end
  end

  def ask_question

    q = Question.new
    puts
    puts "#{current_player.name} it is your turn."
    puts "#{q.generate_question}"
    player_answer = gets.chomp
    result = q.verify_answer(player_answer)

    if result == true
      puts "That is correct!! Good job! Fluke though!"
      puts "#{@current_player.name} score: #{current_player.lives}"
    else
      puts
      puts "You are wrong!! Leonidas! Bad job! Why are you in this program?!"
      # puts 
      @current_player.lives -= 1
      puts
      puts "#{current_player.name}'s score: #{current_player.lives}"
      puts

    end

    switch_player

  end


end